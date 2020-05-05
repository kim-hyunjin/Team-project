<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../room/room_header.jsp"></jsp:include>

    <div class="room_contents">
		 <h1>질문추가하기</h1>
		    <form action='add' method='post' enctype='multipart/form-data'>
		        <input name="title" type="text" placeholder="제목">
		        <textarea name="content" placeholder="내용"></textarea>
		        <input name="partfile" type="file">
		        <input name="deadline" type="date" placeholder="마감기한">
		        <button>생성</button>
		    </form>
    </div>
  </div>  
</body>
</html>