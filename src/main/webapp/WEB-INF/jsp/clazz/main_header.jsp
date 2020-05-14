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
<script src="/Team-project/script/kakao.js"></script>
    <script>
        Kakao.init('e42d7bc3930faad4ef83d4fb783cf136');
        console.log(Kakao.isInitialized());
        function kakaoLogout() {
        if (!Kakao.Auth.getAccessToken()) {
          return
        }
        Kakao.Auth.logout(function() {
        	window.location.href="../auth/logout";
        })
      }
    </script>
</head>
<body>
<div class="container">
  <div class="header main_header">
    <div class="main_header__column">
      <a href="#"><i class="fas fa-bars" style="font-size:1.2em; margin-right: 0.8em;"></i></a>
      <span style="font-weight:600; font-size:1.5em;">BTS</span>
    </div>
    <div class="main_header__column">
      <span><a href="../calendar/calendar">캘린더</a></span>
      <span id="assignClass" style="cursor:pointer;">수업 참여</span>
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
          <c:if test="${loginUser.loginMethod == 0}">
             <a href="../auth/logout">logout</a>
          </c:if>
          <c:if test="${loginUser.loginMethod == 1}">
             <button class="api-btn" onclick="kakaoLogout()">logout</button>
          </c:if>
        </c:if>
    </div>
  </div>
  