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

				<button id="kakao_login_btn"></button>
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
Kakao.Auth.createLoginButton({
  container: '#kakao_login_btn',
  success: function(authObj) {
	  Kakao.API.request({
		    url: '/v2/user/me',
		    success: function(user) {
		        console.log(user);
		        console.log(user.properties.profile_image);
		       window.location.href="kakao?email="+user.kakao_account.email
		        		+"&id="+user.id
		        		+"&nickname="+encodeURI(user.properties.nickname, "UTF-8")
		        		+"&image="+user.properties.profile_image;
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
</body>
</html>