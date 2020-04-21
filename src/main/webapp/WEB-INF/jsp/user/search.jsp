<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

  <h1>사용자 검색 결과</h1>
  <table border='1'>
  <tr>
    <th>번호</th>
    <th>이메일</th>
    <th>이름</th>
    <th>연락처</th>
    <th>전공</th>
  </tr>
  
<c:forEach items="${list}" var="item">
  <tr>
    <td>${item.userNo}</td>
    <td>${item.email}</td>
    <td><a href='detail?no=${item.userNo}'>${item.name}</a></td>
  </tr>

</c:forEach>

</table>