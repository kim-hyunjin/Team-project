<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="../room/room_header.jsp"/>
  
  <div class="room_contents">
  
     <table border='1'>
      <c:forEach items="${assignments}" var="item">
      <tr>
      <td>${item.assignmentNo}</td> 
      <td><a href='detail?no=${item.assignmentNo}'>${item.title}</a></td> 
      <td>${item.memberNo}</td> 
      <td>${item.createDate}</td>
    </tr>
    </c:forEach>
    

  </div>
</body>
</html>
