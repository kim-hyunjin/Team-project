<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <h1>게시물추가하기</h1>
		    <form action='../post/add' method='post' enctype='multipart/form-data' onsubmit='return formCheck(this)'>
		    
			    <input name="boardNo" type="hidden" value="${boardNo}">
		      <tr>
		        <th>제목: </th>
		        <td><input id='titleInput' name='title' type='text' placeholder='제목을 입력하세요.'/></td>
		      </tr><br>
		      <tr>
		        <th>내용: </th><br>
		        <td><textarea name='content' rows='10' cols='50' placeholder='내용을 입력하세요.'></textarea></td>
		      </tr><br>
		      <hr>
		      <tr>
		        <th>첨부파일: </th>
		        <td><a href="download?file=${post.file}">${post.file}</a><br>
		        파일: <input name='partFile' type='file'><br>
		        파일: <input name='partFile' type='file'><br>
		        파일: <input name='partFile' type='file'><br>
		      </tr><br>
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


<!-- 
     <h1>게시물추가하기</h1>
        <form action='../post/add' method='post' enctype='multipart/form-data' onsubmit='return formCheck(this)'>
        
          <input name="boardNo" type="hidden" value="${boardNo}">
          <tr>
            <th>제목: </th>
            <td><input id='titleInput' name='title' type='text' placeholder='제목을 입력하세요.'/></td>
          </tr><br>
          <tr>
            <th>내용: </th><br>
            <td><textarea name='content' rows='10' cols='100' placeholder='내용을 입력하세요.'></textarea></td>
          </tr><br>
          <tr>
            <th>첨부파일: </th>
            <td><input name='partFile' type='text' placeholder='파일을 선택하세요.'/></td>
          </tr><br>
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
 -->

    