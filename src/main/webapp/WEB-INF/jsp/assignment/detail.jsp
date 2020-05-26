<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<jsp:include page="../room/room_header.jsp"></jsp:include>
<div class="room_contents">
  <span class="d-flex flex-row-reverse">
    <i class="fas fa-times" onclick="location.href='../lesson/list?room_no=${clazzNow.classNo}'" style="font-size:2em; cursor:pointer"></i>
  </span>
<c:if test="${not empty assignment}">
<form id="assignmentUpdateSubmit" action='update' method='post' enctype="multipart/form-data">
<div class="inputGroup">
	<input name="assignmentNo" readonly type="hidden" value="${assignment.assignmentNo}" >
	<div><label class="inputGroupText">제목</label><input name="title" value="${assignment.title}"></div>
	<label class="inputGroupText">내용</label><textarea name='content' id="summernote" >${assignment.content}</textarea>
</div>
<div class="d-flex mb-5 mt-3">
	<div class="col">
	<span class="inputGroupText" >첨부파일</span>
	<span id="download" title="다운로드" style="cursor:pointer; font-size:1em;">${file.originalName}</span> 
	<input name='partfile' type='file' class="btn btn-light btn-sm mt-2 mb-2">
	</div>
	<div class="col">
		<div class="inputGroup">
		<label class="inputGroupText" for="startdate">시작일</label><input id="startdate" name="startDate" type="date" value='${question.startDate}'>
		</div>
		<div class="inputGroup">
		<label class="inputGroupText" for="enddate">마감일</label><input id="enddate" name="deadline" type="date" value='${question.deadline}'>
		</div>
		<small id="input_small"></small>
	</div>
</div>
<small id="input_small"></small>
<div class="d-flex flex-row-reverse" id="updateDiv">
	<button type="button" class="btn btn-primary" onclick="updateSubmit()">변경</button>
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
	
	function updateSubmit() {
	    const updateForm = document.getElementById('assignmentUpdateSubmit');
	    if(updateForm.title.value == '') {
			updateForm.title.focus();
			updateForm.title.placeholder = "제목을 입력해주세요!";
	    }else if(!updateForm.startDate.value) {
		  updateForm.startDate.focus();
		  $('#input_small').html("시작일을 입력해주세요!").css('color', 'red');
	    }else if(!updateForm.deadline.value) {
		  updateForm.deadline.focus();
		  $('#input_small').html("마감일을 입력해주세요!").css('color', 'red');
	    }else {
		  updateForm.submit();
	    }
	}
	</script>
</body>
</html>

