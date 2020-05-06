<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../room/room_header.jsp"></jsp:include>

    <div class="room_contents">
		 <h1>수정</h1>
		    <form action='update' method='post'>
		        <input name="boardNo" type="hidden" value="${boardNo}">
		        <input name="title" type="text" placeholder="제목">
		        <label>공지여부</label><input name="notice" type="checkbox"></input>
		        <button>수정</button>
		    </form>
    </div>
</body>
</html>