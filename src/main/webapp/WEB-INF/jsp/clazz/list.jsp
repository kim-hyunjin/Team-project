<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="main_header.jsp" />


<div class="main_list">
  <c:if test="${empty clazzList}">
  <div class="w-100 text-center">
    <img src="${pageContext.servletContext.contextPath}/images/grade.png" style="width:10em; margin-top:5em;">
  </div>
  </c:if>
  <c:if test="${not empty clazzList && loginUser.alterKey == 'Y'}">
    <c:forEach items="${clazzList}" var="clazz">
      <div class="main_card">
        <div class="main_name" style="background-color:${clazz.color eq null ? 'darkslategrey':clazz.color};">
          <!-- style="background-color:${clazz.color != null ? clazz.color : darkslategrey}" -->
          <div class="main_card__header" style="position: relative">
            <a class="main_name_title text-truncate" href="../room/lesson/list?room_no=${clazz.classNo}"> ${clazz.name}</a> <span
              class="clazz-modal" style="cursor: pointer;"><i class="fas fa-ellipsis-v"></i></span>
            <!-- 수업 수정 삭제를 위한 div -->
            <div class="clazz-detail-box" id="clazz-detail-box ${clazz.classNo}">
              <div onMouseover="this.style.backgroundColor='gray';" onMouseout="this.style.backgroundColor='white';"
                class="class-update-btn" data-toggle="modal" data-target="#updateClass">수정</div>
              <div onMouseover="this.style.backgroundColor='gray';" onMouseout="this.style.backgroundColor='white';"
                onclick="button_event(this, ${clazz.classNo})">삭제</div>
            </div>
          </div> 
          <span>${clazz.room}</span>
        </div>
        <div style="height:10em; overflow:hidden; text-overflow:ellipsis;" class="description text-monospace text-muted">${clazz.description}</div>
      </div>
    </c:forEach>
  </c:if>
</div>

<!-- 수업 정보 수정 Modal -->
<div class="modal fade" id="updateClass" tabindex="-1" role="dialog" aria-labelledby="updateClassLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="updateClassLabel">수업 정보 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="updateForm" action='update' method='post'>
          <input class="form-control" name='classNo' type='hidden'> 
          <input class="form-control" name='from' type='hidden' value='main'>
          <input class="form-control" name='name' type='text' placeholder="수업명" maxlength="30">
          <textarea class="form-control mt-2" style="height:10em;" name='description' placeholder="설명"></textarea>
          <input class="form-control" name='room' type='text' placeholder="강의실" maxlength="30">
          <input class="form-control" name='classCode' type='text' placeholder="수업코드">
          <input class="form-control" name='color' type='color'>
          <input type="hidden" name="userNo" value="${loginUser.userNo}">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="create-modal-close">닫기</button>
        <button type="button" class="btn btn-primary" id="modal-updateBtn">수정</button>
      </div>
    </div>
  </div>
</div>

<!-- 안내 Modal -->
<div class="modal fade" id="intro" tabindex="-1" role="dialog" aria-labelledby="introLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="introLabel">반갑습니다!</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body d-flex flex-column align-items-center" style="height:23em;">
        <img src="${pageContext.servletContext.contextPath}/images/welcome.png" style="width:15em;">
        <P><b>BTS</b>에서는 온라인을 통해 손쉽게 수업을 관리하고 간편하게 과제와 성적을 관리할 수 있습니다.<br>
        지구 반대편에 있어도 <b>BTS</b>에서 함께 공부하는 즐거움을 느낄 수 있답니다.</p>
        <h5><b>지금 바로 수업을 만들거나 참여해보세요!</b></h5>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="create-modal-close">닫기</button>
        <button type="button" class="btn btn-primary" id="firstClazzCreateBtn" data-toggle="modal" data-target="#makeClass">만들기</button>
        <button type="button" class="btn btn-success" id="firstClazzJoinBtn" data-toggle="modal" data-target="#classJoin">참여하기</button>
      </div>
    </div>
  </div>
</div>
<script>
let clazzList = '${clazzList}'
if(clazzList == '[]') {
    $('#intro').modal('show');
}
$('#firstClazzCreateBtn').click(function() {
    $('#intro').modal('hide');
    $('#makeClass').modal('show');
});
$('#firstClazzJoinBtn').click(function() {
    $('#intro').modal('hide');
    $('#classJoin').modal('show');
});
</script>
<script>
//수업 수정을 위한 스크립트
let modalStatus = 0;
$(document).on('click', '.clazz-modal', function(event) {
  var parentDiv = event.currentTarget.parentNode;
  var div = parentDiv.children[2];
  if(modalStatus == 0) {
    div.setAttribute("style", "display:block");
       modalStatus = 1;
  } else {
    div.setAttribute("style", "display:none");
          modalStatus = 0;
  }
});
    
    $(document).on('click', '.class-update-btn', function (event) {
    	var parent = event.currentTarget.parentNode;
    	console.log(parent);
    	parent.setAttribute("style", "display:none;");
    	modalStatus = 0;
    	
    	// update시 필요한 classNo를 가져온다.
    	let classNo = parent.getAttribute('id').replace('clazz-detail-box ', '');
    	console.log(classNo);
    	let form = document.getElementById("updateForm");
    	form.classNo.value = classNo;
    	
    	// 비동기로 detail을 get 요청하여 수업 상세 정보를 가져와 모달에 넣어준다.
    	let xhr = new XMLHttpRequest();
        xhr.open("GET", "detail?classNo="+classNo, true);
        xhr.onreadystatechange = () => {
          if(xhr.readyState == 4) {
            if(xhr.status == 200) {
              const clazzJson = JSON.parse(xhr.responseText);
              console.log(clazzJson);
              form.name.value= clazzJson.name;
              if(clazzJson.description != undefined){
        	      form.description.value= clazzJson.description;
              }
              if(clazzJson.room != undefined){
                form.room.value= clazzJson.room;
              }
              form.classCode.value= clazzJson.classCode;
              if(clazzJson.color == undefined) {
        	      form.color.value="#2F4F4F";
              }else{      	  
                form.color.value=clazzJson.color;
              }
            }
          }
        }
        xhr.send();
    });
    
    $('#modal-updateBtn').click(function() {
    	$('#updateForm').submit();
    });

    $(document).on('mouseleave', '.main_card', function (e) {
    	$(e.target).find('.clazz-detail-box').css('display','none');
    });
    
    $(document).on('mouseenter', '.main_card', function (e) {
        modalStatus = 0;
    });
    

 // 수업 삭제시 정말 삭제할지 묻는 코드
    function button_event(btn, no){
	   var parent = btn.parentNode;
	      console.log(parent);
	      parent.setAttribute("style", "display:none;");
	      modalStatus = 0;
	      
    	Swal.fire({
    	          title: '정말 삭제하시겠습니까?',
    	          text: "삭제하면 되돌릴 수 없습니다.",
    	          icon: 'warning',
    	          showCancelButton: true,
    	          confirmButtonColor: '#d33',
    	          cancelButtonColor: '#A4A4A4',
    	          cancelButtonText: '취소',
    	          confirmButtonText: '삭제'
    	        }).then((result) => {
    	          if (result.value) {
    	              location.href='delete?no='+no;
    	          }
    	    })
         
    }
</script>



</body>
</html>