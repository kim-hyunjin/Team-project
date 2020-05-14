<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<jsp:include page="../room/room_header.jsp"></jsp:include>
<div class="room_contents">
<c:if test="${not empty assignment}">
<h4>제목</h4>${assignment.title}<br>
<h4>내용</h4>${assignment.content}<br>
<h4>마감일</h4>${assignment.deadline}<br>
<h4>파일</h4><span id="download" title="다운로드" style="cursor:pointer;">${file.originalName}</span><br>
<div id="updateDiv">
	<p><a href='delete?no=${assignment.assignmentNo}'>삭제</a></p> 
	<p><a href='updateForm?no=${assignment.assignmentNo}'>변경</a></p>
	<button onclick="location.href='submitted?assignmentNo=${assignment.assignmentNo}'">제출된 과제 보기</button>
</div>
</c:if>
<c:if test="${empty assignment}">
<p>해당 게시물이 없습니다.</p>
</c:if>
<c:if test="${nowMember.role != 0 }">
  <button id="submitBtn">과제 제출하기</button>
</c:if>
</div>
</div>

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

		for ( let key in params) {
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
	window.location = '../download?fileId='+`${file.fileId}`;
	}
</script>
</body>
</html>

