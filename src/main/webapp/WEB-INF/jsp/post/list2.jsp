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
    
    <style>
    .pagination-nav {
      text-align: center;
    }
    .pagination-ul {
      display: inline-block;
    }
    .pagination {
      display: inline-block;
      padding-left: 0;
      list-style: none;
      border-radius: .25rem;
    }
    </style>
    
    <body>
  <h2>${boardTitle}</h2>
  <br/>
  <br/>

  
  
   <c:if test="${not empty posts}">
 
   <table class="table table-hover" >
   <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성일</th>
     </tr>
   </thead>

  
  <tbody>
  <c:forEach items="${posts}" var="item">
  
  <style type="text/css">
      li {list-style: none; float: left; padding: 6px;}
    </style>
      <tr>
        <td>${item.postNo}</td> 
        <td><a href='detail?no=${item.postNo}'>${item.title}</a></td>
        <td>${item.user.name}</td>
        <td>${item.createDate}</td> 
      </tr>
  </c:forEach>
  </tbody>
   </table>
   
   
    <nav class="pagination-nav">
      <ul class="pagination paginoation-ul">
        <c:if test="${pageMaker.prev}">
           <!-- <li class="page-item"><a class="page-link" href="#">Previous</a></li> -->
          <li class="page-item"><a class="page-link" href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}&bno=${boardNo}&bTitle=${boardTitle}">이전</a></li>
        </c:if> 
    
        <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
          <li class="page-item"><a class="page-link" href="list${pageMaker.makeQuery(idx)}&bno=${boardNo}&bTitle=${boardTitle}">${idx}</a></li>
        </c:forEach>
    
        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
          <li class="page-item"><a class="page-link" href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}&bno=${boardNo}&bTitle=${boardTitle}">다음</a></li>
        </c:if> 
    </ul>
  </nav>

  <a class="btn btn-default pull-right" href="../post/form?bno=${boardNo}">글쓰기</a>

  <hr>
  <form action='search' method='get'>
  <input name='boardNo' type='hidden' value='${boardNo}'>
  제목: <input name='title' type='text'><br>
  내용: <input name='content' type='text'><br>
  이름: <input name='name' type='text'><br> 
  <button>검색</button>
  </form>

</c:if>


</body>

</html>


