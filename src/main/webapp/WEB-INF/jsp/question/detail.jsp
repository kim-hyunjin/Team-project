<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 상세 정보</title>
</head>
<body>
	<h1>질문 상세정보</h1>
	<form action='update' method='post'>
		  번호 : <input name='questionNo' type='number' readonly value='${question.questionNo}'><br>
		  <input name='memberNo' type='hidden' value='${question.memberNo}'><br>
		  제목 : <input name="title" type="text" value="${question.title}">
		  <label>내용</label><textarea name='content'>${question.content}</textarea><br>
		  파일 : ${question.filePath} 
		  <input name='filePath' type='file'><br>
		  마감일 : <input name='deadline' type='date' value='${question.deadline}'><br>
		  생성일 : ${question.createDate}<br>
		  <button>변경</button>
	</form>
	<a href="delete?no=${question.questionNo}">삭제</a>

</body>
</html>