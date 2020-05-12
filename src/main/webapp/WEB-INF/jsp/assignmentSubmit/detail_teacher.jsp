<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<jsp:include page="../room/room_header.jsp"></jsp:include>
<div class="room_contents">

<h3>과제명 : ${assignmentTitle}</h3>
<h4>제출자 : ${assignmentSubmit.user.name}</h4>
<p>내용</p>
<textarea readonly name="content">${assignmentSubmit.content}</textarea>
<p>제출된 파일 : <a href="download?file=${assignmentSubmit.file}">${assignmentSubmit.file}</a></p>
<form action='evaluation' method='post' enctype='multipart/form-data'>
	<input name="assignmentNo" type="hidden" value="${assignmentSubmit.assignmentNo}" >
	<input name="memberNo" type="hidden" value="${assignmentSubmit.clazzMember.memberNo}">
	<p>점수</p>
	<c:if test="${not empty assignmentSubmit.score}">
	<input name="score" type="number" value="${assignmentSubmit.score}">
	</c:if>
	<c:if test="${empty assignmentSubmit.score}">
	<input name="score" type="number">
	</c:if>
	<p>피드백</p>
	<c:if test="${not empty assignmentSubmit.feedback}">
	<textarea name="feedback">${assignmentSubmit.feedback}</textarea>
	</c:if>
	<c:if test="${empty assignmentSubmit.feedback}">
	<textarea name="feedback"></textarea>
	</c:if>
	<button id="evalBtn">평가</button>
</form>

</div>
</div>
<script>
// 점수를 정확히 입력하지 않을 경우 경고창 띄움
document.getElementById("evalBtn").addEventListener("click", function(event){
	const scoreInput = document.getElementsByName("score")[0];
	if(scoreInput.value == "" || scoreInput.value == NaN) {
		event.preventDefault();
		alert("정확한 점수를 입력해주세요!");
	}
});

</script>
</body>
</html> 