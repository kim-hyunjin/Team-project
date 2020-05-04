<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="../room/room_header.jsp"></jsp:include>

<div class="room_contents">

   <h1>게시판 추가</h1>
   <form action="add" method='post'>
   제목: <input name='title' type='text'><br>
   공지여부: <input name='notice' type="checkbox"><br>
   <button>추가</button>
   </form>
   
</div>
</body>
</html>