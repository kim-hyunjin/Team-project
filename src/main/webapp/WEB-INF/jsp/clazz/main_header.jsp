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
<script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
  <div class="header main_header">
    <div class="main_header__column">
      <a href="#"><i class="fas fa-bars" style="font-size:1.2em; margin-right: 0.8em;"></i></a>
      <span style="font-weight:600; font-size:1.5em;">BTS</span>
    </div>
    <div class="main_header__column">
      <span><a href= "#">수업 참여</a></span>
      <span><a href="form">수업 추가</a></span>
        <c:if test="${not empty loginUser}">
        <div class="header__user">
          <c:if test="${not empty loginUser.profilePhoto}">
            <span class="header__user__photo"><img src='${pageContext.servletContext.contextPath}/upload/user/thumbnail.${loginUser.profilePhoto}.jpg'></span>
          </c:if>
          <c:if test="${empty loginUser.profilePhoto}">
            <i class="far fa-user" style="font-size:1.5em; margin-right: 0.3em;"></i>
          </c:if>
          <span><a href="${pageContext.servletContext.contextPath}/app/user/detail?userNo=${loginUser.userNo}">${loginUser.name}</a></span>
        </div>
          <a href="../auth/logout">logout</a>
        </c:if>
    </div>
  </div>
  