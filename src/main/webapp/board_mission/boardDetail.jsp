<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.getParameter("UTF-8");
	
	String bno = request.getParameter("c");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String pw = "123456";

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, pw);
	String sql = "select * from board where bno=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bno);
	
	ResultSet rs = pstmt.executeQuery();
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDetail</title>
<link rel="stylesheet" href="../css/bstyle.css" />
</head>
<body>
<h3>boardDetail_정희수</h3>
	<table class="twidth">
		<colgroup>
			<col width=15%/>
			<col width=35%/>
			<col width=5%/>
			<col width=35%/>
		</colgroup>
		<caption>Detail</caption>
		<tbody>
			<tr>
				<th class="left" >글 번호</th>
				<td><%=rs.getString("bno") %></td>
				<th class="left" >조회수</th>
				<td><%=rs.getString("bcnt") %></td>
			</tr>
			<tr>
				<th class="left" >작성자</th>
				<td><%=rs.getString("bwriter") %></td>
				<th class="left" >작성 시간</th>
				<td><%=rs.getString("bdate") %></td>
			</tr>
			<tr>
				<th class="left" >제목</th>
				<td colspan="3" id="bsubj"><%=rs.getString("bsubj") %></td>
			</tr>
			<tr>
				<th class="left" >내용</th>
				<td colspan="3" id="bmemo"><%=rs.getString("bmemo") %></td>
			</tr>
			<tr>
				<th class="left" >첨부</th>
				<td colspan="3" id="addfile">첨부</td>
			</tr>
		</tbody>
	</table>
	<a href="boardEdit.jsp?c=<%=rs.getString("bno") %>">수정</a>
	<a href="boardDelProc.jsp?c=<%=rs.getString("bno") %>">삭제</a>
	<a href="board.jsp">목록</a>
	
</body>
</html>
<% 
	rs.close();
	pstmt.close();
	conn.close();
%>