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
<script src="/Team-project/script/kakao.js"></script>
    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('e42d7bc3930faad4ef83d4fb783cf136');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>
<!-- 라이브러리 추가 -->
<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>

<!-- 구글 메타 태그 추가 -->
<meta name = "google-signin-client_id"
content = "360175730868-7161sh4v73h0hsufdvgmoa9u3o25oi21.apps.googleusercontent.com">    

<title>BTS-로그인</title>
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
        <div id="my-signin2"></div>
				<button id="kakao_login_btn" style="margin-top:1em; border:none; background-color:white;"></button>
			</div>
			<div class="email_login">
				<form id="loginForm" name="loginForm" method="post" action="login">
					<input class="email_login__input" type="text" name="email"
						placeholder="이메일 입력" onkeyup="enterkey();"> <input
						class="email_login__input" type="password" name="password"
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

<script>
let errorMsg = `${loginError}`;
if(errorMsg.length > 0) {
    alert("로그인에 실패했습니다!");
}
</script>
<script src="/Team-project/script/loginForm.js"></script>
<script>
//카카오 로그인 script
Kakao.Auth.createLoginButton({
  container: '#kakao_login_btn',
  success: function(authObj) {
	  Kakao.API.request({
		    url: '/v2/user/me',
		    success: function(user) {
		        console.log(user);
		        console.log(user.properties.profile_image);
		       window.location.href="social?email="+user.kakao_account.email
		        		+"&id="+user.id
		        		+"&nickname="+encodeURI(user.properties.nickname, "UTF-8")
		        		+"&image="+user.properties.profile_image
		        		+"&loginMethod=1";
		    },
		    fail: function(error) {
		        console.log(error);
		    }
		});
  },
  fail: function(error) {
    console.log(error);
  },
});
</script>
<script>
//구글로그인 script
function onSuccess(googleUser) {
    var profile = googleUser.getBasicProfile();
      
    console.log('ID: ' + profile.getId());
    console.log('Name: ' + profile.getName());
    console.log('Image URL: ' + profile.getImageUrl());
    console.log('Email: ' + profile.getEmail());
    window.location.href="social?email="+profile.getEmail()
    +"&id="+profile.getId()
    +"&nickname="+encodeURI(profile.getName(), "UTF-8")
    +"&image="+profile.getImageUrl()
    +"&loginMethod=2";
}

    function onFailure(error) {
        console.log(error);
      }
    
      function renderButton() {
        gapi.signin2.render('my-signin2', {
          'scope': 'profile email',
          'width': 220,
          'height': 50,
          'longtitle': true,
          'theme': 'light',
          'onsuccess': onSuccess,
          'onfailure': onFailure
        });
      }
</script>
</body>
</html>