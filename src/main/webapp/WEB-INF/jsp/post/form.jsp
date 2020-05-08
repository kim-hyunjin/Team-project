<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <h1>게시물추가하기</h1>
		    <form action='../post/add' method='post' enctype='multipart/form-data'>
		    
			    <input name="boardNo" type="hidden" value="${boardNo}">
		      <tr>
		        <th>제목: </th>
		        <td><input name='title' type='text' placeholder='제목을 입력하세요.'/></td>
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
    </div>
  </div>  
</body>
</html>



<!--  
<input name='content' type='text'><br>
-->

<!-- 
     <h1>게시물추가하기</h1>
        <form action='../post/add' method='post' enctype='multipart/form-data'>
          <input name="boardNo" type="hidden" value="${boardNo}">
          제목: <input name='title' type='text'><br>
          내용: <br>
          <textarea name='content' rows='10' cols='100'></textarea><br>
          첨부파일: <input name='partFile' type="file"><br>
          <button>저장</button>
        </form>
    </div>
  </div>  
</body>
</html>
-->