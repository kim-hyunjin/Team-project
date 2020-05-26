<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../room/room_header.jsp"></jsp:include>

    <div class="room_contents">
    	  <span class="d-flex flex-row-reverse">
		    <i class="fas fa-times" onclick="location.href='../lesson/list?room_no=${clazzNow.classNo}'" style="font-size:2em; cursor:pointer"></i>
		  </span>
		 <span class="inputGroupText">질문 추가하기</span>
		    <form action='add' method='post' enctype='multipart/form-data'>
		    <div class="inputGroup">
		        <input id="titleInput" name="title" type="text" placeholder="제목">
		        <textarea id="summernote" name="content"></textarea>
		        <label for="partfile-input">파일 첨부하기</label><input id="partfile-input" name="partfile" type="file" style="font-size:1em;">
		        <div class="d-flex justify-content-around">
			        <span class="inputGroupSpan">
			        	<label for="startdate">시작일</label><input id="startdate" name="startDate" type="date">
			        </span>
			        <span class="inputGroupSpan">
			        	<label for="enddate">마감일</label><input id="enddate" name="deadline" type="date">
			        </span>
		        </div>
		        </div>
				<div id="multipleBox">
					<button type="button" id="addMultiple" class="btn btn-light btn-sm">객관식 항목 추가</button>
				</div>
				<div class="d-flex flex-row-reverse">
		        <button class="btn btn-primary">생성</button>
		        </div>
		    </form>
    </div>

  <script>
  $('#summernote').summernote({
      placeholder: "질문 내용",
      tabsize: 2,
      height: 300
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
	

</script>

</body>
</html>