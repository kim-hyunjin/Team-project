<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 상세 정보</title>
</head>
<body>
<h1>수업 상세정보</h1>
<jsp:useBean id="clazz" type="Team.project.domain.Clazz" scope="request"/>
<form action='update' method='post'>
  번호 : <input name='classNo' type='number' readonly value='${clazz.classNo}'><br>
  수업명 : <input name='description' type='text' value='${clazz.name}'><br>
  설명<br>
  <textarea name='description'>${clazz.description}</textarea><br>
  강의실 : <input name='room' type='text' value='${clazz.room}'><br>
  수업코드 : <input name='room' type='text' value='${clazz.classCode}'><br>
  시작일 : ${clazz.createDate}<br>
  <button>변경</button>
</form>

</body>
</html>