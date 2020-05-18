<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<jsp:include page="../room/room_header.jsp"></jsp:include>
<div class="room_contents">
  <div id="question_detail">
	<form action='update' method='post' enctype='multipart/form-data'>
		  <input name='questionNo' type='hidden' value='${question.questionNo}'>
		  <h4>제목</h4><input name="title" type="text" value="${question.title}">
		  <h4>내용</h4><textarea name='content'>${question.content}</textarea>
		  <h4>객관식 항목</h4>
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
				<button id="addMultiple">항목 추가</button>
			</div>
		  <h4>파일</h4><span id="download" title="다운로드" style="cursor:pointer;">${file.originalName}</span> 
		  <input name='partfile' type='file'>
		  <h4>시작일</h4><input name='startDate' type='date' value='${question.startDate}'>
		  <h4>마감일</h4><input name='deadline' type='date' value='${question.deadline}'>
		  <button>변경</button>
	</form>
	<a href="delete?no=${question.questionNo}">삭제</a>
	</div>
	<div id="answer_detail">
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
	</div>
</div>
</div>

	<script>
		// 객관식 항목 추가 버튼 클릭시 #multipleBox 밑에 .multipleRow추가
		const addMultiple = document.getElementById("addMultiple");
		addMultiple.addEventListener("click", function(event){
			event.preventDefault();
			let rowDiv = document.createElement("div");
			rowDiv.setAttribute("class", "multipleRow")
			let multipleNoInput = '<input type="number" name="multipleNo" value="0" style="display:none">'; // 새로 추가되는 multipleNo 인풋태그는 기본값으로 0 할당
			let noInput = '<input type="number" name="no" placeholder="번호">';
			let contentInput = '<input type="text" name="multipleContent" placeholder="내용">';
			let deleteIcon = '<span class="multipleDelete" onclick="deleteEvent(event)"><i class="fas fa-times"></i></span>';
			rowDiv.innerHTML = multipleNoInput + noInput + contentInput + deleteIcon;
			addMultiple.parentNode.appendChild(rowDiv);
		});

		// .multipleRow에서 X버튼 클릭시 해당 객관식 항목을 안보이게 숨김.
		let el = document.getElementsByClassName("multipleDelete");
		for (let row of el) {
				row.addEventListener("click", deleteEvent);
		}
		function deleteEvent(event) {
				event.currentTarget.parentNode.setAttribute("style", "display:none");
				event.currentTarget.parentNode.children[0].setAttribute("name", "deleteNo"); // multipleNo값을 deleteNo로 컨트롤러에 보냄 -> 삭제 작업 수행
		}
		
		// 파일 다운로드 스크립트 부분
		document.getElementById("download").onclick = () => {
			  window.location = '../download?fileId='+`${file.fileId}`;
			  
			}
		

	</script>
</body>
</html>