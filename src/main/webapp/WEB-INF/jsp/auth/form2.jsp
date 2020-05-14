<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../css/style.css" />
<script src="https://kit.fontawesome.com/764f0503e3.js"
	crossorigin="anonymous"></script>
<title>BTS-로그인</title>

<!-- 라이브러리 추가 -->
<script src="https://apis.google.com/js/platform.js" async defer></script>

<!-- 구글 메타 태그 추가 -->
<meta name = "google-signin-client_id"
content = "360175730868-7161sh4v73h0hsufdvgmoa9u3o25oi21.apps.googleusercontent.com">

<style>
html, body {
	margin: 0px;
	padding: 0px;
	width: 100%;
	height: 100%;
}
</style>

</head>
<body>
	<div class="center-container">
		<div class="login_box">
			<div class="social_login">
			
			<!-- 구글 로그인/로그아웃 아이콘 -->
      <button id="btnGoogle"><div class="g-signin2" data-onsuccess="onSignIn"></div></button>
			<a href="#" onclick="signOut();">Sign out</a>
					
					 <a href="#" class="social_login__box kakao">
					 <i class="fas fa-comment fa-lg"></i> Continue with Kakao</a>
			</div>
			<div class="email_login">
				<form id="loginForm" name="loginForm" method="post" action="login">
					<input class="email_login__input" type="text" name="email"
						placeholder="이메일 입력" onkeyup="enterkey();">
					<input class="email_login__input" type="password" name="password"
						placeholder="비밀번호 입력" onkeyup="enterkey();">
					</td>
					<div style="margin-top: 1em;">
						<input type="checkbox" name="idsave" value="saveOk">아이디 저장
					</div>
					<input class="email_login__input login_btn" type="button"
						value="로그인" onclick="sendit()">
				</form>
			</div>
			<div style="margin-top: 1em;">
				<span style="margin-right: 1em;">계정이 없나요?</span><a
					style="color: blue; font-size: larger;" href="../user/form">회원가입
				</a>
			</div>
		</div>
    </div>

<script src="/Team-project/script/loginForm.js"></script>
<!-- /////////////////////////////////////////////////////////////////////////////////////// -->
<script>
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();

	    // ajax로 email로 가입된 유저가 있는지 확인한다.
	    // 있으면 바로 로그인 없으면 회원가입 시킨다.
	    
	    // form을 만든다.(post ../user/add)
	    // 유저 이메일과 이름, 프로필이미지를 input에 담는다.
	    // ajax로
	    // form.submit()으로 요청을 보낸다.
	    // 로그인
	    
	  console.log('ID: ' + profile.getId());
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail());
	  
	  var _auth2

	  var _onGoogleLoad = function () {
	    gapi.load('auth2', function () {
	      _auth2 = gapi.auth2.init({
	        client_id: '360175730868-7161sh4v73h0hsufdvgmoa9u3o25oi21.apps.googleusercontent.com',
	        scope: 'email',
	        fetch_basic_profile: false
	      })
	      _enableGoogleButton()
	    })
	  }
	  
	  
	}
	
	function attatchSignin(element) 
	{auth2.attachClickHandler
		(element, {}, function(googleUser) {
			    var id_token = googleUser.getAuthResponse().id_token;
			    
			    var xhr = new XMLHttpRequest();
			    xhr.open('POST', 'http://localhost:9999/Team-project/app/auth/form', false); // 수정
			    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // 수정
			    xhr.onload = function() {
			    	console.log('Signed in id: ' + xhr.responseText);
			    };
			    xhr.send('idtoken=' + id_token);
		}, 
		function(error) {
			console.log(JSON.stringify(error, undefined, 2));
		});
	}

</script>
<script>
  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
</script>





</body>

</html>




<!-- 00
<script>
function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  if(profile != null) {
    // ajax로 email로 가입된 유저가 있는지 확인한다.
    // 있으면 바로 로그인 없으면 회원가입 시킨다.
    
    // form을 만든다.(post ../user/add)
    // 유저 이메일과 이름, 프로필이미지를 input에 담는다.
    // ajax로
    // form.submit()으로 요청을 보낸다.
    // 로그인
    
  }
  console.log('ID: ' + profile.getId());
  console.log('Name: ' + profile.getName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail());
}
</script>
 -->










