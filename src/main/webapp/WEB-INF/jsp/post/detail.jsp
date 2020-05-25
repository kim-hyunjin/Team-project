<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

    <!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/Team-project/css/style.css" />
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
    </head>

<body>
 
    <c:set var="a" value="${post.memberNo}"/>
  <c:set var="b" value="${classMember}"/>
  <c:choose>
    <c:when test="${a == b}">
     <form action='update' method='post' enctype='multipart/form-data'>
     <input name='memberNo' style='display:none'  value='${post.memberNo}'>
     <input name='boardNo' type='hidden' value='${post.boardNo}'>    
     <!-- 번호 -->
     <input name='postNo' type='hidden' readonly value='${post.postNo}' style="width: 50px;">
     <br><br/>
     <h6>제목</h6>
     <input class="form-control" name='title' type='text' value='${post.title}' style="width: 200px"><br>
     <h6>내용</h6>
     <textarea class="form-control" name='content' rows='10' cols='15' type='text' style="text-align:left; width:700px; word-break: break-all;" value='${post.content}'></textarea><br>
     <!-- 파일 -->
     <input name='partFile' type='file'><br>     
     <span id="download" title="다운로드" style="cursor:pointer;">${file.originalName}</span>
     <!-- 작성일 -->
     <input name='createDate' type='hidden' readonly value='${post.createDate}'><br></br>
     <button type="button" class="btn btn-outline-dark btn-sm">변경</button> <button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='delete?no=${post.postNo}&bno=${post.boardNo}'">삭제</button>
   </form>
   
   <!-- <a href="delete?no=${post.postNo}&bno=${post.boardNo}">삭제</a> -->
    </c:when>
   
    <c:otherwise>
  <form action='update' method='post' enctype='multipart/form-data'>
     <input name='memberNo' style='display:none'  value='${post.memberNo}'>
     <input name='boardNo' type='hidden' value='${post.boardNo}'>    
     <!-- 번호 -->
     <input name='postNo' type='hidden' readonly value='${post.postNo}' style="width: 50px;">
     <br><br/>
     <h6>제목</h6>
     <input class="form-control" name='title' type='text' readonly value='${post.title}' style="width: 200px"><br>
     <h6>내용</h6>
     <textarea class="form-control" name='content' rows='10' cols='15' type='text' style="text-align:left; width:700px; word-break: break-all;" readonly value='${post.content}'></textarea><br>
     <!-- 파일 -->
     <input name='partFile' type='file'><br>     
     <span id="download" title="다운로드" style="cursor:pointer;">${file.originalName}</span>
     <!-- 작성일 -->
     <input name='createDate' type='hidden' readonly value='${post.createDate}'><br></br>
   </form>
    </c:otherwise>
  </c:choose>
  <script>
  document.getElementById("download").onclick = () => {
  window.location = '../download?fileId='+`${file.fileId}`;
  }
  </script>
</body>
</html>

