package notice.controller.customer;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.Controller;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeRegProcController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				System.out.println("NoticeRegProcController pass"); 
				
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				
				Notice n = new Notice();
				n.setTitle(title);
				n.setContent(content);
				NoticeDao dao = new NoticeDao();
				int af = dao.insert(n);
				
				
				PrintWriter out = response.getWriter();
				if(af > 0) {
					response.sendRedirect("notice.jsp");
				} else {
					out.println("글쓰기 오류");
				}
				
				request.getRequestDispatcher("notice.jsp").forward(request, response);
				
		}
	
}
