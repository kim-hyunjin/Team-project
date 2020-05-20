<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="../room/room_header.jsp"/>
	<div class="room_contents">
	<h3 onselectstart="return false" ondragstart="return false">과제명 : ${assignment.title} <span style="cursor:pointer" title="상세보기"><i id="detail" class="fas fa-caret-down"></i></span></h3>
	<div id=assignment_detail_box></div>
	  <form action='add' method='post' enctype='multipart/form-data' style="margin-top:1em;">
		  <input name='memberNo' type='hidden' value='${nowMember.memberNo}'>
		  <input name='assignmentNo' type='hidden' value='${assignment.assignmentNo}'>
		  <label>내용</label><textarea name='content' style="width:100%; resize:none;" rows="10"></textarea>
		  <input name='partfile' type='file'><br>
		  <button style="margin-left:45%;">과제제출</button>
	  </form>
	</div>
<script>
	let status = 0;
	document.getElementById('detail').onclick = (event) => {
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
			event.currentTarget.setAttribute("class", "fas fa-caret-up");
		} else {
			document.getElementById("assignment_detail_box").innerHTML = "";
			status = 0;
			event.currentTarget.setAttribute("class", "fas fa-caret-down");
		}

	};

</script>
</body>
</html>