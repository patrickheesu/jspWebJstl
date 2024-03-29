package notice.controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeDetailController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
				System.out.println("NoticeDetailController pass"); 
				String seq = request.getParameter("c"); 
				NoticeDao dao = new NoticeDao(); 
				Notice n = dao.getNotice(seq);
				
				request.setAttribute("n", n);
				
				request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
		}
		
	}

	
	 
	

