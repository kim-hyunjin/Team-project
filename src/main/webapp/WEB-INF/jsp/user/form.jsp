<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>회원 가입</h1>
<form action='add' method='post' enctype='multipart/form-data'>
이메일: <input name='email' type='email'><br>
이름: <input name='name' type='text'><br>
암호: <input name='password' type='password'><br>
전화: <input name='tel' type='tel'><br>
전공: <input name='major' type='text'><br>
자기소개<br><textarea name='introduce' rows='5' cols='60'></textarea><br>
사진: <input name='profilePhoto' type='file'><br>
로그인 방식
<select name="loginMethod">
    <option value="0">이메일</option>
    <option value="1">카카오</option>
    <option value="2">구글</option>
</select><br>
<button>완료</button>
</form>

<jsp:include page="../footer.jsp"/>