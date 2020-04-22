<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../header.jsp"/>
    
  <h1>사용자목록</h1>
  <a href='form'>사용자 등록</a>
  <table border='1'>
  <tr>
    <th>번호</th>
    <th>이름</th>
    <th>이메일</th>
    <th>연락처</th>
    <th>전공</th>
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td>${item.userNo}</td>
    <td><a href='detail?no=${item.userNo}'>${item.name}</a></td>
    <td>${item.email}</td>
    <td>${item.tel}</td>
    <td>${item.major}</td>
  </tr>
</c:forEach>

</table>

<hr>
<form action='search' method='get'>
검색어 : <input name='keyword' type='text'>
<button>검색</button>
</form>

<jsp:include page="../footer.jsp"/>