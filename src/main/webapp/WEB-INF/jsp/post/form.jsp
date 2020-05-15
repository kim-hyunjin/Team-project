<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <h1>게시물추가하기</h1>
		    <form action='../post/add' method='post' enctype='multipart/form-data' onsubmit='return formCheck(this)'>
			    <input name="boardNo" type="hidden" value="${boardNo}">
			    <h4>제목</h4>
		        <input id='titleInput' name='title' type='text' placeholder='제목을 입력하세요.'/>
		      <h4>내용</h4>
            <textarea name='content' rows='10' cols='50' placeholder='내용을 입력하세요.'></textarea><br>
            <input name='partFile' type='file'><br>
			    <button>저장</button>
		    </form>
</body>
        <script>
        function formCheck(frm) {
        	if (frm.title.value == "") {
        		alert("제목을 입력해 주세요.");
        		frm.title.focus();
        		return false;
        	}
        	return true;
        }
        </script>  
    </div>
  </div>  
</html>


    