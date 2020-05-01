<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../room/room_header.jsp"/>
  <div class="room_contents">

   <h1 style="width:30%">질문게시판</h1>
   <table border='1' style="width:30%">
   <tr>
    <th>번호</th>
    <th>질문제목</th>
    <th>질문마감기한</th>
   </tr>

    <c:forEach items="${questions}" var="item">
      <tr>
        <td>${item.questionNo}</td>
        <td><a href='../question/detail?qno=${item.questionNo}'>${item.title}</a></td>
        <td>${item.deadline}</td>
       </tr>
    </c:forEach>


