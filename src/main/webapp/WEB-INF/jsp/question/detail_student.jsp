<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 상세 정보</title>
<script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
</head>
<body>
	<h1>질문 상세정보</h1>
	<form name="submit_form" action='submit' method='post' enctype='multipart/form-data'>
		  번호 : <input name='questionNo' type='number' readonly value='${question.questionNo}'><br>
		  제목 : ${question.title}
		  <label>내용</label><textarea readonly>${question.content}</textarea><br>
			<div id="multipleBox">
		  	<c:if test="${not empty multiple}">
		  	  <c:forEach items="${multiple}" var="m">
						<div class="multipleRow">
		  	    	<input class="checkMultiple" type="radio" name="multipleNo" value="${m.multipleNo}">${m.no}, ${m.multipleContent}<br>
						</div>
					</c:forEach>
		  	</c:if>
			</div>
		  파일 : ${question.filePath} <br>
		  마감일 : ${question.deadline} <br>
		  생성일 : ${question.createDate}<br>
		  <div>------------------------------------</div>
      <textarea id="submit_content" name='content'></textarea>
		  <button id="submit_btn">제출</button>
	</form>
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
  </script>
</body>
</html>