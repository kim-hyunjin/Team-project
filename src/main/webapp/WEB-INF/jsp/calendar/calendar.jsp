<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../css/calendar/calendar.css"/>
<link rel="stylesheet" type="text/css" href="../../css/calendar/daygrid.css"/>
<link rel="stylesheet" type="text/css" href="../../css/calendar/timegrid.css"/>
</head>
<script type="text/javascript" src="../../script/calendar/calendar.js"></script>
<script type="text/javascript" src="../../script/calendar/daygrid.js"></script>
<script type="text/javascript" src="../../script/calendar/timegrid.js"></script>
<script type="text/javascript" src="../../script/calendar/interaction.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');
	  
	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	    defaultView: 'dayGridMonth',
	    defaultDate: new Date(),
	    header: {
	      left: 'prev,next today',
	      center: 'title',
	      right: ''
	    },
	  });
	  calendar.render();
	});
</script>

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
    content += `<span class="lesson_contents__category"><i class="fas fa-question-circle"></i></span>`
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

<body>
 
<div id='calendar' style="width: 60%;, height: 60%;"></div>
 
</body>
</html>
