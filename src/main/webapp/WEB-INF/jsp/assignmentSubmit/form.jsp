<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="../room/room_header.jsp"/>
	<div class="room_contents">
	<h3>과제명 : ${assignment.title} <i id="detail" class="fas fa-caret-down"></i></h3>
	<div id=assignment_detail_box></div>
	  <form action='add' method='post' enctype='multipart/form-data'>
		  <input name='memberNo' type='hidden' value='${nowMember.memberNo}'>
		  <input name='assignmentNo' type='hidden' value='${assignment.assignmentNo}'>
		  <label>내용</label><textarea name='content'></textarea>
		  <label>제출파일</label><input name='partfile' type='file'>
		  <button>과제제출</button>
	  </form>
	</div>
</div>
<script>
	let status = 0;
	document.getElementById('detail').onclick = () => {
		let boxContent = "";
		if (status == 0) {
			if(`${assignment.content}` != '') {
				boxContent = "<p>과제내용 : " + `${assignment.content}` + "</p>";
			}
			if(`${assignment.file}` != '') {
				boxContent += "첨부파일 : <a href='../assignment/download?file=${assignment.file}'>" + `${assignment.file}` + "</a>";
			}
			document.getElementById("assignment_detail_box").innerHTML = boxContent;
			status = 1;
		} else {
			document.getElementById("assignment_detail_box").innerHTML = "";
			status = 0;
		}

	};

</script>
</body>
</html>