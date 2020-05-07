<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../css/style.css" />
<script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<h1>회원 가입</h1>
	<form action='add' method='post' enctype='multipart/form-data'>
		이메일: <input id = "emailInput" name='email' type='email'><br>
		이름: <input id = "nameInput" name='name' type='text'><br>
		암호: <input id="passwordInput" name='password' type='password'><label id="passwordLabel" for="passwordInput"></label><br>
		전화: <input name='tel' type='tel'><br>
		전공: <input name='major' type='text'><br>
		자기소개<br><textarea name='introduce' rows='5' cols='60'></textarea><br>
		사진: <input name='photo' type='file'><br>
		로그인 방식
		<select name="loginMethod">
		    <option value="0">이메일</option>
		    <option value="1">카카오</option>
		    <option value="2">구글</option>
		</select><br>
		<button id="completeBtn">완료</button>
	</form>
	<script>
	const reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	const passwordBox = document.getElementById("passwordInput");
	const emailBox = document.getElementById("emailInput");
	const nameBox = document.getElementById("nameInput");
	document.getElementById("completeBtn").addEventListener("click", function(event) {
		if(emailBox.value === "") {
			emailBox.setAttribute("style", "border-color:red");
		}
		if(nameBox.value === "") {
			nameBox.setAttribute("style", "border-color:red");
		}
		if(passwordBox.value === "") {
			passwordBox.setAttribute("style", "border-color:red");
        }
		
	let password = passwordBox.value;
		console.log(password);
		console.log(reg.test(password));
	if(false === reg.test(password)) {
		event.preventDefault();
		passwordBox.setAttribute("style", "border-color:red");
		
		let label = document.getElementById("passwordLabel");
		label.innerHTML = "비밀번호는 8자 이상이어야 하며, 숫자/소문자/특수문자를 모두 포함해야 합니다.";
		
		
	  // alert('비밀번호는 8자 이상이어야 하며, 숫자/소문자/특수문자를 모두 포함해야 합니다.');
	}
	});
	</script>
</body>
</html>

