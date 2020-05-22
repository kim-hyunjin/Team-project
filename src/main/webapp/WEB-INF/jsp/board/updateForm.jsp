<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    

<jsp:include page="../room/room_header.jsp"></jsp:include>

<div class="room_contents">
    
<form action='update' method='post' style="padding-left: 60px"; onsubmit='return formCheck(this)'>

  <div class="form_title">
    <label for="titleUpdate" style="font-size:1.5em; ">게시판</label>
    <input name="boardNo" type="hidden" value="${board.boardNo}">
    <input name="title" type="text" class="form-control" id="boardTitleUpdate" value="${board.title}" aria-describedby="title_aria" style="width:25%;">
    <small id="titleHelp" class="form-text text-muted">수정할 게시판명을 입력해주세요.</small>
  </div><br/>  
  <button type="submit" class="btn btn-primary" onclick="submitBtn();">수정</button>
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
       swal("수정되었습니다!", "", "success");
    }

</script>
 
</html>











<!-- 

이전소스

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

-->