<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../css/style.css" />
</head>
<style>
  html, body {
  maring:0px;
  padding:0px;
  
  }
</style>
<body>
<div class="container">
  <div class="clazz_header">
    <span style="font-weight:600; font-size:2em;">BTS</span>
    <span><a href="add">수업 추가</a></span>
  </div>
  <div class="clazz_list">
    <c:forEach items="${clazzList}" var="clazz">
        <div class="clazz_card">
            <div class="clazz_name">
              <a href="detail?no=${clazz.classNo}">${clazz.name}</a>
              <span>${clazz.room}</span>
            </div>
          <div class="description">${clazz.description}</div>
        </div>
    </c:forEach>
  </div>
</div>
</body>
</html>
