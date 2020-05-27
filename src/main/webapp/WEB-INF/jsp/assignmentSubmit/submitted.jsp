<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="../room/room_header.jsp"/>
  <div class="room_contents">
	<div class="d-flex">
		<div class="col-2 d-flex flex-column submitted_assignment_detail" style="border-right:thin solid rgba(0,0,0,0.1)">
			<label class="inputGroupText">과제명</label>
			<div id="assignment_title">${assignment.title}</div>
			<label class="inputGroupText">과제내용</label>
			<div id="assignment_content">${assignment.content}</div>
			<label class="inputGroupText">마감일</label>
			<div id="assignment_deadline">${assignment.deadline}</div>
			<select class="mt-5 form-control" id="filter-select" onclick="activeFilter(this.value)">
				<option>전체</option>
				<option>평가완료</option>
				<option>미평가</option>
			</select>
		</div>
		<div class="col-10 d-flex flex-column justify-content-center">
			<ul id="submitted_ul" class="" style="list-style-type:none;">
			  <li v-for="submit in submittedList" style="border-bottom:thin solid rgba(0,0,0,0.1)" class="mb-5">
				<div class="content-card d-flex p-2">
				  <div class="d-flex flex-column col">
					  <div class="card__writer font-weight-bold" style="font-size:1.2em;">{{submit.user.name}}</div>
					  <div class="card__content">{{submit.content}}</div>
					  <label class="inputGroupText mt-3">제출파일</label>
					  <div v-if="submit.file != undefined && submit.fileVO != undefined">
					  	<span class="download" title="다운로드" style="cursor:pointer;" v-bind:fileId="submit.file">{{submit.fileVO.originalName}}</span>
					  </div>
				  </div>
				  <div class="card__footer col">
				  	<form action='evaluation' method='post' enctype='multipart/form-data'>
						<input name="assignmentNo" type="hidden" v-bind:value="submit.assignmentNo" >
						<input name="memberNo" type="hidden" v-bind:value="submit.clazzMember.memberNo">
						<label class="inputGroupText">피드백</label>
					    <textarea name="feedback" class="card__feedback form-control" rows="2">{{submit.feedback}}</textarea>
					    <label class="inputGroupText mt-3">평가점수</label>
					    <input name="score" type="number" class="score form-control" v-bind:value="submit.score"></input>
					    <div class="d-flex flex-row-reverse mt-3">
					    <button class="btn btn-sm btn-light">평가</button>
					    </div>
				    </form>
				  </div>
				</div>
			  </li>
			</ul>
		</div>
	</div>

  </div>

<script>
const submittedList = ${submittedList};
console.log(submittedList);
if(submittedList != undefined) {
	var submit_list = new Vue({
	    el: '#submitted_ul',
	    data: {
	      submittedList: submittedList
	    }
	  })
}
  
//필터 기능
function activeFilter(value) {
	  if(value == "미평가"){
	      submit_list.submittedList = submittedList.filter(function (item) {
		        return item.score == undefined
	      })
	  } else if(value == "평가완료"){
	      submit_list.submittedList = submittedList.filter(function (item) {
	        return item.score != undefined
	      })
	  } else if(value == "전체") {
	      submit_list.submittedList = submittedList;
		  return;
	  }
}
  
  
$('.download').click(function(e) {
	  window.location = '../download?fileId='+ e.target.getAttribute('fileId').value;
})

</script>
</body>
</html>