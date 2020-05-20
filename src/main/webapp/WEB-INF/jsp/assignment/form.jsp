<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../room/room_header.jsp"></jsp:include>

    <div class="room_contents">
		 <h1>과제추가하기</h1>
		    <form action='add' method='post' enctype='multipart/form-data'>
		        <input name="title" type="text" placeholder="제목">
		        <textarea name="content" placeholder="내용"></textarea>
		        <input name="partfile" type="file">
		        <input name="startDate" type="date" placeholder="마감기한">
		        <input name="deadline" type="date" placeholder="마감기한">
		        <textarea name="standard" placeholder="평가기준"></textarea>
		        <button>생성</button>
		    </form>
    </div>
</body>
</html>