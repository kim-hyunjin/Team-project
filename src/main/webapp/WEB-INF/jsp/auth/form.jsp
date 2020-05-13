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
				<a href="#" class="social_login__box google"><i class="fab fa-google"></i>Continue with Google</a>
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=b2421e263082325965158a3fe73ffd67&redirect_uri=http://localhost:9999/Team-project/app/auth/kakao/login&response_type=code" class="social_login__box kakao"><i class="fas fa-comment fa-lg"></i>Continue with Kakao</a>
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

	<script src="/Team-project/script/loginForm.js"></script>
</body>
</html>