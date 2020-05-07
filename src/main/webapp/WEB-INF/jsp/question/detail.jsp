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
	<form action='update' method='post'>
		  번호 : <input name='questionNo' type='number' readonly value='${question.questionNo}'><br>
		  <input name='memberNo' type='hidden' value='${question.memberNo}'><br>
		  제목 : <input name="title" type="text" value="${question.title}">
		  <label>내용</label><textarea name='content'>${question.content}</textarea><br>
			<div id="multipleBox">
		  	<c:if test="${not empty multiple}">
		  	  <c:forEach items="${multiple}" var="m">
						<div class="multipleRow">
		  	    	<input type="radio" name="multipleNo" value="${m.multipleNo}">
							<label>${m.no}, ${m.content}</label> 
							<span class="multipleDelete" data-no="${m.multipleNo}"><i class='fas fa-times'></i></span>
						</div>
					</c:forEach>
		  	</c:if>
				<button id="rowAdd">객관식 항목 추가</button>
			</div>
		  파일 : ${question.filePath} 
		  <input name='filePath' type='file'><br>
		  마감일 : <input name='deadline' type='date' value='${question.deadline}'><br>
		  생성일 : ${question.createDate}<br>
		  <button>변경</button>
	</form>
	<a href="delete?no=${question.questionNo}">삭제</a>
	
	<h1>학생 답변 목록</h1>
	<c:if test="${not empty answers}">
	   <c:forEach items="${answers}" var="a">
	     <p>${a.user.name}:</p>
          <c:if test="${not empty a.content}">
             <p>${a.content}</p>
          </c:if>
          <c:if test="${not empty multipleAnswers.get(a.multipleNo)}">
            <p>${multipleAnswers.get(a.multipleNo).no} ${multipleAnswers.get(a.multipleNo).content}</p>
          </c:if>
	   </c:forEach>
	</c:if>

	<script>
		let deleteRequestArr = [];
		let addRequestArr = [];
		let el = document.getElementsByClassName("multipleDelete");
		for (let row of el) {
				row.addEventListener("click", function(event) {
				console.log(event.target);
				console.log(event.currentTarget);
				console.log(event.currentTarget.getAttribute("data-no"));
				deleteRequestArr.push(event.currentTarget.getAttribute("data-no"));
				row.parentNode.parentNode.removeChild(row.parentNode);
				console.log(deleteRequestArr);
		});
		}
		const rowAdd = document.getElementById("rowAdd");
		rowAdd.addEventListener("click", function(event){
			event.preventDefault();
			let rowDiv = document.createElement("div");
			let noInput = '<input type="number" name="no" placeholder="번호">';
			let contentInput = '<input type="text" name="name" placeholder="내용">';
			let deleteIcon = '<span class="multipleDelete" data-no="${m.multipleNo}"><i class="fas fa-times"></i></span>';
			rowDiv.innerHTML = noInput + contentInput + deleteIcon;

			rowAdd.parentNode.appendChild(rowDiv);
		});

		
		

	</script>
</body>
</html>