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
	<h1>수업 변경</h1>
	<form action='update' method='post'>
		 번   호 : <input name='classNo' type='number' readonly value='${clazz.classNo}'><br>
		 수업명 : <input name='name' type='text' value='${clazz.name}'><br>
		 설   명 :  <input name ='description' type ='text' value='${clazz.description}'><br>
		 강의실 : <input name='room' type='text' value='${clazz.room}'><br>
		 수업코드 : <input name='classCode' type='text' value='${clazz.classCode}'><br>
		  <button>변경</button>
	</form>
</body>
</html>