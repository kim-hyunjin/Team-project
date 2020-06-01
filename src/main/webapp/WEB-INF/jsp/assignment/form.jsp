<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../room/room_header.jsp"></jsp:include>

    <div class="room_contents">
    <div class="container">
		   <span class="d-flex flex-row-reverse">
		    <i class="fas fa-times" onclick="location.href='javascript:history.back()'" style="font-size:2em; cursor:pointer"></i>
		  </span>
		  <span class="inputGroupText">과제 추가</span>
		    <form id="addForm"  action='add' method='post' enctype='multipart/form-data'>
		    	<div class="inputGroup">
		        <input id="titleInput" name="title" type="text" placeholder="제목" maxlength="50">
		        <textarea class="form-control" name="content" placeholder="과제내용" style="height:15em;"></textarea>
		        </div>
		        <div class="d-flex mt-3 mb-5">
			        <div class="col d-flex flex-column">
			        	<label class="inputGroupText" for="partfile-input">파일 첨부하기</label>
			        	<input id="partfile-input" name="partfile" type="file" class="btn btn-light btn-sm">
			        </div>
			        <div class="col d-flex flex-column inputGroup">
				        <label class="inputGroupText" for="startdate">시작일</label><input id="startdate" name="startDate" type="date">
				        <label class="inputGroupText" for="enddate">마감일</label><input id="enddate" name="deadline" type="date">
			        	<small id="dateHelp"></small>
			        </div>
		        </div>
		        <div class="d-flex">
		        <button type="button" class="btn btn-secondary" id="standard-add">평가기준 추가</button>
		        </div>
		        <div id="standard_div" style="display:none">
		        <textarea class="form-control mt-3" name="standard" placeholder="평가기준" style="height:10em;"></textarea>
		        </div>
		        <div class="d-flex flex-row-reverse mt-3">
		        <button type="button" class="btn btn-primary" onclick="formSubmit()">생성</button>
		        </div>
		    </form>
    </div>
    </div>
<script>
$(document).ready(function() {
   document.getElementById('addForm').startDate.value = new Date().toISOString().substring(0, 10);
});
  
let standardStatus = 0;
$('#standard-add').click(function() {
    if(standardStatus == 0) {
		standardStatus = 1;
		$('#standard_div').css('display', '');
    } else {
		standardStatus = 0;
		$('#standard_div').css('display', 'none');
    } 
});

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