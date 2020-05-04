<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<jsp:include page="../room/room_header.jsp"></jsp:include>
<div class="room_contents">
<form action='update' method='post'>
<input name="assignmentNo" readonly type="number" value="${no}" ><br>
제목: <input name="title" type="text" ><br>
내용: <input name='content' type='text'><br>
마감일: <input name='deadline' type='date' ><br>
<p><button>변경</button>
</form>
</div>
<c:if test="${empty assignment}">
<p>해당 회원이 없습니다.</p>
</c:if>
</body>
</html> 