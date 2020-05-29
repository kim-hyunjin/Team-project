<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../room/room_header.jsp"></jsp:include>
<div class="room_contents">
  <div class="container">
    <span class="d-flex flex-row-reverse"> <i class="fas fa-times"
      onclick="location.href='javascript:history.back()'" style="font-size: 2em; cursor: pointer"></i>
    </span>
    <!-- 질문상세정보 -->
    <div class="d-flex flex-column inputGroup border-bottom" id="question_detail">
      <div>
        <label class="inputGroupText">제목</label> <input value="${question.title}" readonly>
      </div>
      <textarea readonly class="mt-3 mb-3 form-control" style="height:10em; background-color:white;">${question.content}</textarea>
      <div class="d-flex justify-content-between mt-3 mb-3">
        <div>
          <label class="inputGroupText">파일</label><span id="download" title="다운로드" style="cursor: pointer;">${file.originalName}</span>
        </div>
        <div>
          <label class="inputGroupText">마감일</label><span style="font-weight: bold; font-size: 1.2em;">${question.deadline}</span>
        </div>
      </div>
    </div>
    <!-- 이전에 제출한 답변이 없는 경우-->
    <c:if test="${empty answer}">
      <form class="d-flex justify-content-between" name="submit_form" action='submit' method='post' enctype='multipart/form-data'>
        <input name='questionNo' type='hidden' value='${question.questionNo}'>
        <!-- 객관식 렌더링 -->
          <div id="multipleBox" class="col-6 d-inline-flex flex-column form-check">
        <c:if test="${not empty multiple}">
            <label class="inputGroupText mt-5">객관식 항목</label>
            <c:forEach items="${multiple}" var="m">
              <div class="multipleRow">
                <input class="checkMultiple form-check-input" type="radio" name="multipleNo" value="${m.multipleNo}"
                  style="width: 1em; height: 1em;"> <label class="form-check-label ml-3"
                  style="font-size: 1.2em;"> <span class="mr-2 text-primary">${m.no}</span> <span>${m.multipleContent}</span>
                </label>
              </div>
            </c:forEach>
        </c:if>
          </div>
        <!-- 주관식 답변 렌더링 -->
        <div class="col-6 d-flex flex-column mt-5 mb-5" id="answer_part">
            <textarea id="student_answer_content" class="form-control" name='content' placeholder="답변" style="height:10em;"></textarea>
          <div class="d-inline-flex justify-content-between flex-row-reverse mt-5">
            <button id="submit_btn" class="btn btn-primary">제출</button>
          </div>
        </div>
      </form>
    </c:if>
    <!-- 이전에 제출한 답변이 있는 경우 -->
    <c:if test="${not empty answer}">
      <form class="d-flex justify-content-between" name="submit_form" action='updateAnswer' method='post' enctype='multipart/form-data'>
        <input name='questionNo' type='hidden' value='${question.questionNo}'>
        <!-- 객관식 렌더링 -->
        <div id="multipleBox" class="col-6 d-inline-flex flex-column form-check">
          <c:if test="${not empty multiple}">
            <label class="inputGroupText mt-5">객관식 항목</label>
            <c:forEach items="${multiple}" var="m">
              <div class="multipleRow">
                <c:if test="${m.multipleNo eq answer.multipleNo}">
                  <input class="checkMultiple form-check-input" checked="checked" type="radio" name="multipleNo"
                    value="${m.multipleNo}" style="width: 1em; height: 1em;">
                </c:if>
                <c:if test="${m.multipleNo ne answer.multipleNo}">
                  <input class="checkMultiple form-check-input" type="radio" name="multipleNo" value="${m.multipleNo}"
                    style="width: 1em; height: 1em;">
                </c:if>
                <label class="form-check-label ml-3" style="font-size: 1.2em;"> <span class="mr-2 text-primary">${m.no}</span>
                  <span>${m.multipleContent}</span>
                </label>
              </div>
            </c:forEach>
          </c:if>
        </div>
        <!-- 주관식 답변 렌더링 -->
        <div class="col-6 d-flex flex-column mt-5 mb-5" id="answer_part">
            <textarea id="student_answer_content" class="form-control" name='content' placeholder="답변" style="height:10em;">${answer.content}</textarea>
          <div class="d-inline-flex justify-content-between flex-row-reverse mt-5">
            <button id="submit_btn" class="btn btn-primary">변경</button>
            <span id="submit-date">과제제출일 : ${answer.createDate}</span>
          </div>
        </div>
      </form>
    </c:if>
  </div>
</div>
<script>

// 마감일이 지난 경우 수정 불가
const deadline = new Date(`${question.deadline}`);
if(new Date() - deadline > 0) {
    $('#submit_btn').css('display', 'none');
    $('#student_answer_content').attr('readonly', 'readonly');
}


	//파일 다운로드 스크립트
	document.getElementById("download").onclick = () => {
	  window.location = '../download?fileId='+`${file.fileId}`;
	  
	}
	
  </script>
</body>
</html>