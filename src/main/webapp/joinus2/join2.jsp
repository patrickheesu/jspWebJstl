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
<title>join2</title>
</head>
<body>
	<form action="joinProc2.jsp" method="post">
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
		아이디 : <input type="text" name="tid"/>
		<input type="button" value="중복 확인" /> <br />
		비밀번호 : <input type="text" name="tpwd" /> <br />
		비밀번호 확인 : <input type="text" name="tpwd2" /> <br />
		이름 : <input type="text" name="tname" /> <br />
		성별 
		<select name="tgender" id="tgender">
			<option value="남성">남성</option>
			<option value="여성">여성</option>
		</select> <br />
		생년월일 
		<input type="text" name="tyear" size="5" />년
		<input type="text" name="tmonth" size="5" />월
		<input type="text" name="tday" size="5" />일
		<input type="radio" name="tis_lunar" value="tsolar" checked />양력
		<input type="radio" name="tis_lunar" value="tislunar" />음력 <br />
		휴대전화 번호 : <input type="tel" name="tcphone" /> ex) 010-1234-5678 <br />
		이메일 : <input type="email" name="temail" /> <br />
		취미 : 
		<input type="checkbox" name="thabit" value="game"/>게임
		<input type="checkbox" name="thabit" value="food"/>맛집 탐방
		<input type="checkbox" name="thabit" value="beer"/>술
		<input type="checkbox" name="thabit" value="karaoke"/>코노 <br />
		
		<input type="submit" value="완료" /> <br />
	</form>
</body>
</html>