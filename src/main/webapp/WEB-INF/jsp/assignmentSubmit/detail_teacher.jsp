<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<jsp:include page="../room/room_header.jsp"></jsp:include>
<div class="room_contents">

<h4>과제명 : ${assignmentTitle}</h4>
<h4>제출자 : ${assignmentSubmit.user.name}</h4>
<p>내용</p>
<textarea readonly name="content" style="height:20%; resize:none">${assignmentSubmit.content}</textarea>
<p>제출된 파일 : <span id="download" title="다운로드" style="cursor:pointer;">${file.originalName}</span> </p>

<form action='evaluation' method='post' enctype='multipart/form-data' style="height:50%;">
	<input name="assignmentNo" type="hidden" value="${assignmentSubmit.assignmentNo}" >
	<input name="memberNo" type="hidden" value="${assignmentSubmit.clazzMember.memberNo}">
	<h4>점수
	<c:if test="${not empty assignmentSubmit.score}">
	<input name="score" type="number" value="${assignmentSubmit.score}">
	</c:if>
	<c:if test="${empty assignmentSubmit.score}">
	<input name="score" type="number">
	</c:if>
	</h4>
	<h4>피드백</h4>	
	<textarea name="feedback" style="width:100%; height:50%; resize:none;">
	<c:if test="${not empty assignmentSubmit.feedback}">${assignmentSubmit.feedback}</c:if>
	</textarea>
	<button id="evalBtn">평가</button>
</form>

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

document.getElementById("download").onclick = () => {
	  window.location = '../download?fileId='+`${file.fileId}`;
}
</script>
</body>
</html> 