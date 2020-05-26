<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../room/room_header.jsp"></jsp:include>

    <div class="room_contents">
    <div class="container">
		   <span class="d-flex flex-row-reverse">
		    <i class="fas fa-times" onclick="location.href='../lesson/list?room_no=${clazzNow.classNo}'" style="font-size:2em; cursor:pointer"></i>
		  </span>
		  <span class="inputGroupText">과제 추가</span>
		    <form id="addForm" class="inputGroup" action='add' method='post' enctype='multipart/form-data'>
		        <input id="titleInput" name="title" type="text" placeholder="제목">
		        <textarea id="content_summernote" name="content"></textarea>
		        <label for="partfile-input">파일 첨부하기</label><input id="partfile-input" name="partfile" type="file" style="font-size:1em;">
		        <div class="d-flex justify-content-around">
			        <span class="inputGroupSpan">
			        	<label for="startdate">시작일</label><input id="startdate" name="startDate" type="date">
			        </span>
			        <span class="inputGroupSpan">
			        	<label for="enddate">마감일</label><input id="enddate" name="deadline" type="date">
			        </span>
		        </div>
		        <small id="dateHelp" class="form-text text-muted"></small>
		        <div class="d-flex">
		        <button type="button" class="btn btn-secondary" id="standard-add">평가기준 추가</button>
		        </div>
		        <div id="standard_div" style="display:none">
		        <textarea id="standard-summernote" name="standard" placeholder="평가기준"></textarea>
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

$('#content_summernote').summernote({
    placeholder: "과제 내용",
    tabsize: 2,
    height: 300
  });

$('#standard-summernote').summernote({
    placeholder: "평가기준",
    tabsize: 2,
    height: 300
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
		focus(addform.title);
		$('#titleInput').attr("placeholder", "제목을 입력해주세요!");
    } else if(addform.startDate.value == null) {
		focus(addform.startDate);
		$('#dateHelp').html("시작일을 입력해주세요!");
    } else if(addform.deadline.value == null) {
		focus(addform.deadline);
		$('#dateHelp').html("마감일을 입력해주세요!");
    } else {
		addform.submit();
    }
}
</script>
</body>
</html>