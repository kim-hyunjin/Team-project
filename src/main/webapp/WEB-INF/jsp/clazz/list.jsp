<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

  <h1>클래스 목록</h1>
  <a href='form'>클래스 등록</a><br>
  <table border='1'>
  <tr>
    <th>번호</th>
    <th>클래스명</th>
    <th>내용</th>
    <th>강의실</th>
  </tr>
  
  <c:forEach items="${list}" var="item">
  <tr>
    <td>${item.classNo}</td>
    <td><a href='detail?no=${item.classNo}'>${item.name}</a></td>
    <td>${item.name}</td>
    <td>${item.room}</td>
  </tr>
  </c:forEach>
  
  </table>

<jsp:include page="../footer.jsp"/>

