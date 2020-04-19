<%@page import="Team.project.domain.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/header.jsp"></jsp:include>

  <h1>유저목록</h1>
  <a href='form'>유저등록</a>
  <form action='search' method='get'>
    <input name='keyword' type='text' placeholder="유저 검색">
    <button>검색</button>
  </form>
<c:forEach items="${users}" var="user">
${user.userNo}, ${user.email}, <a href='detail?no=${user.userNo}'>${user.name}</a><br>
</c:forEach>

<jsp:include page="/footer.jsp"></jsp:include>