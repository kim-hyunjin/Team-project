<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/Team-project/css/style.css" />
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
    
<style>

* {
  margin: 0;
  padding: 0;
}
body {
  width: 300px;
}

/* input file type */
.input-file {
  display: inline-block;
}

.input-file [type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0 none;
}
.input-file .file-label {
  display: inline-block;
  min-width: 53px;
  height: 27px;
  line-height: 24px;
  padding: 0 10px;
  border-radius: 2px;
  font-size: 13px;
  background-color: #333;
  color: #fff;
  text-align: center;
}
.input-file .file-name {
  width: 300px;
  background: #f5f5f5;
  height: 27px;
  line-height: 26px;
  text-indent: 5px;
  border: 1px solid #bbb;
}


</style>

    
    </head>
    <body>
     
     <h3>게시글 등록</h3>
     </br>
     
		    <form action='../post/add' method='post' enctype='multipart/form-data' onsubmit='return formCheck(this)'>
			    <input name="boardNo" type="hidden" value="${boardNo}">
			    <h6>제목</h6>
		        <input class="form-control" id='titleInput' name='title' type='text' placeholder='제목을 입력하세요.' style='width: 200px'/>
		      <h6>내용</h6>
            <textarea class="form-control" name='content' rows='10' cols='15' placeholder='내용을 입력하세요.' style='width: 700px'></textarea><br>
        <input name='partFile' type='file'> 
        <br>
        <br>
        <button type="button" class="btn btn-outline-dark btn-sm">확인</button>
		    </form>
		    
        <script>
        
        <!
        function formCheck(frm) {
        	if (frm.title.value == "") {
        		alert("제목을 입력해 주세요.");
        		frm.title.focus();
        		return false;
        	}
        	return true;
        }
        </script>  
</body>
</html>


    