<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>로그인</h1>

      <form action='login' method='post'>
      <input name='email' type='email' placeholder="이메일" value='${user.email}'>
      <input type='checkbox' name='saveEamil'>이메일 저장해두기<br>
      <input name='password' placeholder="비밀번호" type='password'><br>
      <button>로그인</button>
      </form>

<c:if test="${not empty loginUser}">
<p>'${loginUser.name}'님 환영합니다.</p>
</c:if>

<c:if test="${empty loginUser}">
<p>사용자 정보가 유효하지 않습니다.</p>
</c:if>


