<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<jsp:include page="../room/room_header.jsp"></jsp:include>
<div class="room_contents">
<form action='update' method='post' enctype="multipart/form-data">
<input name="assignmentNo" readonly type="hidden" value="${assignment.assignmentNo}" >
<h4>제목</h4><input name="title" type="text" value="${assignment.title}" style="width:50%; font-size:2em;">
<h4>내용</h4><textarea name='content' style="width:100%; height:30%; resize:none;" >${assignment.content}</textarea><br>
<h4>시작일</h4><input name='startDate' type='date' value="${assignment.startDate}"><br>
<h4>마감일</h4><input name='deadline' type='date' value="${assignment.deadline}"><br>
<h4>파일</h4><span id="download" title="다운로드" style="cursor:pointer;">${file.originalName}</span><br><br>
<input name="partfile" type="file"><br><br>
<button style="margin-left:50%; font-size:1em; width:4em;">변경</button>
</form>
</div>
</div>
<script>
//파일 다운로드 스크립트
document.getElementById("download").onclick = () => {
	window.location = '../download?fileId='+`${file.fileId}`;
	
}
</script>
</body>
</html> 