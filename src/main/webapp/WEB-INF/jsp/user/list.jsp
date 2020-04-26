<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../room/room_header.jsp"/>

        <div class="room_contents">
        
	  <h1>유저목록</h1>
	 

	<c:forEach items="${users}" var="user">
	   ${user.userNo}, ${user.email}, <a href='detail?no=${user.userNo}'>${user.name}</a><br>
	</c:forEach>
	</div>
</body>
</html>

