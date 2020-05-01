<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <jsp:include page="room_header.jsp"/>

  <div class="room_contents">
  
        
    <table border='1'>
    <tr>
      <th>게시판제목</th>
      <th>제목</th>
      <th>내용</th>
      <th>작성일</th>
    </tr>
    
  <c:if test="${not empty posts}">
    <h1>게시글 리스트</h1>
  <c:forEach items="${posts}" var="item">
    <tr>
      <td>${item.board.title}</td>
      <td>${item.title}</td>
      <td>${item.content}</td>
      <td>${item.createDate}</td>
    </tr>
  </c:forEach>
  </c:if>
  </table>


  </div>
  </div>
</body>
</html>