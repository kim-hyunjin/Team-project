<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<jsp:include page="../room/room_header.jsp"></jsp:include>
<div class="room_contents">
<c:if test="${not empty assignment}">
제목: ${assignment.title}<br>
내용: ${assignment.content}<br>
첨부파일: <a href="download?file=${assignment.file}">${assignment.file}</a><br>
<div id="updateDiv">
<p><a href='delete?no=${assignment.assignmentNo}'>삭제</a></p> 
<p><a href='updateForm?no=${assignment.assignmentNo}'>변경</a></p>
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
if(${nowMember.role} != 0) {
	document.getElementById("updateDiv").setAttribute("style", "display:none");
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
	
	if(`${assignmentSubmit}` != '') {
		let pTag = document.createElement("p");
		pTag.innerHTML = "과제 제출 여부 : Yes (제출일: " + `${assignmentSubmit.createDate}` + ")";
		document.getElementsByClassName("room_contents")[0].appendChild(pTag);
		document.getElementById("submitBtn").setAttribute("style", "display:none");
		let submitUpdateBtn = document.createElement("button");
		submitUpdateBtn.setAttribute("onclick", "location.href = '../assignmentSubmit/updateForm?assignmentNo=" + `${assignmentSubmit.assignmentNo}` + "'");
		submitUpdateBtn.innerHTML = "제출 과제 변경하기";
		document.getElementsByClassName("room_contents")[0].appendChild(submitUpdateBtn);
	}
}


</script>
</body>
</html>

