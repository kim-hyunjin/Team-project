<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

  
   <h1>수업 게시판</h1>
   <table border='1'>
   <tr>
    <th>번호</th>
    <th>질문제목</th>
    <th>질문마감기한</th>
   </tr>
    
    <c:forEach items="[${questions}, ${assignments}]" var="item">
      <tr>
        <td>${item.no}</td>
        <td>${item.title}</td>
        <td>${item.deadLine}</td>
       </tr>
    </c:forEach>
    

    
    </table>



