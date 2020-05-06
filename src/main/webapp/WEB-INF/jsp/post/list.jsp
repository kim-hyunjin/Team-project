<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:if test="${not empty posts}">
   <table border='1'>
   <tr>
    <th>번호</th>
    <th>제목</th>
    <th>작성일</th>
   </tr>
	<c:forEach items="${posts}" var="item">
	    <tr>
	      <td>${item.postNo}</td> 
	      <td><a href='detail?no=${item.postNo}'>${item.title}</a></td>
	      <td>${item.createDate}</td> 
	    </tr>
	</c:forEach>
   </table>
</c:if>


