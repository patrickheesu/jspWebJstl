<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardRegProc</title>
	<%
		request.setCharacterEncoding("UTF-8");
		String bsubj = request.getParameter("bsubj");
		String bmemo = request.getParameter("bmemo");
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "123456";

		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, user, pw);
		
		String sql = "insert into board(bno,bsubj,bwriter,bmemo,bdate,bcnt)"
				+ " values((select max(to_number(bno)) + 1 from board),?,'Cheong',?,sysdate,0)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,bsubj);
		pstmt.setString(2,bmemo);
		
		pstmt.executeUpdate();
		response.sendRedirect("board.jsp");
	%>
</head>
<body>

</body>
</html>

	<%
	pstmt.close();
	conn.close();
	%>