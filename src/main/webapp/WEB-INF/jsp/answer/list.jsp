<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="../room/room_header.jsp"/>

  <div class="room_contents">
  
      <c:if test="${not empty answers}">
    <h1>답변 리스트</h1>
        <c:forEach items="${answers}" var="a">
          <p>${a.user.name}:</p>
          <c:if test="${not empty a.content}">
             <p>${a.content}</p>
          </c:if>
          <c:if test="${a.multipleNo > 0}">
            <p>${multiples.get(a.multipleNo).no}(${multiples.get(a.multipleNo).content})</p>
          </c:if>
        </c:forEach>
      </c:if>
  </div>
 </body>
</html>






