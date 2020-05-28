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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<style>
html, body {
    margin: 0px;
    padding: 0px;
    width: 100%;
    height: 100%;
}
input {
  font-size:1em;
  margin-top: 1em;
  width: 100%;
  height: 2.5em;
}
button {
  margin-top: 1.3em;
  width: 5em;
  height: 2em;
  margin-left:5.5em;
}
</style>
</head>
<body>
<div class="center-container">
<div class="login_box">
    <h2>회원 가입</h2>
    <label></label>
    <label></label>
    <label></label>
    <div style="width:70%;">
    <form id="addForm" action='signup' method='post' enctype='multipart/form-data'>
        <input id = "emailInput" name='email' type='email' placeholder="   이메일"><br>
        <!-- <label id="emailLabel"></label>  -->
        <input id = "nameInput" name='name' type='text' placeholder="   이름"><br>
        <input id="passwordInput" name='password' type='password' placeholder="   비밀번호">
        <label id="passwordLabel"></label><br>
        <input name="loginMethod" type="hidden" value="0">
        <button class="btn btn-success" id="completeBtn">완료</button>
    </form>
    </div>
    </div>
    </div>
    <script>
    const emailReg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    const emailBox = document.getElementById("emailInput");
    const emailLabel = document.getElementById("emailLabel");
    const passwordReg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    const passwordBox = document.getElementById("passwordInput");
    const passwordLabel = document.getElementById("passwordLabel");
    const nameBox = document.getElementById("nameInput");
    document.getElementById("completeBtn").addEventListener("click", function(event) {
            event.preventDefault();
        if(emailBox.value == "" || nameBox.value == "" || passwordBox.value == "") {
                label.innerHTML = "모든 정보를 입력해주세요.";
        } else {
            let email = emailBox.value;
            let password = passwordBox.value;
            if(emailReg.test(String(email).toLowerCase()) == false) {
        		emailBox.focus();
        		emailLabel.innerHTML = "올바른 이메일 형식을 입력해주세요."
            }
            if(passwordReg.test(password) == false) {
	            passwordBox.focus();
	            passwordLabel.innerHTML = "비밀번호는 8자 이상이어야 하며, 숫자/소문자/특수문자를 모두 포함해야 합니다.";
	          } 
            if(emailReg.test(String(email).toLowerCase()) == true && passwordReg.test(password) == true) {
	            document.getElementById("addForm").submit();
	          }
        }
    });
    </script>
</body>
</html>