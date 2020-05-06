<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="../room/room_header.jsp"/>
  
  <div class="room_contents">
  <a href="../assignment/form">과제 추가</a>
  <a href="../question/form">질문 추가</a>
  <div id="lesson_contents">
  </div>
  </div>
  
  <script>
  let questions = eval('('+ '${questionJson}' +')');
  let assignments = eval('('+ '${assignmentJson}' +')');
  
  let all = questions.concat(assignments);
  let = sortingField = "createDate";
  all.sort(function(a,b) {
	  return b[sortingField] - a[sortingField];
  });
  console.log(all);
  
  
  const contentbox = document.getElementById("lesson_contents");
  let content = "";
  const ASSIGNMENT = "assignmentNo";
  const QUESTION = "questionNo";
  for (let item of all) {
	  content += `<div class="lesson_contents">` + 
	  `<div class="lesson_contents__header">`;
  if(item.hasOwnProperty(QUESTION)) {
	  content += `<span class="lesson_contents__category"><i class="fas fa-pen-square"></i></span>`
          + `<span class="lesson_contents__title"><a href="../question/detail?qno=`+ item.questionNo +`">` + item.title + `</a></span>`;
  } else if(item.hasOwnProperty(ASSIGNMENT)) {
      content += `<span class="lesson_contents__category"><i class="fas fa-pen-square"></i></span>`
          + `<span class="lesson_contents__title"><a href="../assignment/detail?no=`+ item.assignmentNo +`">` + item.title + `</a></span>`;
        }
  + `<span class="lesson_contents__more"><i class="fas fa-ellipsis-v"></i></span>` // more버튼
  +`</div>`
  + `<div class="lesson_contents__date">`;
    let date = new Date(item.createDate);
    content += date.toLocaleString() + `</div>`
+`</div>`;
}
 console.log(content);
 console.log(contentbox);
contentbox.innerHTML = content;


  </script>

</body>
</html>

<!-- 
   <h1>과제게시판</h1>
  <a href="../assignment/form">과제 추가</a>
     <table border='1'>
      <c:forEach items="${assignments}" var="item">
      <tr>
      <td>${item.assignmentNo}</td> 
      <td><a href='../assignment/detail?no=${item.assignmentNo}'>${item.title}</a></td> 
      <td>${item.memberNo}</td> 
      <td>${item.createDate}</td>
    </tr>
    </c:forEach>
    </table>
 -->
    