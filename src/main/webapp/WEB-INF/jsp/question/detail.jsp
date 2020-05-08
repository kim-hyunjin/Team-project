<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 상세 정보</title>
<script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
</head>
<body>
	<h1>질문 상세정보</h1>
	<form action='update' method='post' enctype='multipart/form-data'>
		  번호 : <input name='questionNo' type='number' readonly value='${question.questionNo}'><br>
		  <input name='memberNo' type='hidden' value='${question.memberNo}'><br>
		  제목 : <input name="title" type="text" value="${question.title}">
		  <label>내용</label><textarea name='content'>${question.content}</textarea><br>
			<div id="multipleBox">
		  	<c:if test="${not empty multiple}">
		  	  <c:forEach items="${multiple}" var="m">
						<div class="multipleRow">
		  	    	<input type="hidden" name="multipleNo" value="${m.multipleNo}">
							<input type="number" name="no" value="${m.no}">
							<input type="text" name="multipleContent" value="${m.multipleContent}">
							<span class="multipleDelete"><i class='fas fa-times'></i></span>
						</div>
					</c:forEach>
		  	</c:if>
				<button id="addMultiple">객관식 항목 추가</button>
			</div>
		  파일 : ${question.filePath} 
		  <input name='partfile' type='file'><br>
		  마감일 : <input name='deadline' type='date' value='${question.deadline}'><br>
		  생성일 : ${question.createDate}<br>
		  <button>변경</button>
	</form>
	<a href="delete?no=${question.questionNo}">삭제</a>
	
	<h1>학생 답변 목록</h1>
	<c:if test="${not empty answers}">
	   <c:forEach items="${answers}" var="a">
	     <p>${a.user.name}:</p>
          <c:if test="${not empty a.content}">
             <p>${a.content}</p>
          </c:if>
          <c:if test="${not empty multipleAnswers.get(a.multipleNo)}">
            <p>${multipleAnswers.get(a.multipleNo).no} ${multipleAnswers.get(a.multipleNo).multipleContent}</p>
          </c:if>
	   </c:forEach>
	</c:if>

	<script>
		const addRow = document.getElementById("addMultiple");
		addRow.addEventListener("click", function(event){
			event.preventDefault();
			let rowDiv = document.createElement("div");
			rowDiv.setAttribute("class", "multipleRow")
			let multipleNoInput = '<input type="number" name="multipleNo" value="0" style="display:none">';
			let noInput = '<input type="number" name="no" placeholder="번호">';
			let contentInput = '<input type="text" name="multipleContent" placeholder="내용">';
			let deleteIcon = '<span class="multipleDelete" onclick="deleteEvent(event)"><i class="fas fa-times"></i></span>';
			rowDiv.innerHTML = multipleNoInput + noInput + contentInput + deleteIcon;
			addRow.parentNode.appendChild(rowDiv);
		});

		let el = document.getElementsByClassName("multipleDelete");
		for (let row of el) {
				row.addEventListener("click", deleteEvent);
		}
		function deleteEvent(event) {
				event.currentTarget.parentNode.setAttribute("style", "display:none");
				event.currentTarget.parentNode.children[0].setAttribute("name", "deleteNo");
				//event.currentTarget.parentNode.parentNode.removeChild(event.currentTarget.parentNode);
		}
		

	</script>
</body>
</html>