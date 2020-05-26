<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<jsp:include page="../room/room_header.jsp"></jsp:include>
<div class="room_contents">
  <div class="container">
  <span class="d-flex flex-row-reverse">
    <i class="fas fa-times" onclick="location.href='../lesson/list?room_no=${clazzNow.classNo}'" style="font-size:2em; cursor:pointer"></i>
  </span>
	<form action='update' method='post' enctype='multipart/form-data'>
    <div class="inputGroup">
		  <input name='questionNo' type='hidden' value='${question.questionNo}'>
		  <div>
      <label class="inputGroupText" >제목</label>
		  <input name="title" type="text" value="${question.title}">
		  </div>
		  
		  <span class="inputGroupText" >내용</span>
		  <textarea id='summernote' name='content' style="width:75%; margin-bottom:1em;">${question.content}</textarea >
		</div>
		  
		  <span class="inputGroupText" >객관식항목</span>
			<div id="multipleBox">
			<button id="addMultiple">항목 추가</button>
		  	<c:if test="${not empty multiple}">
		  	  <c:forEach items="${multiple}" var="m">
						<div class="multipleRow">
		  	    	<input type="hidden" name="multipleNo" value="${m.multipleNo}">
							<input class="multipleNoInput" type="number" name="no" value="${m.no}">
							<input class="multipleContentInput" type="text" name="multipleContent" value="${m.multipleContent}">
							<span class="multipleDelete"><i class='fas fa-times'></i></span>
						</div>
					</c:forEach>
		  	</c:if>
			</div>
			
			<div class="inputGroup">
			  <span class="inputGroupText" >첨부파일</span>
			  <span id="download" title="다운로드" style="cursor:pointer; font-size:1.3em;">${file.originalName}</span> 
			  <input name='partfile' type='file' style="font-size:1em; margin-left:4em;">
			  <div>
			  <span class="inputGroupText" >시작일</span>
			  <input name='startDate' type='date' value='${question.startDate}'>
			  </div>
			  <div>
			  <span class="inputGroupText" >마감일</span>
			  <input name='deadline' type='date' value='${question.deadline}'>
			  </div>
		  </div>
		  <div class="d-flex flex-row-reverse">
		  <button class="btn btn-primary">변경</button>
	    <button type="button" class="btn btn-danger mr-2" onclick="confirmDelete()">삭제</button>
		  <button type="button" class="btn btn-success mr-2">답변보기</button>
	    </div>
	</form>
	</div>
<!-- 	
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
 -->	
</div>

<script>
$('#summernote').summernote({
    placeholder: '내용',
    tabsize: 2,
    height: 300
  });
</script>

	<script>
		// 객관식 항목 추가 버튼 클릭시 #multipleBox 밑에 .multipleRow추가
		const addMultiple = document.getElementById("addMultiple");
		addMultiple.addEventListener("click", function(event){
			event.preventDefault();
			let rowCount = document.getElementsByClassName("multipleRow").length + 1;
			let rowDiv = document.createElement("div");
			rowDiv.setAttribute("class", "multipleRow")
			let multipleNoInput = '<input type="number" name="multipleNo" value="0" style="display:none">'; // 새로 추가되는 multipleNo 인풋태그는 기본값으로 0 할당
			let noInput = '<input class="multipleNoInput" type="number" name="no" value="' + rowCount + '">';
			let contentInput = '<input class="multipleContentInput" type="text" name="multipleContent" placeholder="내용">';
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
				event.currentTarget.parentNode.setAttribute("class", "deleteRow");
				event.currentTarget.parentNode.children[0].setAttribute("name", "deleteNo"); // multipleNo값을 deleteNo로 컨트롤러에 보냄 -> 삭제 작업 수행
		}
		
		// 파일 다운로드 스크립트 부분
		document.getElementById("download").onclick = () => {
			  window.location = '../download?fileId='+`${file.fileId}`;
			  
			}
		

	</script>
	<script>
	function confirmDelete() {
	    if(confirm("정말 삭제하시겠습니까?")) {
		    location.href="delete?no=${question.questionNo}";
	    }
	}
	
	</script>
</body>
</html>