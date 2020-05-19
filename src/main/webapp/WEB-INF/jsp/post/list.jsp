<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  <h2>${boardTitle}</h2>
  <a href="../post/form?bno=${boardNo}">게시글 추가</a>
<c:if test="${not empty posts}">
   <table border='1'>
   <tr>
    <th>번호</th>
    <th>제목</th>
    <th>작성자</th>
    <th>작성일</th>
   </tr>
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
   </table>
   
  <nav aria-label="Page navigation">
    <ul class="pagination">
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

<br>
<br>

  <hr>
  <form action='search' method='get'>
  <input name='boardNo' type='hidden' value='${boardNo}'>
  제목: <input name='title' type='text'><br>
  내용: <input name='content' type='text'><br>
  이름: <input name='name' type='text'><br> 
  <button>검색</button>
  </form>
</c:if>

