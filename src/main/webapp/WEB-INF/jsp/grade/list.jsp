<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../room/room_header.jsp"/>

<div class="room_contents">

<select id="filter_list" onclick="activeFilter(this.value)">
  <option>전체</option>
  <option  v-for="item in assignments">
    {{item.title}}
  </option>
  <option>제출</option>
  <option>미제출</option>
</select>

<div id="grade_contents">
  <ul id="grade_list">
    <li v-for="user in users" v-if="user.role != 0">
	    <span class="user_info">{{user.user.name}}</span>
	    <div v-for="submit in submits" >
	    	<div v-if="submit.user.userNo == user.userNo && submit.hasOwnProperty('createDate')" class="assignments_info green" >
			    <a v-bind:href="`../assignmentSubmit/submitted?assignmentNo=`+submit.assignmentNo" title="제출 과제 확인 및 평가하기">
		  	      <div>{{ submit.assignment.title }}</div>
			    </a>
		       	<div>{{ submit.score }}</div>
	       	</div>
		    <div v-if="submit.user.userNo == user.userNo && !submit.hasOwnProperty('createDate')" class="assignments_info red">
		    	<div>{{ submit.assignment.title }}</div>
		    	<div>{{ submit.score }}</div>
		    </div>
	    </div>
    </li>
  </ul>
</div>

</div>
</div>
<script>
const clazzMembersJson = eval('('+ '${clazzMembers}' +')');
const submitsJson = eval('('+ '${userAssignmentSubmits}' +')');
const assignmentsJson = eval('('+ '${assignments}' +')');


//성적 템플릿
console.log(submitsJson);
var grade_list = new Vue({
    el: '#grade_list',
    data: {
      users: clazzMembersJson,
      submits: submitsJson
    }
  })

//필터를 위해 과제 목록을 렌더링
var filter_list = new Vue({
    el: '#filter_list',
    data: {
      assignments: assignmentsJson
    }
  })
  
  //과목 div에 링크를 달기 위한 부분
  let linkbox = document.getElementsByClassName("assignments_info green");
  for(let l of linkbox) {
	  l.addEventListener("click", function() {
		  var myEvent = new MouseEvent("click", {
			    bubbles: true, cancelable: true, view: window
			  }); 
		  
		  l.getElementsByTagName('a')[0].dispatchEvent(myEvent);
		  
	  })
  }
  
  //필터 기능
  function activeFilter(value) {
	  if(value == "미제출"){
		grade_list.submits = submitsJson.filter(function (item) {
		        return !item.hasOwnProperty("createDate");
	      })
	  } else if(value == "제출"){
	    grade_list.submits = submitsJson.filter(function (item) {
	        return item.hasOwnProperty('createDate');
	      })
	  } else if(value == "전체") {
		  grade_list.submits = submitsJson;
		  return;
	  } else {
	  		grade_list.submits = submitsJson.filter(function (item) {
	        return item.assignment.title.match(value);
	      })
	  }
  }

	  
</script>
</body>
</html>