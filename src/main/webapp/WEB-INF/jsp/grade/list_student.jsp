<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../room/room_header.jsp" />

<div class="room_contents">

  <div class="container" id="grade_contents">
    <div class="inputGroupText mb-3">과제 목록</div>
    <ul id="grade_list" style="display: flex">
      <li class="d-flex" v-for="assignment in assignments">
        <div class="col-10 d-flex flex-wrap align-content-around">
          <div v-for="submit in submits"  v-if="submit.assignmentNo == assignment.assignmentNo">
            <!-- 마감일이 지난 경우 -->
            <div v-if="filterByDeadline(assignment.deadline)"
              class="bg-light text-secondary grade-assignment-card text-center font-weight-bold d-flex flex-column justify-content-center border m-1 rounded-lg">
              <a class="d-block text-truncate" v-bind:href="`../assignment/detail?assignmentNo=`+submit.assignmentNo"
                :title="submit.assignment.title"> {{ submit.assignment.title }} </a>
              <div>{{ submit.score }}</div>
            </div>
            <!-- 과제를 제출한 경우 -->
            <div v-else-if="submit.createDate != null"
              class="bg-info text-white grade-assignment-card text-center font-weight-bold d-flex flex-column justify-content-center border m-1 rounded-lg">
              <a class="d-block text-truncate" v-bind:href="`../assignment/detail?assignmentNo=`+submit.assignmentNo"
                :title="submit.assignment.title"> {{ submit.assignment.title }} </a>
              <div>{{ submit.score }}</div>
            </div>
            <!-- 과제를 제출하지 않은 경우 -->
            <div v-else-if="submit.createDate == null"
              class="bg-danger text-white grade-assignment-card text-center font-weight-bold d-flex flex-column justify-content-center border m-1 rounded-lg">
              <a class="d-block text-truncate" v-bind:href="`../assignment/detail?assignmentNo=`+submit.assignmentNo"
                :title="submit.assignment.title"> {{ submit.assignment.title }} </a>
              <div>{{ submit.score }}</div>
            </div>
          </div>
      </li>
    </ul>
  </div>
</div>
<script>
    const submitsJson = eval('(' + '${submits}' + ')');
    console.log(submitsJson);
    const assignmentsJson = eval('(' + '${assignments}' + ')');
    console.log(assignmentsJson);
    var grade_list = new Vue({
    	el : '#grade_list',
    	data : {
    	    assignments : assignmentsJson,
    	    submits : submitsJson
    	},
    	methods : {
    	filterByDeadline : function (deadline) {
    	    console.log(deadline);
    	    console.log(Date.now());
    			console.log(deadline - Date.now() < 0);
    		    if(deadline - Date.now() < 0) {
    			    return true;
    		    } else {
    			    return false;
    		    }
    	    }
    	}
    })
</script>
</body>
</html>