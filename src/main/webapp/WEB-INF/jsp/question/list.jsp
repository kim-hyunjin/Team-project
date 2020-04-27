<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

  
   <h1>질문 게시판</h1>
<c:if test="${not empty questions}">
   <table border='1'>
   <tr>
    <th>번호</th>
    <th>질문제목</th>
    <th>질문마감기한</th>
   </tr>
    
    <c:forEach items="${questions}" var="item">
      <tr>
        <td>${item.questionNo}</td>
        <td><a href='detail?no=${item.questionNo}'>${item.title}</a></td>
        <td>${item.deadline}</td>
       </tr>
    </c:forEach>
    
    </table>
    </c:if>



