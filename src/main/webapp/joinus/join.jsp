<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>
	<form action="joinProc.jsp" >
	
		<p style="color: red;">
			<%
				if(request.getAttribute("errors") != null){
					List<String> errors = (List)request.getAttribute("errors");
					for(int i = 0; i < errors.size(); i++) {
			%>
					<%=errors.get(i) %> <br />	
			<%
					}
						
				}
			%>
		</p>
	
		아이디 : <input type="text" name="id"/>
		<input type="button" value="중복 확인" /> <br />
		비밀번호 : <input type="text" name="pwd" /> <br />
		비밀번호 확인 : <input type="text" name="pwd2" /> <br />
		이름 : <input type="text" name="name" /> <br />
		성별 
		<select name="gender" id="gender">
			<option value="남성">남성</option>
			<option value="여성">여성</option>
		</select> <br />
		생년월일 
		<input type="text" name="year" size="5" />년
		<input type="text" name="month" size="5" />월
		<input type="text" name="day" size="5" />일
		<input type="radio" name="is_lunar" value="solar" checked />양력
		<input type="radio" name="is_lunar" value="islunar" />음력 <br />
		휴대전화 번호 : <input type="tel" name="cphone" /> ex) 010-1234-5678 <br />
		이메일 : <input type="email" name="email" /> <br />
		취미 : 
		<input type="checkbox" name="habit" value="music"/>음악
		<input type="checkbox" name="habit" value="movie"/>영화
		<input type="checkbox" name="habit" value="trip"/>여행 <br />
		
		<input type="submit" value="완료" /> <br />
	</form>
</body>
</html>