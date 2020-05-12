<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<body>
 
<div id='calendar' style="width: 60%;, height: 60%;"></div>
 
</body>
</html>
