<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<h1>회원 상세정보</h1>

<c:if test="${not empty user}">

<form action='update' method='post' enctype='multipart/form-data'>

<img src='${pageContext.servletContext.contextPath}/upload/user/${user.profilePhoto}' height='80'><br>
번호: <input name='userNo' type='text' readonly value='${user.userNo}'><br>
이메일: <input name='email' type='email' value='${user.email}'><br>
이름: <input name='name' type='text' value='${user.name}'><br>
암호: <input name='password' type='password'><br>
전화: <input name='tel' type='tel' value='${user.tel}'><br>
전공: <input name='major' type='text' value='${user.major}'><br>
자기소개<br><textarea name='introduce' rows='5' cols='60'>${user.introduce}</textarea><br>
사진: <input name='photoFile' type='file'><br>
회원가입일 : <input name='createDate' type='date' value='${user.createDate}'><br>
<p><button>변경</button>
<button><a href='delete?no=${user.userNo}'>삭제</a></button></p>
</form>
</c:if>

<c:if test="${empty user}">
<p>해당 사용자가 없습니다.</p>
</c:if>

  