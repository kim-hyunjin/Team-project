<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../room/room_header.jsp"/>

<div class="room_contents">

	<div id="grade_contents">
	  <ul id="grade_list" style="display:flex">
	     <li v-for="submit in submits" >
		     <div v-if="submit.hasOwnProperty('createDate')" class="assignments_info green" >
	          <a v-bind:href="`../assignmentSubmit/detail?assignmentNo=`+submit.assignmentNo" title="제출한 과제 보기">
	            <div>{{ submit.assignment.title }}</div>
	          </a>
	          <div>{{ submit.score }}</div>
	       </div>
	       <div v-if="!submit.hasOwnProperty('createDate')" class="assignments_info red">
	         <a v-bind:href="`../assignment/detail?assignmentNo=`+submit.assignmentNo" title="과제 상세 보기">
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
const submitsJson = eval('('+ '${userAssignmentSubmits}' +')');
var grade_list = new Vue({
    el: '#grade_list',
    data: {
      submits: submitsJson
    }
  })

</script>
</body>
</html>