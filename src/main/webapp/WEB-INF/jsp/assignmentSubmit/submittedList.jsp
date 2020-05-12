<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="../room/room_header.jsp"/>
  <div class="room_contents">
    <ul id="submitted_list">

    </ul>

  </div>

</div>
<script>
const submittedList = ${submittedList};
console.log(submittedList);
const ulTag = document.getElementById("submitted_list");
let submitted = null;
// json으로 넘겨받은 제출물 리스트를 HTML로 만들어서 출력
for(let i = 0; i < submittedList.length; i++) {
  submitted = submittedList[i];
  let assignmentLi = document.createElement("li");
  assignmentLi.setAttribute("class", "submitted_list__li");
  let innerLi = "<span style='margin-right:2em;'><a href='../user/detail?user_no="+ submitted.user.userNo 
  + "&room_no=" + ${clazzNowNo} + "&member_no=" + ${nowMember.memberNo} +"'>"
  + submitted.user.name + "</a></span>"
  + "<span><a href='../assignmentSubmit/review?assignmentNo="+ submitted.assignmentNo 
	+"&memberNo="+ submitted.clazzMember.memberNo +"'>제출과제보기</a></span>";
	
	// 과제 평가여부 표시
  if(submitted.score != null || submitted.feedback != null) {
    innerLi += "<span style='color:green; margin-left:1em;'>평가완료</span>"
  } else {
    innerLi += "<span style='color:gray; margin-left:1em;'>미평가</span>"
  }



  assignmentLi.innerHTML = innerLi;
  ulTag.appendChild(assignmentLi);
}

</script>
</body>
</html>