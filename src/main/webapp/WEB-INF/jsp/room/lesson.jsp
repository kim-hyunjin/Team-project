<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="room_header.jsp" />
<style>
html, body, aside {
	height: 100%;
}
</style>


<div id="lesson_main_contents" class="container-fluid d-flex" style='margin-top: 8em; height: 100%;'>
<div class="col-1"></div>
  <aside class="col-2" id='lesson_aside'>
    <div id="alarm_box" style="width: 100%; height: 50%; font-size:1.2em; border-radius: 0.5rem;">
      <i class="fas fa-lightbulb text-warning"></i>
      <ul id="alarm_contents">
        <li v-for="post in posts">
          <div class="d-flex align-items-center">
            <span class="bade badge-primary badge-pill" style="font-size:0.5em;">new</span>
            <a href="#" class="d-inline-block text-truncate" :onclick="`postDetailModal('`+post.title+`','`+post.content+`')`">{{post["title"]}}</a>
          </div>
        </li>
        <li v-for="item in items" v-if="dateConfigure(item.deadline)">
          <span v-if="item.hasOwnProperty('questionNo')"> 
            <a v-bind:href="`../question/detail?qno=`+item.questionNo">
              <span class="alarm_box__icon">
                <i class="fas fa-question-circle text-info"></i>
              </span>
              <span title='마감일이 임박했습니다.'>{{ item["title"] }}</span>
            </a>
          </span>
          <span v-if="item.hasOwnProperty('assignmentNo')">
           <a v-bind:href="`../assignment/detail?assignmentNo=`+ item.assignmentNo">
            <span class="alarm_box__icon">
              <i class="fas fa-pen-square"></i>
            </span>
            <span title='마감일이 임박했습니다.'>{{ item["title"] }}</span>
           </a>
          </span>
        </li>
      </ul>
    </div>
    <form id="filter" style="width: 100%;">
      <select class="form-control" onclick="activeFilter(this.value)" style="width: 100%; border-radius: 0.5rem;">
        <option value="0">전체</option>
        <option value="1">과제</option>
        <option value="2">질문</option>
      </select>
    </form>
  </aside>
  <section class="col-9" id='lesson_section'>
    <div id='lesson_section_add'>
      <div id='lesson__create-div' onclick='lessonAddActive()'>
        <i class="fas fa-plus"></i>만들기
      </div>
      <div id='lessonAddActiveDiv' style='display: none;'>
        <div onclick='location.href="../assignment/form"' onmouseover='this.style.backgroundColor="#b3ecff"'
          onmouseleave='this.style.backgroundColor="white"' id="assignment_add_btn">
          <i class="fas fa-pen-square"></i>과제 추가
        </div>
        <div onclick='location.href="../question/form"' onmouseover='this.style.backgroundColor="#b3ecff"'
          onmouseleave='this.style.backgroundColor="white"' id="question_add_btn">
          <i class="fas fa-question-circle text-info"></i>질문 추가
        </div>
      </div>
    </div>
    <div id="lesson_box" style="width: 70%;">
      <c:if test="${assignmentJson eq '%5B%5D'}">
       <div class="w-100 text-center">
         <img src="${pageContext.servletContext.contextPath}/images/why.png" style="width:10em;">
         <h1 class="text-info">아직 과제가 없어요 :)</h1>
       </div>  
      </c:if>
      <ul id="lesson_contents">
        <li class="text-truncate" v-for="item in items">
          <a v-if="item.hasOwnProperty('questionNo')" v-bind:href="`../question/detail?qno=`+item.questionNo">
            <i class="fas fa-question-circle text-info"></i>
            <span>{{ item["title"] }}</span>
          </a> 
          <a v-if="item.hasOwnProperty('assignmentNo')" v-bind:href="`../assignment/detail?assignmentNo=`+ item.assignmentNo">
            <i class="fas fa-pen-square"></i>
            <span>{{ item["title"] }}</span>
          </a>
        </li>
      </ul>
    </div>
  </section>
</div>
<div class="modal fade" id="postDetailModal" tabindex="-1" role="dialog" aria-labelledby="postDetailModalTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title text-truncate" id="postDetailModalTitle"></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <textarea id="postDetailSummernote"></textarea>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal" id="user-update-closeBtn">확인</button>
        </div>
      </div>
    </div>
  </div>

<script>
var agent = navigator.userAgent.toLowerCase();
if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
    $('#lesson_main_contents').html('<div class="w-100 text-center"><img src="${pageContext.servletContext.contextPath}/images/crying.svg" style="width:10em;"><h1>죄송합니다.</h1><h3>다른 브라우저를 사용해주세요.</h3></div>');
    Swal.fire({
        icon : 'warning',
        title : '죄송합니다. Internet Explorer에서는 원활한 서비스를 지원하지 않습니다. 다른 브라우저를 사용해주세요.'
    });
}
</script>

<script>
  
function postDetailModal(postTitle, postContent) {
    $('#postDetailSummernote').summernote({
	    toolbar: false,
	    height: 350
	  });  
	  $('#postDetailSummernote').summernote('disable');
	  $('.note-editable').css('background-color', 'white');
    console.log(postTitle);
    console.log(postContent);
    $('#postDetailModal').modal();
    $('#postDetailModalTitle').html(postTitle);
    $('#postDetailSummernote').summernote('code', postContent);
}
</script>
<script>
//학생이면 만들기 버튼을 숨김
const role = ${nowMember.role};
console.log(role);
if(role !== 0) {
  $('#lesson_section_add').css('display', 'none');
}


var questionJson = '${questionJson}';
var assignmentJson = '${assignmentJson}';
var postJson = '${postJson}';
console.log(postJson);

//서버로부터 받은 자료
let questions = eval("(" + decodeURIComponent(questionJson).replace(/\+/g," ")+")");
let assignments = eval("(" + decodeURIComponent(assignmentJson).replace(/\+/g," ")+")");
let posts = eval("("+decodeURIComponent(postJson).replace(/\+/g," ")+")");
let all = questions.concat(assignments);
console.log(all);

//생성일 순으로 정렬
let sortingField = "createDate";
all.sort(function(a,b) {
  return b[sortingField] - a[sortingField];
});
console.log(all);

// 레슨 템플릿
var lesson_contents = new Vue({
	  el: '#lesson_contents',
	  data: {
	    items: all
	  }
	});

// 알림 템플릿
var alarm_contents = new Vue({
    el: '#alarm_contents',
    data: {
      items: all,
      posts: posts
    },
    methods: {
    	dateConfigure(deadline) {
    	    if(deadline - Date.now() < 172800000 && deadline - Date.now() > 0) {
    	      return true;
    	    } else {
    	      return false;
    	    }
    	}
    }
  });


// 필터 선택에 따라 작업하는 함수	
function activeFilter(value) {
	if(value == 0) {
		lesson_contents.items = all;
	}
	if(value == 1) {
		lesson_contents.items = all.filter(function (item) {
		    return item.hasOwnProperty('assignmentNo');
		  })
	}
	if(value == 2) {
		lesson_contents.items = all.filter(function (item) {
			  		return item.hasOwnProperty('questionNo');
	      })
	}
	
}	

  </script>
<script>
  let lessonAddActiveStatus = 0;
  function lessonAddActive() {
      if(lessonAddActiveStatus == 0) {
	      lessonAddActiveStatus = 1;
	      $('#lessonAddActiveDiv').css('display', '');
      } else {
	      lessonAddActiveStatus = 0;
	      $('#lessonAddActiveDiv').css('display', 'none');
      }
      
  }
  </script>

</body>
</html>

