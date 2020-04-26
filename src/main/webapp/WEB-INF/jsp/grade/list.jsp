<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../room/room_header.jsp"/>

        <div class="room_contents">
          <table border='1'>
  <tr>
    <th>기준</th>
    <c:forEach items="${assignmentList}" var="item">
      <th>${item.assignment.title}</th>
    </c:forEach>
    
  </tr>
  
  <c:forEach items="${assignmentList}" var="item">
  <tr>
      <th>${item.user.name}</th>
      <c:forEach items="${assignmentList}" var="test">
        <th>${test.score}</th>
      </c:forEach>
 </tr>
    </c:forEach>


  
  
  
  
  
  
  
  
  </table>
        </div>
      
</body>
</html>