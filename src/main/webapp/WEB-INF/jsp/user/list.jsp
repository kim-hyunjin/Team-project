<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../room/room_header.jsp"/>

        <div class="room_contents">
        
	  <h1>유저목록</h1>

	<c:forEach items="${users}" var="item">
	  <c:if test="${item.role == 0}">
	    <div class="teacher_list">
	      <c:if test="${not empty item.user.profilePhoto}">
	         <img class="user_list__profile" src="${pageContext.servletContext.contextPath}/upload/user/thumbnail.${item.user.profilePhoto}.jpg" />
	      </c:if>
	      <c:if test="${empty item.user.profilePhoto}">
	         <i class="far fa-user"></i>
	      </c:if>
	      <a href='detail?no=${item.user.userNo}'>${item.user.name}</a>
	    </div>
	  </c:if>
	  <c:if test="${item.role == 1}">
	    <div class="student_list">
	     <c:if test="${not empty item.user.profilePhoto}">
	       <img class="user_list__profile" src="${pageContext.servletContext.contextPath}/upload/user/thumbnail.${item.user.profilePhoto}.jpg" />
	     </c:if>
	     <c:if test="${empty item.user.profilePhoto}">
         <i class="far fa-user"></i>
       </c:if>
	      <a href='detail?no=${item.user.userNo}'>${item.user.name}</a>
	    </div>
	  </c:if>
	</c:forEach>
	</div>
</body>
</html>

