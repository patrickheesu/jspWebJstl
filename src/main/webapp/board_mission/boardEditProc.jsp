<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String bsubj = request.getParameter("bsubj");
	String bmemo = request.getParameter("bmemo");
	String bno = request.getParameter("c");
%>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url, user, pw);
String sql = "update board set bsubj=?,bmemo=? where bno=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, bsubj);
pstmt.setString(2, bmemo);
pstmt.setString(3, bno);
int cnt = pstmt.executeUpdate();

response.sendRedirect("boardDetail.jsp?c=" + bno);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardEditProc.jsp</title>
</head>
<body>
	<h3>boardEditProc</h3>
</body>
</html>