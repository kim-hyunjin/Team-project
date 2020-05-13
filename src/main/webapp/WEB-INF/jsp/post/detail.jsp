<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<html>
<head>
<title>detail/update</title>
</head>

<body>
 
    <c:set var="a" value="${post.memberNo}"/>
  <c:set var="b" value="${classMember}"/>
  <c:choose>
    <c:when test="${a == b}">
      <form action='update' method='post' enctype='multipart/form-data'>
     <input name='memberNo' style='display:none'  value='${post.memberNo}'>
     <input name='boardNo' type='hidden' value='${post.boardNo}'>    
     번호: <input name='postNo' type='number' readonly value='${post.postNo}'><br>
     제목: <input name='title' type='text' value='${post.title}'><br>
     내용: <input name='content' type='text' style="text-align:left; width:500px; height:300px;" value='${post.content}'><br>
     파일 : ${post.file}
     <input name='partFile' type='file'><br>
     작성일: <input name='createDate' type='date' readonly value='${post.createDate}'><br>
     <button>변경</button>
   </form>
   <a href="delete?no=${post.postNo}&bno=${post.boardNo}">삭제</a>
    </c:when>
   
    <c:otherwise>
       <form action='update' method='post' enctype='multipart/form-data'>
     <input name='memberNo' style='display:none'  value='${post.memberNo}'>
     <input name='boardNo' type='hidden' value='${post.boardNo}'>    
     번호: <input name='postNo' type='number' readonly value='${post.postNo}'><br>
     제목: <input name='title' type='text' value='${post.title}'><br>
     내용: <input name='content' type='text' style="text-align:left; width:500px; height:300px;" value='${post.content}'><br>
     파일 : ${post.file}
     <input name='partFile' type='file'><br>
     작성일: <input name='createDate' type='date' readonly value='${post.createDate}'><br>
   </form>
    </c:otherwise>
  </c:choose>
</body>





</html>

<!-- 
<html>
<head>
<title>detail/update</title>
</head>

   <form action='update' method='post' enctype='multipart/form-data'>
     <input name='memberNo' style='display:none'  value='${post.memberNo}'>
     <input name='boardNo' type='hidden' value='${post.boardNo}'>    
     번호: <input name='postNo' type='number' readonly value='${post.postNo}'><br>
     제목: <input name='title' type='text' value='${post.title}'><br>
     내용: <input name='content' type='text' style="text-align:left; width:500px; height:300px;" value='${post.content}'><br>
     파일 : ${post.file}
     <input name='partFile' type='file'><br>
     작성일: <input name='createDate' type='date' readonly value='${post.createDate}'><br>
     <button>변경</button>
   </form>
   <a href="delete?no=${post.postNo}&bno=${post.boardNo}">삭제</a>
</html>
-->







