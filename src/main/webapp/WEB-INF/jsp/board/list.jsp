<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

  <!--  -->
  
  <div class="room_contents">

   <h1 style="width:30%">게시판</h1>
   <a href='form' style="width:30%">새 게시판</a>
   <table border='1' style="width:30%">
   <tr>
    <th>번호</th>
    <th>게시판제목</th>
   </tr>

<c:forEach items="${nowBoard}" var="item">
    <tr>
      <td>${item.boardNo}</td> 
      <td><a href='list?bno=${item.boardNo}'>${item.title}</a></td> 
    </tr>
</c:forEach>

   </table>
