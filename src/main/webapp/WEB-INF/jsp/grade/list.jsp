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
	    <div v-for="submit in submits" v-if="submit.user.userNo == user.userNo" class="assignments_info" >
	      <a v-bind:href="`../assignmentSubmit/review?assignmentNo=`+submit.assignmentNo+`&memberNo=`+submit.memberNo">
  	       <div>{{ submit.assignment.title }}</div>
	      </a>
       <div>{{ submit.score }}</div>
	    </div>
    </li>
  </ul>
</div>

</div>
</div>
<script>


//성적 템플릿
console.log(`${userAssignmentSubmits}`);
var grade_list = new Vue({
    el: '#grade_list',
    data: {
      users: ${clazzMembers},
      submits: ${userAssignmentSubmits}
    }
  })

//필터를 위해 과제 목록을 렌더링
var filter_list = new Vue({
    el: '#filter_list',
    data: {
      assignments: ${assignments}
    }
  })
  
  //과목 div에 링크를 달기 위한 부분
  let linkbox = document.getElementsByClassName("assignments_info");
  for(let l of linkbox) {
	  l.addEventListener("click", function() {
		  var myEvent = new MouseEvent("click", {
			    bubbles: true, cancelable: true, view: window
			  }); 
		  
		  l.getElementsByTagName('a')[0].dispatchEvent(myEvent);
		  
	  })
  }
  
  function activeFilter(value) {
	  if(value == "미제출"){
		  grade_list.submits = ${userAssignmentSubmits};
	    grade_list.submits = grade_list.submits.filter(function (submit) {
	        return submit.assignment.title.match(value);
	      })
	  }
	  if(value == "제출"){
		  grade_list.submits = ${userAssignmentSubmits};
	    grade_list.submits = grade_list.submits.filter(function (submit) {
	        return submit.assignment.title.match(value);
	      })
	  }
	  if(value == "전체") {
		  grade_list.submits = ${userAssignmentSubmits};
		  return;
	  }
	  grade_list.submits = ${userAssignmentSubmits};
	  grade_list.submits = grade_list.submits.filter(function (submit) {
	        return submit.assignment.title.match(value);
	      })
  }


</script>
</body>
</html>