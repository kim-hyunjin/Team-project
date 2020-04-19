<%@page import="Team.project.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<jsp:include page="/header.jsp"/>

<h1>회원 상세정보</h1>
<c:if test="${not empty user}">
<img src='${pageContext.servletContext.contextPath}/upload/user/thumbnail.${user.profilePhoto}.jpg'><br>
<form action='update' method='post' enctype='multipart/form-data'>
        번호: <input name='userNo' type='text' readonly value='${user.userNo}'><br>
        이메일: <input name='email' type='email' value='${user.email}'><br>
        이름: <input name='name' type='text' value='${user.name}'><br>
        암호: <input name='password' type='password'><br>
        전화: <input name='tel' type='tel' value='${user.tel}'><br>
        전공: <input name='major' type='text' value='${user.major}'><br>
        자기소개<br><textarea name='introduce' rows='5' cols='60'>${user.introduce}</textarea><br>
        사진: <input name='profilePhoto' type='file'><br>
        로그인 방식: ${loginMethod}<br>
        회원가입일 : ${user.createDate}
        <p><button>변경</button>
        <a href='delete?no=${user.userNo}'>삭제</a></p>
        </form>
</c:if>

<c:if test="${empty user}">
<p>해당 회원이 없습니다.</p>
</c:if>
<jsp:include page="/footer.jsp"/>
