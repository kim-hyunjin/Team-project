<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../room/room_header.jsp" />

<div class="room_contents">

  <div class="container" id="grade_contents">
  <c:if test="${empty assignments}">
   <div class="w-100 text-center">
     <img src="${pageContext.servletContext.contextPath}/images/why.png" style="width:10em;">
     <h1 class="text-info">아직 과제가 없어요 :)</h1>
   </div>  
  </c:if>
  <c:if test="${not empty assignments }">
    <ul id="grade_list" class="d-flex flex-column" style="font-size:1.2em;">
      <li class="d-flex">
        <div class="col-3" style="color:#66ccff; font-weight:bold;">과제명</div>
        <div class="col-1" style="color:#66ccff; font-weight:bold;">점수</div>
        <div class="col-7" style="color:#66ccff; font-weight:bold;">피드백</div>
      </li>
      <li class="mt-2 border-bottom" v-for="assignment in assignments">
          <div v-for="submit in submits"  v-if="submit.assignmentNo == assignment.assignmentNo" 
          v-bind:onclick="`location.href='../assignment/detail?assignmentNo=`+submit.assignmentNo +`'`"
          onmouseover="this.style.backgroundColor='#CCCCCC'" onmouseleave="this.style.backgroundColor='white'" style="cursor:pointer;">
          <!-- 과제를 제출한 경우 -->
            <div v-if="submit.createDate != null"
              class="d-flex align-items-center" style="height:3em;">
              <div class="bg-info" style="width:0.5em; height:90%;"></div>
              <span class="d-block text-truncate col-3" 
                :title="submit.assignment.title"> {{ submit.assignment.title }} </span>
              <div class="col-1">{{ submit.score }}</div>
              <div class="col-7">
                <div class="d-block text-truncate" :title="submit.feedback">{{submit.feedback}}</div>
              </div>
            </div>
            <!-- 과제를 제출하지 않은 경우 -->
            <div v-else-if="submit.createDate == null"
              class="d-flex align-items-center" style="height:3em;">
              <div class="bg-danger" style="width:0.5em; height:90%;"></div>
              <span class="d-block text-truncate col-3"
                :title="submit.assignment.title"> {{ submit.assignment.title }} </span>
              <div class="col-1">{{ submit.score }}</div>
              <div class="col-7">
                <div class="d-block text-truncate">{{submit.feedback}}</div>
              </div>
            </div>
            <!-- 마감일이 지난 경우 -->
            <div v-else-if="filterByDeadline(assignment.deadline)"
              class="d-flex align-items-center" style="height:3em;">
              <div class="bg-secondary" style="width:0.5em; height:90%;"></div>
              <span class="d-block text-truncate col-3"
                :title="submit.assignment.title"> {{ submit.assignment.title }} </span>
              <div class="col-1">{{ submit.score }}</div>
              <div class="col-7">
                <div class="d-block text-truncate">{{submit.feedback}}</div>
              </div>
            </div>
          </div>
      </li>
    </ul>
    </c:if>
  </div>
</div>

<script>
    const submits = '${submits}';
    const assignments = '${assignments}';
    const submitsJson = JSON.parse(decodeURIComponent(submits).replace(/\+/g," "));
    const assignmentsJson = JSON.parse(decodeURIComponent(assignments).replace(/\+/g," "));
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