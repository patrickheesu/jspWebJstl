<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	/* String title = request.getParameter("title");
	String content = request.getParameter("content");
	String seq = request.getParameter("c");

	Notice n = new Notice();
	n.setTitle(title);
	n.setContent(content);
	n.setSeq(seq);


	NoticeDao dao = new NoticeDao();
	int cnt = dao.update(n); 

	if(cnt > 0)
		response.sendRedirect("noticeDetail.jsp?c=" + seq);
	else
		out.write("오류"); */

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeEditProc.jsp</title>
</head>
<body>
	<h3>noticeEditProc</h3>
	
</body>
</html>