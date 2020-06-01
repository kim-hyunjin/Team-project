<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/Team-project/css/style.css" />
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
  integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
  integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
  crossorigin="anonymous"></script>
<link rel="stylesheet"
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
  crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
  integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
  crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>


</head>

<style>
li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>

<body>
  <div class="container-fluid d-flex flex-column">
    <div class="row mb-3">
      <h2>${board.title}</h2>
    </div>
    <!-- 상단 -->
    <div class="row d-flex justify-content-between">
      <div class="col-4">
        <c:if test="${board.notice == 0 || (board.notice == 1 && nowMember.role == 0)}">
          <button type="button" class="btn btn-outline-dark btn-sm"
            onclick="location.href='../post/form?bno=${board.boardNo}'">글쓰기</button>
        </c:if>
      </div>
      <div class="col-8 d-flex justify-content-end">
        <form id="post-search-form" action="search" method="post">
          <div class="form-group row justify-content-left">
            <div style="padding-right: 5px">
              <input type="hidden" value="${board.boardNo}" name="boardNo"> <select
                class="form-control form-control-sm" name="searchType" id="searchType">
                <option value="title">제목</option>
                <option value="name">작성자</option>
              </select>
            </div>
            <div style="padding-right: 10px">
              <input type="text" class="form-control form-control-sm" name="keyword" id="keyword"
                style="width: 17em;" onkeyup="enterSearch()">
            </div>
            <div>
              <button class="btn btn-sm btn-primary" id="btnSearch">검색</button>
            </div>
          </div>
        </form>
      </div>
    </div>
    <div class="row mb-3" style="height: 35em; margin-top: 17px;">
      <!-- 게시글 있을 때 -->
      <c:if test="${not empty posts}">
        <table class="table table-hover" style="table-layout: fixed;">
          <colgroup>
            <col width="10%">
            <col width="50%">
            <col width="15%">
            <col width="15%">
          </colgroup>
          <thead>
            <tr>
              <th scope="col">번호</th>
              <th scope="col">제목</th>
              <th scope="col">작성자</th>
              <th scope="col">작성일</th>
            </tr>
          </thead>
          <tbody class="border-bottom">
            <c:forEach items="${posts}" var="item">
              <tr>
                <td>${item.postNo}</td>
                <td class="postTitleTd"><a href='detail?postNo=${item.postNo}'>${item.title}</a></td>
                <td>${item.user.name}</td>
                <td>${item.createDate}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:if>
      <!-- 게시글 없을 때 -->
      <c:if test="${empty posts}">
        <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">번호</th>
              <th scope="col">제목</th>
              <th scope="col">작성자</th>
              <th scope="col">작성일</th>
            </tr>
          </thead>
        </table>
      </c:if>
    </div>

    <!-- 페이지네이션 -->
    <div class="row d-flex justify-content-center">
      <nav class="pagination-nav" style="margin-left: 0;">
        <ul class="pagination paginoation-ul">
          <c:if test="${pageMaker.prev}">
            <!-- <li class="page-item"><a class="page-link" href="#">Previous</a></li> -->
            <li class="page-item"><a class="page-link"
              href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}&boardNo=${board.boardNo}">이전</a></li>
          </c:if>

          <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
            <li class="page-item"><a class="page-link"
              href="list${pageMaker.makeQuery(idx)}&boardNo=${board.boardNo}">${idx}</a></li>
          </c:forEach>

          <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <li class="page-item"><a class="page-link"
              href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}&boardNo=${board.boardNo}">다음</a></li>
          </c:if>
        </ul>
      </nav>
    </div>
  </div>
</body>

<script>
	function enterSearch() {
		if (window.event.keyCode == 13) {
			$('#post-search-form').submit()
		}
	}
</script>

</html>


