<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<h1>사용자 입력</h1>

<form action='add' method='post' enctype='multipart/form-data'>
이메일: <input name='email' type='email'><br>
이름: <input name='name' type='text'><br>
암호: <input name='password' type='password'><br>
전화: <input name='tel' type='tel'><br>
전공: <input name='major' type='text'><br>
자기소개<br><textarea name='introduce' rows='5' cols='60'></textarea><br>
사진: <input name='photoFile' type='file'><br> <!-- userController 에서 photoFile을 받아야 하기때문에 profilePhoto가 아닌 photoFile로 설정 -->
로그인 방식
<select name="loginMethod">
    <option value="0">이메일</option>
    <option value="1">카카오</option>
    <option value="2">구글</option>
</select><br>
<button>완료</button>
</form>
