<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="../room/room_header.jsp"></jsp:include>

  <div class="room_contents">

   <h1>게시판</h1>
   <a href='form'>새 게시판</a>
   <table border='1'>
   <tr>
    <th>번호</th>
    <th>게시판제목</th>
   </tr>

<c:forEach items="${boards}" var="item">
    <tr>
      <td>${item.boardNo}</td> 
      <td><a href='detail?no=${item.boardNo}'>${item.title}</a></td> 
    </tr>
</c:forEach>
  
   </table>

  </div>
</body>
</html>