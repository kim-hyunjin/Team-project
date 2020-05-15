<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/Team-project/css/style.css" />
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
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
          window.location.href="../../auth/logout";
        })
      }
    </script>

    <!-- 라이브러리 추가 -->
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

<!-- 구글 메타 태그 추가 -->
<meta name = "google-signin-client_id"
content = "360175730868-7161sh4v73h0hsufdvgmoa9u3o25oi21.apps.googleusercontent.com">  
    <script>
    function signOut() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
          console.log('User signed out.');
          auth2.disconnect();
          window.location.href="../../auth/logout";
        });
      }
    
    function onLoad() {
        gapi.load('auth2', function() {
          gapi.auth2.init();
        });
      }
      </script>
    </head>
    <body>
    <div class="container">
        <div class="header room_header">
            <div class="room_header__column">
                <a href="#"><i class="fas fa-bars" style="font-size:1.2em; margin-right: 0.8em;"></i></a>
                <a href="../../clazz/list"><span>${clazzNow.name}</span></a>
            </div>
            <div class="room_header__column">
                <a href="../lesson/list?room_no=${clazzNow.classNo}"><span class="room_header__menu">수업</span></a>
                <a href="../user/list?room_no=${clazzNow.classNo}"><span class="room_header__menu">사용자</span></a>
                <a href="../grade/list?room_no=${clazzNow.classNo}"><span class="room_header__menu">성적</span></a>
                <a href="../board/list"><span class="room_header__menu">게시판</span></a>
            </div>
            <div class="room_header__column">
                <a href="../../clazz/detail"><i class="fas fa-cog" style="font-size: 1.2em;"></i></a>
                <c:if test="${not empty loginUser}">
                    <div class="header__user">
                        <c:if test="${not empty loginUser.profilePhoto}">
				            <c:if test="${loginUser.loginMethod > 0}">
				                <span class="header__user__photo"><img src='${loginUser.profilePhoto}'></span>
				            </c:if>
				            <c:if test="${loginUser.loginMethod == 0}">
				                <span class="header__user__photo"><img src='${pageContext.servletContext.contextPath}/upload/user/thumbnail.${loginUser.profilePhoto}.jpg'></span>
				            </c:if>
                        </c:if>
                        <c:if test="${empty loginUser.profilePhoto}">
                            <i class="far fa-user" style="font-size:1.5em; margin-right: 0.3em;"></i>
                        </c:if>
                        <span><a href="${pageContext.servletContext.contextPath}/app/user/detail?userNo=${loginUser.userNo}">${loginUser.name}</a></span>
                    </div>
                  <c:if test="${loginUser.loginMethod == 2}">
                    <a href="#" onclick="signOut();">Sign out</a>
                  </c:if>
                  <c:if test="${loginUser.loginMethod == 0}">
	                   <a href="../../auth/logout">logout</a>
	                </c:if>
	                <c:if test="${loginUser.loginMethod == 1}">
	                   <button class="api-btn" onclick="kakaoLogout()">logout</button>
	                </c:if>
	            </c:if>
            </div>
        </div>
