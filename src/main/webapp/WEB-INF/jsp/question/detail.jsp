<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../room/room_header.jsp"></jsp:include>
<div class="room_contents">
  <div class="container">
    <span class="d-flex flex-row-reverse"> <i class="fas fa-times"
      onclick="location.href='javascript:history.back()'" style="font-size: 2em; cursor: pointer"></i>
    </span>
    <form id="questionUpdateForm" action='update' method='post' enctype='multipart/form-data'>
      <div class="inputGroup">
        <input name='questionNo' type='hidden' value='${question.questionNo}'>
        <div>
          <label class="inputGroupText">제목</label> <input name="title" type="text" value="${question.title}">
        </div>
        <textarea name='content' class="form-control" placeholder="내용" style="height: 15em;">${question.content}</textarea>
      </div>

      <div class="d-flex flex-nowrap justify-content-between mb-5 mt-3">
        <div class="col" id="multipleBox">
          <span class="inputGroupText">객관식항목</span>
          <button id="addMultiple" class="btn btn-light btn-sm">항목 추가</button>
          <c:if test="${not empty multiple}">
            <c:forEach items="${multiple}" var="m">
              <div class="multipleRow">
                <input type="hidden" name="multipleNo" value="${m.multipleNo}"> <input class="multipleNoInput"
                  type="number" name="no" value="${m.no}"> <input class="multipleContentInput" type="text"
                  name="multipleContent" value="${m.multipleContent}"> <span class="multipleDelete"><i
                  class='fas fa-times'></i></span>
              </div>
            </c:forEach>
          </c:if>
        </div>
        <div class="col d-flex flex-column">
            <div>
              <label class="inputGroupText">파일</label> <span id="download" title="다운로드"
                style="cursor: pointer; font-size: 1em;">${file.originalName}</span>
            </div>
            <input name='partfile' type='file' class="btn btn-light btn-sm mt-2 mb-3" style="width:80%;">
          <div class="inputGroup">
            <label class="inputGroupText" for="startdate">시작일</label><input id="startdate" name="startDate" type="date"
              value='${question.startDate}'>
          </div>
          <div class="inputGroup">
            <label class="inputGroupText" for="enddate">마감일</label><input id="enddate" name="deadline" type="date"
              value='${question.deadline}'>
          </div>
          <small id="input_small"></small>
        </div>
      </div>
      <div class="d-flex flex-row-reverse">
        <button type="button" class="btn btn-primary" onclick="updateSubmit()">변경</button>
        <button type="button" class="btn btn-danger mr-2" onclick="confirmDelete()">삭제</button>
        <button type="button" class="btn btn-success mr-2" onclick="location.href='submitted?qno=${question.questionNo}'">답변보기</button>
      </div>
    </form>
  </div>
</div>

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
	    Swal.fire({
                title: '정말 삭제하시겠습니까?',
                text: "삭제하면 되돌릴 수 없습니다.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#A4A4A4',
                cancelButtonText: '취소',
                confirmButtonText: '삭제'
              }).then((result) => {
                if (result.value) {
                    location.href="delete?no=${question.questionNo}";
                }
        
      });
	}
	

	function updateSubmit() {
	    const updateForm = document.getElementById('questionUpdateForm');
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