<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<jsp:include page="../room/room_header.jsp"></jsp:include>
<div class="room_contents">
<c:if test="${not empty assignment}">
제목: ${assignment.title}<br>
내용: ${assignment.content}<br>
첨부파일: <a href="download?file=${assignment.file}">${assignment.file}</a><br>
<p><a href='delete?no=${assignment.assignmentNo}'>삭제</a></p> 
<p><a href='updateForm?no=${assignment.assignmentNo}'>변경</a></p>
</c:if>
<c:if test="${empty assignment}">
<p>해당 게시물이 없습니다.</p>
</c:if>
</div>
</div>
</body>
</html>

