<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<jsp:include page="../room/room_header.jsp"></jsp:include>
<div class="room_contents">

<h3>과제명 : ${assignmentTitle}</h3>
<c:if test="${empty assignmentSubmit.feedback || empty assignmentSubmit.score}">
<form action='update' method='post' enctype='multipart/form-data'>
	<input name="assignmentNo" type="hidden" value="${assignmentSubmit.assignmentNo}" >
	<input name="memberNo" type="hidden" value="${nowMember.memberNo}">
	<p>내용</p>
	<textarea name="content" style="width:100%; resize:none;" rows="10">${assignmentSubmit.content}</textarea>
	<p>제출한 파일 : <span id="download" title="다운로드" style="cursor:pointer;">${file.originalName}</span></p>
	<input name='partfile' type='file'><br>
	<button>변경</button>
</form>
</c:if>

<c:if test="${not empty assignmentSubmit.feedback || assignmentSubmit.score > 0}">
<p>제출 내용</p>
  <textarea name="content" readonly style="width:100%; resize:none;" rows="10">${assignmentSubmit.content}</textarea>
  <p>제출한 파일 : <span id="download" title="다운로드" style="cursor:pointer;">${file.originalName}</span></p>
  <h4>평가</h4>
  <h4>점수 : ${assignmentSubmit.score}</h4>
  <h4>피드백</h4>
  <textarea name="feedback" readonly>${assignmentSubmit.feedback}</textarea>
</c:if>

</div>
<script>
document.getElementById("download").onclick = () => {
    window.location = '../download?fileId='+`${file.fileId}`;
}
</script>
</body>
</html> 