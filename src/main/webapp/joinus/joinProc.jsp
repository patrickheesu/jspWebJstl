<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String pwd2 = request.getParameter("pwd2");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String birth = String.format("%s-%s-%s",year,month,day);
	
	String is_lunar = request.getParameter("is_lunar");
	String cphone = request.getParameter("cphone");
	String email = request.getParameter("email");
	String[] habits = request.getParameterValues("habit");
	String habit = "";
	if(habits != null){
		for(int i = 0; i < habits.length; i++){
			habit+=habits[i];
			if(habits.length > i + 1){
				habit+=",";
			}
		}
	}
	
	List<String> errors = new ArrayList();
	if(id == null || id.equals(""))
		errors.add("아이디 없음");
	if(!pwd.equals(pwd2))
		errors.add("비밀번호 불일치");
	if(errors.size() > 0){
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("join.jsp").forward(request, response);
	} else {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "123456";

		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,user,pw);

		String sql = "insert into nmember(id,pwd,name,gender,birth,is_lunar,cphone,email,habit,regdate)"
	 				+ "values(?,?,?,?,?,?,?,?,?,sysdate)";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,pwd);
		pstmt.setString(3,name);
		pstmt.setString(4,gender);
		pstmt.setString(5,birth);
		pstmt.setString(6,is_lunar);
		pstmt.setString(7,cphone);
		pstmt.setString(8,email);
		pstmt.setString(9,habit);
		
		pstmt.executeUpdate();
		response.sendRedirect("../index.jsp");
	}
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinProc</title>
</head>
<body>
	<h3>joinProc</h3>
	id : <%=id %> <br />
	pwd : <%=pwd %> <br />
	pwd2 : <%=pwd2 %> <br />
	gender : <%=gender %> <br />
	birth : <%=birth %> <br />
	email : <%=email %> <br />
	habit : <%=habit %> <br />
	
</body>
</html>