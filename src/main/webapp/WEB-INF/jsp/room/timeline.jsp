<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <jsp:include page="room_header.jsp"/>

  <div id="timeline_contents"></div>
    <script>
      let posts = eval('('+ '${postJson}' +')');
      let assignments = eval('('+ '${assignmentJson}' +')');
      let questions = eval('('+ '${questionJson}' +')');

      let all = posts.concat(assignments).concat(questions);
      let sortingField = "createDate";
      all.sort(function(a, b) {
        return b[sortingField] - a[sortingField];
      });
      console.log(all);

      const contentbox = document.getElementById("timeline_contents");
      let content = "";
      const POST = "postNo";
      const ASSIGNMENT = "assignmentNo";
      const QUESTION = "questionNo";
      for(let item of all) { // 리스트에 담긴 객체들의 값을 출력하는 html 작성
        content += `<div class="timeline_content">` +
          `<div class="timeline_content__header">`;
          if(item.hasOwnProperty(POST)) { // 게시글의 종류에 따라 다른 아이콘과 링크 적용
            content += `<span class="timeline_content__category"><i class="far fa-flag"></i></span>`
            + `<span class="timeline_content__title"><a href="../post/detail?no=`+ item.postNo +`">` + item.title + `</a></span>`;
          } else if(item.hasOwnProperty(ASSIGNMENT)) {
            content += `<span class="timeline_content__category"><i class="fas fa-pen-square"></i></span>`
            + `<span class="timeline_content__title"><a href="../assignment/detail?no=`+ item.assignmentNo +`">` + item.title + `</a></span>`;
          } else if(item.hasOwnProperty(QUESTION)) {
            content += `<span class="timeline_content__category"><i class="fas fa-question-circle"></i></span>`
            + `<span class="timeline_content__title"><a href="../question/detail?qno=`+ item.questionNo +`">` + item.title + `</a></span>`;
          }
          + `<span class="timeline_content__more"><i class="fas fa-ellipsis-v"></i></span>` // more버튼
          +`</div>` // timeline_content__header 끝
          + `<div class="timeline_content__date">`;
            let date = new Date(item.createDate);
            content += date.toLocaleString() + `</div>`
        +`</div>`;//timeline_content 끝
      }
      console.log(contentbox);
      contentbox.innerHTML = content;


    </script>
</body>
</html>

