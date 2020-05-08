<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/Team-project/css/style.css" />
    <script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
    </head>
    <body>
    <div class="container">
        <div class="header room_header">
            <div class="room_header__column">
                <a href="#"><i class="fas fa-bars" style="font-size:1.2em; margin-right: 0.8em;"></i></a>
                <a href="../../clazz/list"><span>${clazzNow.name}</span></a>
            </div>
            <div class="room_header__column">
                <a href="../timeline/list?room_no=${clazzNow.classNo}"><span class="room_header__menu">타임라인</span></a>
                <a href="../lesson/list?room_no=${clazzNow.classNo}"><span class="room_header__menu">수업</span></a>
                <a href="../user/list?room_no=${clazzNow.classNo}"><span class="room_header__menu">사용자</span></a>
                <a href="../grade/list?room_no=${clazzNow.classNo}"><span class="room_header__menu">성적</span></a>
                <a href="../board/list"><span class="room_header__menu">게시판</span></a>
            </div>
            <div class="room_header__column">
                <a href="../clazz/detail"><i class="fas fa-cog" style="font-size: 1.2em;"></i></a>
                <c:if test="${not empty loginUser}">
                    <div class="header__user">
                        <c:if test="${not empty loginUser.profilePhoto}">
                            <span class="header__user__photo"><img src='${pageContext.servletContext.contextPath}/upload/user/thumbnail.${loginUser.profilePhoto}.jpg'></span>
                        </c:if>
                        <c:if test="${empty loginUser.profilePhoto}">
                            <i class="far fa-user" style="font-size:1.5em; margin-right: 0.3em;"></i>
                        </c:if>
                        <span><a href="${pageContext.servletContext.contextPath}/app/user/detail?no=${loginUser.userNo}">${loginUser.name}</a></span>
                    </div>
	                <a href="../../auth/logout">logout</a>
	            </c:if>
            </div>
        </div>
