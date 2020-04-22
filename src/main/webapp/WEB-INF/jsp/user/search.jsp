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
  <h1>회원 검색 결과</h1>
  <c:forEach items="${users}" var="user">
      ${user.userNo}, ${user.email}, 
      <a href='detail?no=${user.userNo}'>${user.name}</a><br>
  </c:forEach>
      <a href='list'>목록으로 돌아가기</a><br>
</body>
</html>

