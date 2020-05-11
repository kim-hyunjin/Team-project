<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


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













