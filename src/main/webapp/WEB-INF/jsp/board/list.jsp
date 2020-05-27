<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="../room/room_header.jsp" />

<body>

<div class="room_contents">

      
       
  <div class="board_part" >
   <c:if test="${nowMember.role == 0}">
       <c:if test="${empty list}" >
         <a href="form">게시판 만들기</a>
       </c:if>
     <div class="d-flex justify-content-between mb-3">
       <i class="fas fa-cog" onclick="func()" id="boardManagement" style="display:inline-block; font-size:1.2em; cursor:pointer;"></i>
       <span id="addlink" style="margin-left:5em; display:none; cursor:pointer;">
       <span onclick='modalActive()'><i class='fas fa-folder-plus' style='font-size:1.2em;' title='게시판을 추가합니다.'></i></span>
       </span>
     </div>  
  </c:if>
     <div class="board_list">
       <c:forEach items="${list}" var="item">
         <div class="d-flex justify-content-between border-bottom board_list__div" style="height:3em; align-items:center;">
            <input name="boardNo" type="hidden" value="${item.boardNo}">
            <span class="board_title_list" onclick="targetControl('../post/list?bno=${item.boardNo}&bTitle=${item.title}')">${item.title}</span>
            <span class="board_update" style="display:none; cursor:pointer;">
              <span onclick='modalActive2(${item.boardNo}, "${item.title}")'><i class='fas fa-edit'></i></span>
            </span>     
	            <span class="board_delete" style="display:none; cursor:pointer;">
	              <a href="delete?no=${item.boardNo}">
		              <i class='fas fa-times'></i>
	              </a>
	            </span>
         </div>
       </c:forEach>
    </div>
  </div>
         

         <div class="post_part" style="position:absolute; position:static top; margin:0px 300px 100px 350px; width:70%; height:150%;">
           <iframe id="iframeTarget" name="postList" class="post_part__content" scrolling="no"></iframe>
         </div>
         
</div>
     
     <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="myModalLabel">게시판 추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
       <form id="boardAddForm" action='add' method='post' onsubmit='return formCheck(this)'>
          <input name="title" type="text" class="form-control" id="boardTitleAdd">
          <small id="titleHelp" class="form-text text-muted">게시판명을 입력해주세요.</small>
      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="submitBtn();">생성</button>
      </div>
    </div>
  </div>
 </div>
  
  <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="myModalLabel">게시판 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
       <form id="boardUpdateForm" action='update' method='post' onsubmit='return formCheck(this)'>
          <input name="boardNo" type="hidden" id="boardNoUpdate">
          <input name="title" type="text" class="form-control" id="boardTitleUpdate">
      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="boardUpdateBtn();">수정</button>
      </div>
    </div>
  </div>
  </div>

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
       $('#boardAddForm').submit();
       swal("등록되었습니다!", "", "success");
    }
  
  function boardUpdateBtn() {
      $('#boardUpdateForm').submit();
      swal("수정되었습니다!", "", "success");
  }

</script>
<script>
    $(document).ready(function() {
            if(${fn:length(list)} > 0) {
              targetControl('../post/list?bno=${list[0].boardNo}&bTitle=${list[0].title}');
            }
        }
    );
    
    function targetControl(url) {
      console.log(url);
      document.getElementById('iframeTarget').src = url;
    }
</script>
<script>
     const role = ${nowMember.role};
     const element = document.getElementById("boardManagement");
     if (role == 0) {
       element.style.display = "";
     } else {
       element.style.display = "none";
     }
     
     let state = 0; // 0일 때 - 기본, 1일 때 - 관리모드
     function func() {
	      if(state == 1) {
	        state = 0;
	        $('#addlink').css("display", "none");
	        $('.board_update').css("display", "none");
	        $('.board_delete').css("display", "none");
	      } else {
	        state = 1;
	        $('#addlink').css("display", "");
	          $('.board_update').css("display", "");
	          $('.board_delete').css("display", "");
	     }
     }

</script>
<script>
    function modalActive(){
        $("#myModal").modal("show");
    }

    function modalActive2(boardNo, title){
	console.log(title);
        $("#myModal2").modal("show");
        $("#boardNoUpdate").val(boardNo);
        $("#boardTitleUpdate").val(title);
    }

$('#myModal').on('shown.bs.modal', function () {
    $('#myInput').focus()
  })
  
$('#myModal2').on('shown.bs.modal', function () {
    $('#myInput').focus()
  })
  
</script>


   </body>

</html>
