<%@page import="java.util.List"%>
<%@page import="Team.project.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/header.jsp"></jsp:include>

  <h1>회원 검색 결과</h1>
  <c:forEach items="${users}" var="user">
      ${user.userNo}, ${user.email}, 
      <a href='detail?no=${user.userNo}'>${user.name}</a><br>
  </c:forEach>
      <a href='list'>목록으로 돌아가기</a><br>

<jsp:include page="/footer.jsp"></jsp:include>