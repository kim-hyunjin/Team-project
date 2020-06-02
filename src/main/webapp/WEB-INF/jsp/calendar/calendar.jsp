<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../clazz/main_header.jsp" />

<!-- favicon -->
<link rel="favicon" href="images/favicon.ico">
<link rel="shortcut icon" href="http://localhost:9999/Team-project/images/favicon.ico" type="image/x-icon" />
<link rel="icon" href="http://localhost:9999/Team-project/images/favicon.ico" type="image/x-icon" />

<div class='container' style="margin-top: 5em;">
<div id='calendar'></div>
</div>
<div class="modal fade" id="calendarEventModal" tabindex="-1" role="dialog"
	aria-labelledby="calendarEventModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="calendarEventModalLabel">상세 정보</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="calendarEventModalBody">
				<label class="inputGroupText">제목</label><input class="form-control" id='calendar-modal-title'readonly>
				<label class="inputGroupText">설명</label><textarea class="form-control" rows="4" id='calendar-modal-dscription' readonly></textarea> 
				<label class="inputGroupText">시작일</label><input class="form-control" id='calendar-modal-start' readonly> 
				<label class="inputGroupText">종료일</label><input class="form-control" id='calendar-modal-end' readonly>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal"
					id="calendar-modal-close">닫기</button>
				<button type="button" class="btn btn-primary" id="modal-moveToClass">클래스로 이동</button>
			</div>
		</div>
	</div>
</div>


	<script src='${pageContext.servletContext.contextPath}/script/fullcalendar/packages/core/main.js'></script>
	<script src='${pageContext.servletContext.contextPath}/script/fullcalendar/packages/interaction/main.js'></script>
    <script src='${pageContext.servletContext.contextPath}/script/fullcalendar/packages/daygrid/main.js'></script>
    
    <script>
      const assignmentsJson = JSON.parse(`${assignmentList}`);
      const questionsJson = JSON.parse(`${questionList}`);
      
      let eventData = [];
      for(let a of assignmentsJson) {
    	  eventData.push({
    		  title : a.title,
    		  start : a.startDate,
    		  end : a.deadline,
    		  classNames : 'event-assignment',
    		  id : a.assignmentNo,
    		  color: '#009973'
    	  });
      }
      
      for(let q of questionsJson) {
    	  eventData.push({
    		  title : q.title,
    		  start : q.startDate,
    		  end : q.deadline,
    		  classNames : 'event-question',
    		  id : q.questionNo,
    		  color: '#17a2b8'
    	  });
      }
    
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
        	plugins: [ 'interaction', 'dayGrid' ],
            defaultView: 'dayGridMonth',
            header: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth dayGridWeek dayGridDay'
            },
            events: eventData,
            eventTextColor: 'white',
            eventClick: function(info) {
                console.log('Event: ' + info.event.title);
                console.log('id: '+info.event.id);
                console.log('classNames: '+info.event.classNames);
				$('#calendarEventModal').modal('toggle');
                if(info.event.classNames == 'event-assignment') {
                	jQuery.getJSON('eventDetail?no='+info.event.id+'&set=0', function(data) {
                		console.log(data);
                		jQuery('#calendar-modal-title').val(data.title);
                		jQuery('#calendar-modal-dscription').val(data.content);
                		jQuery('#calendar-modal-start').val(data.startDate);
                		jQuery('#calendar-modal-end').val(data.deadline);
                		jQuery('#modal-moveToClass').click(function() {
                			location.href='../room/lesson/list?room_no='+data.classNo;
                		})
                	});
                }
                if(info.event.classNames == 'event-question') {
                	jQuery.getJSON('eventDetail?no='+info.event.id+'&set=1', function(data) {
                		console.log(data);
                		jQuery('#calendar-modal-title').val(data.title);
                		jQuery('#calendar-modal-dscription').val(data.content);
                		jQuery('#calendar-modal-start').val(data.startDate);
                		jQuery('#calendar-modal-end').val(data.deadline);
                		jQuery('#modal-moveToClass').click(function() {
                			location.href='../room/lesson/list?room_no='+data.classNo;
                		})
                	});
                }
                
              },
           eventMouseEnter: function(mouseEnterInfo) {
        	   mouseEnterInfo.el.style.cursor = 'pointer';
           }
        });

        calendar.render();
      });

    </script>
</body>
</html>