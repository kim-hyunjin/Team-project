<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="../room/room_header.jsp" />

<body>
  <c:if test="${empty list}">
    <div class="d-flex justify-content-center align-items-center flex-column" style="margin-top: 15em;">
      <c:if test="${nowMember.role == 0}">
        <img src="${pageContext.servletContext.contextPath}/images/why.png" style="width:10em;">
        <h1 class="text-info" onclick='modalActive()' style="cursor: pointer;">새 게시판을 만들어보세요.</h1>
      </c:if>
      <c:if test="${nowMember.role == 1}">
      <img src="${pageContext.servletContext.contextPath}/images/why.png" style="width:10em;">
        <h1 class="text-info">Oops! 게시판이 없네요!</h1>
      </c:if>
    </div>
  </c:if>
  <div class="container-fluid d-flex" style="margin-top: 7em; height: 55em;">
    <div class="board_part col-2 pl-5">
      <c:if test="${not empty list && nowMember.role == 0}">
        <div class="d-flex justify-content-between mb-3" style="height: 1em;">
          <span class="col-10 pl-0"> <i class="fas fa-cog" onclick="func()" id="boardManagement"
            style="display: inline-block; font-size: 1.2em; cursor: pointer;"></i>
          </span> <span class="col-2" id="addlink" style="display: none; cursor: pointer;"> <span
            onclick='modalActive()'><i class='fas fa-folder-plus text-primary' style='font-size: 1.2em;'
              title='게시판을 추가합니다.'></i></span>
          </span>
        </div>
      </c:if>
      <div class="board_list">
        <c:forEach items="${list}" var="item">
          <div class="d-flex justify-content-between border-bottom font-weight-bold board_list__div"
            style="height: 3em; align-items: center;">
            <input name="boardNo" type="hidden" value="${item.boardNo}"> <span class="col-8 board_title_list"
              onclick="targetControl('../post/list?boardNo=${item.boardNo}')">${item.title}</span> <span
              class="col-2 board_update" style="display: none; cursor: pointer;"> <span
              onclick='modalActive2(${item.boardNo}, "${item.title}", ${item.notice})'><i
                class='fas fa-edit text-primary'></i></span>
            </span> <span class="col-2 board_delete" style="display: none; cursor: pointer;"
              onclick="button_del(${item.boardNo})"> <i class='fas fa-times text-primary'></i>
            </span>
          </div>
        </c:forEach>
      </div>
    </div>
    <div class="post_part col-10">
      <iframe id="iframeTarget" name="postList" class="post_part__content" scrolling="no"></iframe>
    </div>
  </div>

  <!-- Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="myModalLabel">게시판 추가</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id="boardAddForm" action='add' method='post' onsubmit='return formCheck(this)'>
            <input name="title" type="text" class="form-control" id="boardTitleAdd" placeholder="추가할 게시판명을 입력해주세요."
              maxlength="50">
            <div class="d-flex mt-3">
              <label class="col-3 text-primary font-weight-bold" for="board-add-select">글쓰기 권한</label> <select
                id="board-add-select" class="form-control col-9" name="notice">
                <option value="0">모두 글 작성 가능</option>
                <option value="1">선생님만 작성 가능</option>
              </select>
            </div>
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
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id="boardUpdateForm" action='update' method='post' onsubmit='return formCheck(this)'>
            <input name="boardNo" type="hidden" id="boardUpdate-boardNo"> <input name="title" type="text"
              class="form-control" id="boardTitleUpdate" placeholder="추가할 게시판명을 입력해주세요." maxlength="50">
            <div class="d-flex mt-3">
              <label class="col-3 text-primary font-weight-bold" for="board-add-select">글쓰기 권한</label> <select
                id="board-add-select" class="form-control col-9" name="notice">
                <option id="boardUpdate-option-0" value="0">모두 글 작성 가능</option>
                <option id="boardUpdate-option-1" value="1">선생님만 작성 가능</option>
              </select>
            </div>
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
	    Swal.fire({
	        icon : 'error',
	        title : '제목을 입력해주세요.',
	    });
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
              targetControl('../post/list?boardNo=${list[0].boardNo}');
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

function button_del(boardNo){
    Swal.fire({
    title: '정말 삭제하시겠습니까?',
    text: '삭제하면 되돌릴 수 없습니다.',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#d33',
    cancelButtonColor: '#A4A4A4',
    cancelButtonText: '취소',
    confirmButtonText: '삭제'
  }).then((result) => {
    if (result.value) {
	location.href='delete?no='+boardNo;
    }
  });
}

</script>

  <script>
    function modalActive(){
        $("#myModal").modal("show");
    }

    function modalActive2(boardNo, title, notice){
    	console.log(boardNo);
    	console.log(title);
    	console.log(notice);
        $("#myModal2").modal("show");
        $("#boardUpdate-boardNo").val(boardNo)
        $("#boardTitleUpdate").val(title);
        if(notice == 0) {
        	$('#boardUpdate-option-0').attr('selected', 'selected');
        	$('#boardUpdate-option-1').removeAttr('selected');
        } else {
        	$('#boardUpdate-option-0').removeAttr('selected');
        	$('#boardUpdate-option-1').attr('selected', 'selected');
        }
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
