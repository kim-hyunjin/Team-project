<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<jsp:include page="../room/room_header.jsp"></jsp:include>
  <div class="room_contents">
	<form name="submit_form" action='submit' method='post' enctype='multipart/form-data' style="display:flex">
    <div id="question_detail" style="width:50%;">
		  <input name='questionNo' type='hidden' value='${question.questionNo}'>
		  <h4>제목</h4>${question.title}
		  <h4>내용</h4><textarea readonly style="width:90%; height:50%; resize:none;">${question.content}</textarea>
			<div id="multipleBox">
		  	<c:if test="${not empty multiple}">
		  	<h4>객관식 항목</h4>
		  	  <c:forEach items="${multiple}" var="m">
						<div class="multipleRow">
		  	    	<input class="checkMultiple" type="radio" name="multipleNo" value="${m.multipleNo}">${m.no}, ${m.multipleContent}<br>
						</div>
					</c:forEach>
		  	</c:if>
			</div>
		  <h4>파일</h4><span id="download" title="다운로드" style="cursor:pointer;">${file.originalName}</span>
		  <h4>마감일</h4>${question.deadline}
		  <h4>시작일</h4>${question.startDate}
		</div>
		<div id="answer_part" style="width:50%;">
		  <h4>답변</h4>
      <textarea id="submit_content" name='content' style="width:100%; height:50%; resize:none;"></textarea>
		  <button id="submit_btn">제출</button>
		</div>
	</form>
	</div>
</div>
  <script>
	const answer = ${answer}; // 이전에 과제를 제출한 적 있다면 제출form을 변경form으로 바꾼다.
	if(answer !== null) {
	    let form = document.submit_form;
	    form.action = "updateAnswer";
	    const multipleNo = answer.multipleNo;
	    const content = answer.content;
	    if(multipleNo !== null) { // 이전에 객관식 답변을 했다면 해당 객관식 번호 radio에 체크표시함
	      const checkMultiple = document.getElementsByClassName("checkMultiple");
	      for(let i of checkMultiple) {
	        if(i.value == multipleNo) {
	          i.setAttribute("checked", "checked");
	        }
	      }
	    }
	    if(content !== undefined) { // 이전에 객관식 답변을 했다면 출력함
	      document.getElementById("submit_content").value = content;
	    }
	    document.getElementById("submit_btn").innerHTML = "변경";
	    let submitDate = document.createElement("p");
	    submitDate.innerHTML = "과제 제출일 : " + answer.createDate;
	    form.appendChild(submitDate);
	  }
	
	//파일 다운로드 스크립트
	document.getElementById("download").onclick = () => {
	  window.location = '../download?fileId='+`${file.fileId}`;
	  
	}
  </script>
</body>
</html>