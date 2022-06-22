package notice.controller.customer;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeDelProcController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				System.out.println("NoticeDelProcController pass"); 
				String seq = request.getParameter("c");
				Notice n = new Notice();
				NoticeDao dao = new NoticeDao();
				n.setSeq(seq);
				int af = dao.delete(n);

				PrintWriter out = response.getWriter();
				if(af>0){
					response.sendRedirect("notice.jsp");
				} else {
					out.write("삭제오류");
				}
				
				request.getRequestDispatcher("notice.jsp").forward(request, response);
				
		}
	
}
