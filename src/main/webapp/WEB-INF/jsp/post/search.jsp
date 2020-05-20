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
   <h1>검색 결과</h1>
   <table border='1'>
   <tr>
    <th>번호</th>
    <th>제목</th>
    <th>내용</th>
    <th>이름</th>
   </tr>
   
	<c:forEach items="${list}" var="item">
	    <tr>
	      <td>${item.postNo}</td>
	      <td><a href='detail?no=${item.postNo}'>${item.title}</a></td>
	      <td>${item.content}</td> 
	      <td>${item.user.name}</td>
	    </tr>
	</c:forEach>
	       <tr>
	       <td><a href='list'>목록으로 돌아가기</a></td>
	       </tr>
   </table>
   </body>
   </html>













