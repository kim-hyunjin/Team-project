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
    </head>
    <body>
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
</body>
</html>


    