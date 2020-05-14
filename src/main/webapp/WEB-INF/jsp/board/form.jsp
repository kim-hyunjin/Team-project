<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../room/room_header.jsp"></jsp:include>

    <div class="room_contents">
		 <h1>게시판추가하기</h1>
		    <form action='add' method='post' onsubmit='return formCheck(this)'>
		        <input name="title" type="text" placeholder="제목">
		        <label>공지여부</label><input name="notice" type="checkbox"></input>
		        <button>생성</button>
		    </form>
    </div>
  </div>  
</body>
  <script>
  function formCheck(frm) {
	  if (frm.title.value == "") {
		  alert("제목을 입력해 주세요");
		  frm.title.focus();
		  return false;
	  }
	  return true;
  }
  </script>
</html>