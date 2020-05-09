<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 상세 정보</title>
</head>
<body>
	<h1>수업 코드 변경</h1>
	<form action='update' method='post'>
		 <input name='classNo' type='hidden' readonly value='${clazz.classNo}'><br>
		 <input name='description' type='hidden' value='${clazz.name}'><br>
		 <!--  <input name ='description' type ='hideen' value='${clazz.description}'><br> -->
		  <input name='room' type='hidden' value='${clazz.room}'><br>
		  수업코드 : <input name='room' type='text' value='${clazz.classCode}'><br>
		  <button>변경</button>
	</form>
</body>
</html>