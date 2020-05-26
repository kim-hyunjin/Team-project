<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<jsp:include page="../room/room_header.jsp"></jsp:include>
<div class="room_contents">
  <span class="d-flex flex-row-reverse">
    <i class="fas fa-times" onclick="location.href='../lesson/list?room_no=${clazzNow.classNo}'" style="font-size:2em; cursor:pointer"></i>
  </span>
<c:if test="${not empty assignment}">
<form class="inputGroup" action='update' method='post' enctype="multipart/form-data">
<input name="assignmentNo" readonly type="hidden" value="${assignment.assignmentNo}" >
<div><label class="inputGroupText">제목</label><input name="title" value="${assignment.title}"></div>
<label class="inputGroupText">내용</label><textarea name='content' id="summernote" >${assignment.content}</textarea>
<div><label class="inputGroupText">시작일</label><input name="startDate" value="${assignment.startDate}"></div>
<div><label class="inputGroupText">마감일</label><input name="deadline" value="${assignment.deadline}"></div>
<label class="inputGroupText">파일</label><span id="download" title="다운로드" style="cursor:pointer;">${file.originalName}</span>
<input name="partfile" type="file" style="font-size:1em;">
<div class="d-flex flex-row-reverse" id="updateDiv">
	<button class="btn btn-primary">변경</button>
	<button type="button" class="btn btn-danger mr-2" onclick='confirmDelete()'>삭제</button>
	<button type="button" class="btn btn-success mr-2" onclick="location.href='submitted?assignmentNo=${assignment.assignmentNo}'">제출된 과제 보기</button>
</div>
</form>
</c:if>
<c:if test="${empty assignment}">
<h1>Oops! 과제를 불러오지 못했습니다.</h1>
</c:if>
<c:if test="${nowMember.role != 0 }">
  <button id="submitBtn">과제 제출하기</button>
</c:if>
</div>

<script>
$('#summernote').summernote({
    placeholder: '내용',
    tabsize: 2,
    height: 300
  });
</script>
<script>
// 학생인 경우와 선생인 경우를 나누어 과제 detail 화면 출력
if(${nowMember.role} != 0) {
	document.getElementById("updateDiv").setAttribute("style", "display:none");
	// 과제 제출하기 클릭시 과제에 대한 정보를 request body에 담아 post로 요청
	document.querySelector("#submitBtn").onclick = () => {
		let form = document.createElement('form');
		form.setAttribute('method', 'post');
		form.setAttribute('action', '../assignmentSubmit/form');
		document.charset = "utf-8";
		let params={"assignmentNo":`${assignment.assignmentNo}`,"title":`${assignment.title}`,
		"content":`${assignment.content}`,"file":`${assignment.file}`}

		for (let key in params) {
			let hiddenField = document.createElement('input');
			hiddenField.setAttribute('type', 'hidden');
			hiddenField.setAttribute('name', key);
			hiddenField.setAttribute('value', params[key]);
			form.appendChild(hiddenField);
		}
		document.body.appendChild(form);
		form.submit();
	};
	
	// 기존에 과제물을 제출한 적이 있다면 해당 정보를 출력해주고 변경할 수 있도록 해줌
	if(`${assignmentSubmit}` != ``) {
		let pTag = document.createElement("p");
		pTag.innerHTML = "과제 제출 여부 : Yes (제출일: " + `${assignmentSubmit.createDate}` + ")";
		document.getElementsByClassName("room_contents")[0].appendChild(pTag);
		document.getElementById("submitBtn").setAttribute("style", "display:none");
		let submitUpdateBtn = document.createElement("button");
		submitUpdateBtn.setAttribute("onclick", "location.href = '../assignmentSubmit/detail?assignmentNo=" + `${assignmentSubmit.assignmentNo}`+ "'");
		submitUpdateBtn.innerHTML = "제출 과제 변경하기";
		document.getElementsByClassName("room_contents")[0].appendChild(submitUpdateBtn);
	}
}

document.getElementById("download").onclick = () => {
	window.location = '../../download?fileId='+`${file.fileId}`;
	}
</script>
	<script>
	function confirmDelete() {
	    if(confirm("정말 삭제하시겠습니까?")) {
		    location.href="delete?no=${assignment.assignmentNo}";
	    }
	}
	
	</script>
</body>
</html>

