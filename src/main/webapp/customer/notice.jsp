<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String pw = "123456";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url, user, pw);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>notice</h3>
	<table width="500" border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<%
		Statement st = conn.createStatement();
		String sql = "select * from notices order by to_number(seq) desc";
		ResultSet rs = st.executeQuery(sql);
		
		
		while (rs.next()){
		%>			
		<tr>
			<td><%=rs.getString("seq") %></td>
			<td><a href="noticeDetail.do?c=<%=rs.getString("seq") %>"><%=rs.getString("title") %></a></td>
			<td><%=rs.getString("writer") %></td>
			<td><%=rs.getDate("regdate") %></td>
			<td><%=rs.getInt("hit") %></td>
		</tr>
		<%
		}
		%>
		
	</table>
	
	<a href="noticeReg.jsp">write</a>
</body>
</html>

<% 
rs.close();
st.close();
conn.close();
%>