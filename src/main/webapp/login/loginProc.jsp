<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String pw = "123456";

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,user,pw);
	
	String sql = "select * from nmember where id =?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,id);
	ResultSet rs = pstmt.executeQuery();
	
	String ypass = "";
	int x = -1;
	String msg = "";
	
	if (rs.next()){
		ypass = rs.getString("pwd");
		if (ypass.equals(password)) 
			x = 1;
		else
			x = 0;
	} else {
		x = -1;
	}
	System.out.println("x value : " + x);
	if(x == 1){
		session.setAttribute("sessionID", id);
		msg = "../MainForm.jsp";
	} else if (x == 0) {
		msg = "loginForm.jsp?msg=0";
	} else {
		msg = "loginForm.jsp?msg=-1";
	}
	response.sendRedirect(msg);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginProc.jsp</title>
</head>
<body>
	<h3>loginProc</h3>
	
</body>
</html>