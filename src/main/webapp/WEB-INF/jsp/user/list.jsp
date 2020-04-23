<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../css/style.css" />
<script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
</head>
<body>
	  <h1>유저목록</h1>
	  <a href='form'>유저등록</a>
	  <form action='search' method='get'>
	    <input name='keyword' type='text' placeholder="유저 검색">
	    <button>검색</button>
	  </form>
	<c:forEach items="${users}" var="user">
	   ${user.userNo}, ${user.email}, <a href='detail?no=${user.userNo}'>${user.name}</a><br>
	</c:forEach>
</body>
</html>

