<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<jsp:include page="../room/room_header.jsp"></jsp:include>
<div class="room_contents">

<h3>과제명 : ${assignmentTitle}</h3>

<form action='update' method='post' enctype='multipart/form-data'>
	<input name="assignmentNo" type="hidden" value="${assignmentSubmit.assignmentNo}" >
	<input name="memberNo" type="hidden" value="${nowMember.memberNo}">
	<p>내용</p>
	<textarea name="content">${assignmentSubmit.content}</textarea>
	<p>제출한 파일 : <a href="download?file=${assignmentSubmit.file}">${assignmentSubmit.file}</a></p>
	<input name='partfile' type='file'><br>
	<button>변경</button>
</form>

</div>
</div>
</body>
</html> 