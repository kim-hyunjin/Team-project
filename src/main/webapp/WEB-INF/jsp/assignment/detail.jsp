<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../room/room_header.jsp"></jsp:include>
<div class="room_contents">
  <div class="container">
    <span class="d-flex flex-row-reverse">
    <c:if test="${nowMember.role == 0}">
      <i class="fas fa-times" onclick="location.href='../lesson/list?room_no=${clazzNowNo}'" style="font-size: 2em; cursor: pointer"></i>
    </c:if>
    <c:if test="${nowMember.role == 1}">
      <i class="fas fa-times" onclick="location.href='javascript:history.back()'" style="font-size: 2em; cursor: pointer"></i>
    </c:if>
    </span>
    <!-- 선생일 때 화면 -->
    <c:if test="${nowMember.role == 0}">
      <form id="assignmentUpdateSubmit" action='update' method='post' enctype="multipart/form-data">
        <input name="memberNo" type="hidden" value="${nowMember.getMemberNo()}">
        <div class="inputGroup">
          <input name="assignmentNo" type="hidden" value="${assignment.assignmentNo}">
          <div>
            <label class="inputGroupText">제목</label><input name="title" value="${assignment.title}">
          </div>
          <textarea class="form-control" name='content' placeholder="내용" style="height: 20em;">${assignment.content}</textarea>
        </div>
        <div class="d-flex mb-5 mt-3">
          <div class="col">
            <span class="inputGroupText">파일</span> <span id="download" title="다운로드"
              style="cursor: pointer; font-size: 1em;">${file.originalName}</span> <input name='partfile' type='file'
              class="btn btn-light btn-sm mt-2 mb-2">
          </div>
          <div class="col">
            <div class="inputGroup">
              <label class="inputGroupText" for="startdate">시작일</label><input id="startdate" name="startDate"
                type="date" value='${assignment.startDate}'>
            </div>
            <div class="inputGroup">
              <label class="inputGroupText" for="enddate">마감일</label><input id="enddate" name="deadline" type="date"
                value='${assignment.deadline}'>
            </div>
            <small id="input_small"></small>
          </div>
        </div>

        <div class="d-flex flex-row-reverse" id="updateDiv">
          <button type="button" class="btn btn-primary" onclick="updateSubmit()">변경</button>
          <button type="button" class="btn btn-danger mr-2" onclick='confirmDelete()'>삭제</button>
          <button type="button" class="btn btn-success mr-2"
            onclick="location.href='../assignmentSubmit/submitted?assignmentNo=${assignment.assignmentNo}&from=0'">제출된
            과제 보기</button>
        </div>
      </form>
    </c:if>

    <!-- 학생일 때 화면 -->
    <c:if test="${nowMember.role != 0 }">

      <div class="inputGroup border-bottom">
        <div>
          <label class="inputGroupText">과제명</label><input readonly value="${assignment.title}">
        </div>
        <textarea readonly class="form-control mt-3 mb-3" style="background-color: white; height: 10em;">${assignment.content}</textarea>
        <div class="d-flex justify-content-around mt-3 mb-3">
          <div class="col-4 p-0">
            <label class="inputGroupText">파일</label><span id="download" title="다운로드"
              style="cursor: pointer; font-size: 1.2em;">${file.originalName}</span>
          </div>
          <div class="col-8 d-flex justify-content-end">
            <label class="inputGroupText" for="enddate">마감일</label><span class="font-weight-bold"
              style="font-size: 1.2em;">${assignment.deadline}</span>
          </div>
        </div>
      </div>
      <!-- 과제 제출물이 없을때 -->
      <c:if test="${empty assignmentSubmit}">
        <form action='../assignmentSubmit/add' method='post' enctype='multipart/form-data'>
          <input name='memberNo' type='hidden' value='${nowMember.memberNo}'> <input name='assignmentNo'
            type='hidden' value='${assignment.assignmentNo}'> <label class="inputGroupText mt-5">과제제출</label>
          <textarea id="student_content" class="form-control" name='content' style="height: 10em;"></textarea>
          <div class="d-flex justify-content-between mt-5 mb-5">
            <div id="file-input">
              <label class="inputGroupText">파일첨부</label><input class="btn btn-sm btn-light" name='partfile' type='file'>
            </div>
            <button id="submit-btn" class="btn btn-primary">과제 제출하기</button>
          </div>
        </form>
      </c:if>
      <!-- 과제 제출물이 있을 때 -->
      <c:if test="${not empty assignmentSubmit}">
        <form action='../assignmentSubmit/update' method='post' enctype='multipart/form-data'>
          <input name='memberNo' type='hidden' value='${nowMember.memberNo}'> <input name='assignmentNo'
            type='hidden' value='${assignment.assignmentNo}'> <label class="inputGroupText mt-5">제출 내용</label>
          <textarea id="student_content" class="form-control" name='content' style="height: 10em;">${assignmentSubmit.content}</textarea>
          <label class="inputGroupText mt-3">제출한 파일</label><span id="submit-download" title="다운로드"
            style="cursor: pointer; font-size: 1.2em;">${assignmentSubmit.fileVO.originalName}</span>
          <c:if test="${timeout eq false}">
            <div class="d-flex justify-content-between mt-3 mb-5">
              <div id="file-input">
                <label class="inputGroupText">파일변경</label><input class="btn btn-sm btn-light" name='partfile'
                  type='file'>
              </div>
              <button id="submit-btn" class="btn btn-primary">변경</button>
            </div>
          </c:if>
        </form>
      </c:if>
      <c:if test="${assignmentSubmit.feedback != '' || assignmentSubmit.score > 0 }">
        <button type="button" class="btn btn-light mt-3" onclick="showFeedback()">평가 확인하기</button>
        <div id="feedback-contents" style="display: none; margin-bottom: 5em; margin-top: 3em;">
          <div class="d-flex">
            <div class="col-8">
              <label class="inputGroupText">피드백</label>
              <textarea class="form-control" readonly style="resize: none; height:15em;">${assignmentSubmit.feedback}</textarea>
            </div>
            <div class="col-4 d-flex flex-column">
              <label class="inputGroupText">평가점수</label> <input class="form-control" value="${assignmentSubmit.score}"
                readonly>
            </div>
          </div>
        </div>
      </c:if>
    </c:if>
  </div>
</div>
<script>
let showFeedbackStatus = 0;
function showFeedback() {
    if(showFeedbackStatus == 0) {
	    showFeedbackStatus = 1;
	    $('#feedback-contents').css('display', 'block');
    } else {
	    showFeedbackStatus = 0;
	    $('#feedback-contents').css('display', 'none');
    }
    
}

//마감일이 지난 경우 제출 및 수정 불가
  const deadline = new Date(`${assignment.deadline}`);
  if(new Date() - deadline > 0) {
      $('#submit-btn').css('display', 'none');
      $('#file-input').css('display', 'none');
      $('#student_content').attr('readonly', 'readonly');
  }
	</script>
<script>
	//다운로드 관련 스크립트
	document.getElementById("download").onclick = () => {
		window.location = '../download?fileId='+`${file.fileId}`;
		}
	
	document.getElementById("submit-download").onclick = () => {
		window.location = '../download?fileId='+`${assignmentSubmit.fileVO.fileId}`;
		}
	</script>
<script>
//유효성 검사 관련 스크립트
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
                    location.href="delete?no=${assignment.assignmentNo}";
                }

      });
	}
	
	function updateSubmit() {
	    const updateForm = document.getElementById('assignmentUpdateSubmit');
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

