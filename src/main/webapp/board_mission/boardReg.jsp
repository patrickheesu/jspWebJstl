<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardReg</title>
</head>
<body>
	<h3>boardReg.jsp</h3>
	
	<form action="boardRegProc.jsp" method="post">
		<dl>
			<dt>제목</dt>
			<dt>
				<input type="text" name="bsubj"/>
			</dt>
		</dl>
		<dl>
			<dt>점부파일</dt>
			<dt>
				<input type="file" name="txtFile"/>
			</dt>
		</dl>
		<div>
			<textarea name="bmemo" id="txtcontent" class="txtcontent">내용을 입력하세요.</textarea>
		</div>
		<input type="submit" value="save" />
		<input type="button" value="cancel" class="cancle" />
	</form>
</body>
</html>