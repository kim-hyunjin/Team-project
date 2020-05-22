<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<jsp:include page="../room/room_header.jsp"></jsp:include>

<div class="room_contents">
    
<form action='add' method='post' style="padding-left: 60px" onsubmit='return formCheck(this)'>
    
  <div class="form_title">    
    <label for="titleAdd" style="font-size:1.5em; ">게시판</label>
    <input name="title" type="text" class="form-control" id="boardTitleAdd" aria-describedby="title_aria" style="width:25%;">
    <small id="titleHelp" class="form-text text-muted">게시판명을 입력해주세요.</small>
  </div><br/>
  <div class="form_check"> 
    <label class="form-check-label" for="check1" style="font-size:1em;">공지사항 여부 &nbsp &nbsp &nbsp </label>
    <input type="checkbox" name="notice" class="form-check-input" id="boardCheck">
  </div><br/>
  <button type="submit" class="btn btn-primary" onclick="submitBtn();">생성</button>
</form>
  
</div>
</body>
<script>
  function formCheck(frm) {
    if (frm.title.value == "") {
    	swal("제목을 입력해 주세요");
      frm.title.focus();
      return false;
    }
    return true;
  }
  
  function submitBtn() {
	     swal("등록되었습니다!", "", "success");
	  }

  </script>
</html>

​




<!--

* 이전 소스
 
 <div class="room_contents">
     <h3>게시판추가하기</h3>
        <form action='add' method='post' onsubmit='return formCheck(this)'>
            <input name="title" type="text" placeholder="제목"><br/>
            <label>공지여부</label><input name="notice" type="checkbox"></input><br/>
            <button>생성</button>
        </form>
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
-->