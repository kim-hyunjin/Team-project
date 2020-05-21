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
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
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
          window.location.href="../auth/logout";
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
  <div class="header main_header">
    <div class="main_header__column">
      <a href="#"><i class="fas fa-bars" style="font-size:1.2em; margin-right: 0.8em;"></i></a>
      <span style="font-weight:600; font-size:1.5em;">BTS</span>
    </div>
    <div class="main_header__column">
      <c:if test="${loginUser.alterKey == 'Y' }">
      <span><a href="../calendar/calendar">캘린더</a></span>
      <span data-toggle="modal" data-target="#classJoin" style="cursor:pointer;">수업 참여</span>
      <span data-toggle="modal" data-target="#makeClass"  style="cursor: pointer;">수업 만들기</span>
      </c:if>
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
             <a href="../auth/logout">logout</a>
          </c:if>
          <c:if test="${loginUser.loginMethod == 1}">
             <button class="api-btn" onclick="kakaoLogout()">logout</button>
          </c:if>
        </c:if>
    </div>
  </div>
  
  <!-- Modal -->
<div class="modal fade" id="classJoin" tabindex="-1" role="dialog" aria-labelledby="classJoinLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="classJoinLabel">수업 참여</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <input id="modal-code" name="code" type="text" placeholder="수업 코드를 입력하세요." style="width:100%;">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="join-modal-close">Close</button>
        <button type="button" class="btn btn-primary" id="joinBtn">Join</button>
      </div>
    </div>
  </div>
</div>

  <!-- Modal -->
<div class="modal fade" id="makeClass" tabindex="-1" role="dialog" aria-labelledby="makeClassLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="makeClassLabel">수업 만들기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="createForm" action='add' method='post'>
          <input id="modal-name" name='name' type='text' placeholder="수업명" style="width:100%;"> 
          <input id="modal-description" name='description' type='text' placeholder="설명" style="width:100%;"> 
          <input id="modal-room" name='room' type='text' placeholder="강의실" style="width:100%;">
        </form>  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="create-modal-close">Close</button>
        <button type="button" class="btn btn-primary" id="createBtn">Create</button>
      </div>
    </div>
  </div>
</div>
  