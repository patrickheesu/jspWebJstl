<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>func</h3>
<h4>split</h4>
<c:set var="str1" value="Java|Android|Spring|Jsp|Servlet"/>
<c:set var="splitStr" value="${fn:split(str1,'|') }"/>

<ul>
	<c:forEach var="str" items="${splitStr }">
		<li>${str }</li>
	</c:forEach>
</ul>
<br />
<h4>subString</h4>
<c:set var="str1" value="Hello World"/>
<c:set var="subStr1" value="${fn:substringBefore(str2, 'test') }"/>
<c:set var="subStr2" value="${fn:substringBefore(str2, 'This') }"/>
<c:out value="subStr1 - ${subStr1 }" /> <br />
<c:out value="subStr2 - ${subStr2 }" />  <br />

</body>
</html>