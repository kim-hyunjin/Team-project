<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../room/room_header.jsp"></jsp:include>

<div class="room_contents">
	<div class="container">
		<span class="d-flex flex-row-reverse"> <i class="fas fa-times"
			onclick="location.href='javascript:history.back()'"
			style="font-size: 2em; cursor: pointer"></i>
		</span> <span class="inputGroupText">질문 추가하기</span>
		<form id="addForm" action='add' method='post'
			enctype='multipart/form-data'>
			<div class="inputGroup">
				<input id="titleInput" name="title" type="text" placeholder="제목" maxlength="50">
				<textarea class="form-control" name="content" placeholder="질문내용" style="height:15em;"></textarea>
			</div>
			<div class="d-flex mt-3 mb-5">
				<div class="col d-flex flex-column">
					<label class="inputGroupText" for="partfile-input">파일 첨부하기</label>
					<input id="partfile-input" name="partfile" type="file"
						class="btn btn-light btn-sm">
					<div class="mt-5" id="multipleBox">
						<button type="button" id="addMultiple"
							class="btn btn-secondary btn-sm">객관식 항목 추가</button>
					</div>
				</div>
				<div class="col d-flex flex-column inputGroup">
					<label class="inputGroupText" for="startdate">시작일</label><input
						id="startdate" name="startDate" type="date"> <label
						class="inputGroupText" for="enddate">마감일</label><input
						id="enddate" name="deadline" type="date"> <small
						id="dateHelp"></small>
				</div>
			</div>

			<div class="d-flex flex-row-reverse">
				<button type="button" onclick="formSubmit()" class="btn btn-primary">생성</button>
			</div>
		</form>
	</div>
</div>
<script>
$(document).ready(function() {
    document.getElementById('startdate').value = new Date().toISOString().substring(0, 10);
 });
  
	// 객관식 항목 추가 버튼 클릭시 #multipleBox 밑에 .multipleRow추가
	const addMultiple = document.getElementById("addMultiple");
	addMultiple.addEventListener("click", function(event){
		event.preventDefault();
		let rowCount = document.getElementsByClassName("multipleRow").length + 1;
		let rowDiv = document.createElement("div");
		rowDiv.setAttribute("class", "multipleRow")
		let noInput = '<input type="number" name="no" placeholder="번호" value="'+ rowCount +'">';
		let contentInput = '<input type="text" name="multipleContent" placeholder="내용">';
		let deleteIcon = '<span class="multipleDelete" onclick="deleteEvent(event)"><i class="fas fa-times"></i></span>';
		rowDiv.innerHTML = noInput + contentInput + deleteIcon;
		addMultiple.parentNode.appendChild(rowDiv);
	});

	// .multipleRow에서 X버튼 클릭시 해당 객관식 항목을 안보이게 숨김.
	let el = document.getElementsByClassName("multipleDelete");
	for (let row of el) {
			row.addEventListener("click", deleteEvent);
	}
	function deleteEvent(event) {
			event.currentTarget.parentNode.parentNode.removeChild(event.currentTarget.parentNode);
	}
	
	function formSubmit() {
	    let addform = document.getElementById('addForm');
	    if(addform.title.value == '') {
			addform.title.focus();
			$('#titleInput').attr("placeholder", "제목을 입력해주세요!");
	    } else if(!addform.startDate.value) {
			addform.startDate.focus();
			$('#dateHelp').html("시작일을 입력해주세요!").css('color', 'red');
	    } else if(!addform.deadline.value) {
			addform.deadline.focus();
			$('#dateHelp').html("마감일을 입력해주세요!").css('color', 'red');
	    } else {
			addform.submit();
	    }
	}
</script>

</body>
</html>