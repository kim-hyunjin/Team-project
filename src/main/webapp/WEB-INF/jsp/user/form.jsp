<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    

<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../css/style.css" />
    
    <link rel="favicon" href="images/favicon.ico">
    <link rel="shortcut icon" href="http://localhost:9999/Team-project/images/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="http://localhost:9999/Team-project/images/favicon.ico" type="image/x-icon" />
    
<script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<title>BTS-회원가입</title>
<style>
html, body, .container {
height: 100%;
}
</style>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center">
  <div class="d-flex flex-column justify-content-center align-items-center w-100" style="margin-top:-20em;">
    <h2>회원 가입</h2>
    <form class="d-flex flex-column col-12 justify-content-center align-items-center" 
    id="addForm" action='signup' method='post' enctype='multipart/form-data'>
        <input class="form-control col-3" id = "emailInput" name='email' type='email' placeholder="   이메일">
        <input class="form-control mt-2 col-3" id = "nameInput" name='name' type='text' placeholder="   이름">
        <input class="form-control mt-2 col-3" id="passwordInput" name='password' type='password' placeholder="   비밀번호">
        <input class="form-control mt-2 col-3" id="passwordInput2" type='password' placeholder="   비밀번호 재확인">
        <label class="text-primary mt-2 font-weight-bold" id="form-label" style="height:2em;">
          <c:if test="${not empty error}">
          ${error}
          </c:if>
        </label>
        <input name="loginMethod" type="hidden" value="0">
        <button type="button" class="btn btn-primary col-3" id="completeBtn">완료</button>
    </form>
  </div>
</div>
    <script>
    const emailReg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    const passwordReg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

    $('#completeBtn').click(function(event){
    	event.preventDefault();
        if($('#emailInput').val() == "" || $('#nameInput').val() == "" || $('#passwordInput') == "") {
        	$('#form-label').html("모든 정보를 입력해주세요.");
        } else {
            let email = $('#emailInput').val()
            let password = $('#passwordInput').val();
            let password2 = $('#passwordInput2').val();
            if(emailReg.test(String(email).toLowerCase()) == false) {
            	$('#emailInput').focus();
          		$('#form-label').html("올바른 이메일 형식을 입력해주세요.");
            } else if(passwordReg.test(password) == false) {
            	$('#passwordInput').focus();
	            $('#form-label').html("비밀번호는 8자 이상이어야 하며, 숫자/소문자/특수문자를 모두 포함해야 합니다.");
	          } else if(password != password2) {
	        	  $('#passwordInput2').focus();
            	$('#form-label').html("비밀번호와 재확인 비밀번호가 일치하지 않습니다.");
            } else if(emailReg.test(String(email).toLowerCase()) == true && passwordReg.test(password) == true) {
            	document.getElementById("addForm").submit();
	          }
        }
    });
    
    $("input").keydown(function(key) {
        if (key.keyCode == 13) {
          $("#completeBtn").trigger("click");
        }
    });
    </script>
    
</body>
</html>