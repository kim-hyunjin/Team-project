<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../room/room_header.jsp"></jsp:include>

    <div class="room_contents">
		 <h1>질문추가하기</h1>
		    <form action='add' method='post' enctype='multipart/form-data'>
		        <input name="title" type="text" placeholder="제목">
		        <textarea name="content" placeholder="내용"></textarea>
		        <input name="partfile" type="file">
				<input name="deadline" type="date" placeholder="마감기한">
				<div id="multipleBox">
					<button id="addMultiple">객관식 항목 추가</button>
				</div>
		        <button>생성</button>
		    </form>
    </div>
  </div>  

  <script>
	// 객관식 항목 추가 버튼 클릭시 #multipleBox 밑에 .multipleRow추가
	const addMultiple = document.getElementById("addMultiple");
	addMultiple.addEventListener("click", function(event){
		event.preventDefault();
		let rowDiv = document.createElement("div");
		rowDiv.setAttribute("class", "multipleRow")
		let noInput = '<input type="number" name="no" placeholder="번호">';
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