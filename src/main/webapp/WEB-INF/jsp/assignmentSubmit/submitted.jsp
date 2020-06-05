<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../room/room_header.jsp" />
<div class="room_contents">
  <span class="d-flex flex-row-reverse">
    <c:if test="${from == 0}">
    <i class="fas fa-times" onclick="location.href='../assignment/detail?assignmentNo=${assignment.assignmentNo}'" style="font-size: 2em; cursor: pointer"></i>
    </c:if>
    <c:if test="${from == 1}">
    <i class="fas fa-times" onclick="location.href='../grade/list?room_no=${clazzNowNo}'" style="font-size: 2em; cursor: pointer"></i>
    </c:if>
  </span>
  <!-- 과제정보 렌더링 -->
  <div class="d-flex">
    <div class="col-2 p-0 pr-5 d-flex flex-column submitted_assignment_detail"
      style="border-right: thin solid rgba(0, 0, 0, 0.1)">
      <label class="inputGroupText">과제명</label>
      <div class="text-truncate">${assignment.title}</div>
      <label class="inputGroupText">과제내용</label>
      <textarea class="form-control p-0 mb-3" style="overflow:hidden; width:100%; height:10em; border:0;">${assignment.content}</textarea>
      <label class="inputGroupText">마감일</label>
      <div>${assignment.deadline}</div>
      <select class="mt-5 form-control" id="filter-select" onclick="activeFilter(this.value)">
        <option>전체</option>
        <option>평가완료</option>
        <option>미평가</option>
      </select> <input id="searchInput" class="form-control mt-3" type="search" placeholder="이름 검색" onkeyup="searchUser(this.value)">
    </div>

    <!-- 학생 제출물 렌더링 -->
    <div class="col-10 d-flex flex-column justify-content-start">
      <ul id="submitted_ul" class="" style="list-style-type: none;">
        <c:forEach items="${memberList}" var="m">
        <c:if test="${m.role == 1}">
        <li class="submit_li" style="border-bottom: thin solid rgba(0, 0, 0, 0.1)" class="mb-5">
          <div class="content-card d-flex p-2">
            <div class="d-flex flex-column col">
              <input class="card__writer font-weight-bold" style="font-size: 1.2em; border:0;" value="${m.user.name}">
              <c:if test="${not empty submitMap.get(m.memberNo)}">
              <textarea class="card__content mt-3 form-control" style="border:0;">${submitMap.get(m.memberNo).content}</textarea>
              <label class="inputGroupText mt-3">제출파일</label>
                <span onclick="downloadFile(${submitMap.get(m.memberNo).fileVO.fileId})" title="다운로드" style="cursor: pointer;">${submitMap.get(m.memberNo).fileVO.originalName}</span>
              </c:if>
              <c:if test="${empty submitMap.get(m.memberNo)}">
                <span style="margin: 1em 0 1em 0;">제출한 과제물이 없습니다 :(</span>
              </c:if>
            </div>
            <c:if test="${not empty submitMap.get(m.memberNo)}">
            <div class="card__footer col">
              <form action='eval' method='post' enctype='multipart/form-data'>
                <c:if test="${from == 0}">
                  <input name="from" value="0" type="hidden">
                </c:if>
                <c:if test="${from == 1}">
                  <input name="from" value="1" type="hidden">
                </c:if>
                <input name="assignmentNo" type="hidden" value="${assignment.assignmentNo}">
                <input name="memberNo" type="hidden" value="${m.memberNo}">
                <label class="inputGroupText">피드백</label>
                <textarea name="feedback" class="card__feedback form-control" rows="2">${submitMap.get(m.memberNo).feedback}</textarea>
                <label class="inputGroupText mt-3">점수</label>
                <input name="score" type="number" min="0" max="9999999999" class="score form-control" value="${submitMap.get(m.memberNo).score}"></input>
                <div class="d-flex flex-row-reverse mt-3">
                  <button class="btn btn-sm btn-primary">평가</button>
                </div>
              </form>
            </div>
            </c:if>
          </div>
        </li>
        </c:if>
        </c:forEach>
      </ul>
    </div>
  </div>

</div>



<script>

    //필터 기능
    function activeFilter(value) {
	    console.log(value);
  	  var name1, name2, item, i;
  	  value = value.toUpperCase();
  	  item = document.getElementsByClassName("submit_li");
  	  for (i = 0; i < item.length; i++) {
  	    name1 = item[i].getElementsByClassName("card__feedback");
  	    name2 = item[i].getElementsByClassName("score");
  	    if (value == "전체") {
  		    item[i].style.display = "list-item";
  	    } else if (value == "평가완료") {
  		    if(name1.length == 0) {
  			    item[i].style.display = "none";
  		    } else if(name1[0].value != "" || name2[0].value > 0) {			
          	item[i].style.display = "list-item";
  		    } else {
    			  item[i].style.display = "none";
    		  }
  	    } else if(value=="미평가"){
  		        if(name1.length == 0) {
  	            item[i].style.display = "none";
  	          } else if(name1[0].value != "" || name2[0].value > 0) {
  	            item[i].style.display = "none";  
  	          } else {
  	            item[i].style.display = "list-item";  
  	          }
  	    }
  	  }
    }
	  

    function downloadFile(fileId) {
	window.location = '../download?fileId=' + fileId;
    }

    //이름 검색 기능
   function searchUser(value) {
	    value = value.toUpperCase();
	    console.log(value);
	    var name, item, i;
	    item = document.getElementsByClassName("submit_li");
	    for (i = 0; i < item.length; i++) {
	        name = item[i].getElementsByClassName("card__writer");
	        if (value.length == 0) {
	          item[i].style.display = "list-item";
	        } else if (name[0].value.toUpperCase().indexOf(value) > -1) {
	          item[i].style.display = "list-item";
	        } else {
	          item[i].style.display = "none";
	        }
	    }
    }
    
</script>
</body>
</html>