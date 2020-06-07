
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../room/room_header.jsp" />

<div class="user_content">
  <div class="teacher">
    <div class="teacher__header">
      <div style="font-size: x-large; font-weight: bold;">Teacher</div>
      <c:if test="${nowMember.role == 0}">
      <span onclick="memberAddModalActive(0)" style="cursor: pointer;" onclick="popup(0)"> 
      <i class="fas fa-user-plus"></i></span>
      </c:if>
    </div>
    <hr>
    <ul class="teacher_list user_list">
      <c:forEach items="${teachers}" var="teacher">
        <li class="user_card" onclick="showUserDetail(${teacher.user.userNo},${teacher.memberNo})">
        <c:if test="${not empty teacher.user.profilePhoto && teacher.user.profilePhoto ne 'undefined'}">
              <span class="user_list__profile">
                <img class="img-thumbnail rounded" style="border: 0;"
                src="${pageContext.servletContext.contextPath}/upload/user/thumbnail.${teacher.user.profilePhoto}.jpg" />
              </span>
          </c:if>
        <c:if test="${empty teacher.user.profilePhoto || teacher.user.profilePhoto eq 'undefined'}">
          <span class="user_list__profile text-center"><i class="far fa-user"></i></span>
        </c:if>
        <span class="user_list__profile___add text-truncate" data-toggle="modal" data-target="#MemberDetailModal"
          style="cursor: pointer;">${teacher.user.name}</span>
        </li>
      </c:forEach>
    </ul>
  </div>

  <div class="student" style="margin-top: 10em;">
    <div class="student__header">
      <div style="font-size: x-large; font-weight: bold;">Student</div>
      <c:if test="${nowMember.role == 0}">
      <span onclick="memberAddModalActive(1)" style="cursor: pointer;"><i class="fas fa-user-plus"></i></span>
      </c:if>
    </div>
    <hr>
    <c:if test="${empty students}">
    <div class="w-100 bg-muted text-center">
      <img src="${pageContext.servletContext.contextPath}/images/students.jpg" style="width:10em;">
      <div>학생을 초대하거나 다음의 수업코드를 제공하세요. <b>${clazzNow.classCode}</b></div>
    </div>
    </c:if>
    <ul class="student_list user_list">
      <c:forEach items="${students}" var="student">
        <li class="user_card" onclick="showUserDetail(${student.user.userNo}, ${student.memberNo})">
        <c:if test="${not empty student.user.profilePhoto && student.user.profilePhoto ne 'undefined'}">
            <span class="user_list__profile">
              <img class="img-thumbnail rounded" style="border: 0;"
                src="${pageContext.servletContext.contextPath}/upload/user/thumbnail.${student.user.profilePhoto}.jpg" />
            </span>
        </c:if> 
        <c:if test="${empty student.user.profilePhoto || student.user.profilePhoto eq 'undefined'}">
           <span class="user_list__profile text-center"><i class="far fa-user"></i></span>
        </c:if> <span class="user_list__profile___add text-truncate" data-toggle="modal" data-target="#MemberDetailModal"
          style="cursor: pointer;">${student.user.name}</span></li>
      </c:forEach>
    </ul>
  </div>
</div>


<!-- Modal -->
<!-- 사용자 detail -->
<div class="modal fade" id="MemberDetailModal" tabindex="-1" role="dialog" aria-labelledby="MemberDetailModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="MemberDetailModalLabel">멤버 정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="modal-memberDetail" class="form-group d-flex flex-column">
          <input name='memberNo' type='hidden'>
          <div class="d-flex">
            <label class="col-3">이메일</label><input class="form-control" name='email' type='text' readonly>
          </div>
          <div class="d-flex mt-2">
            <label class="col-3">이름</label><input class="form-control" name='name' type='text' readonly>
          </div>
          <div class="d-flex mt-2">
            <label class="col-3">전화번호</label><input class="form-control" name='tel' type='text' readonly>
          </div>
          <div class="d-flex mt-2">
            <label class="col-3">전공</label><input class="form-control" name='major' type='text' readonly>
          </div>
          <div class="d-flex flex-column mt-2">
            <label class="col-3">소개</label>
            <textarea class="form-control" name='introduce' type='text' readonly
              style="resize: none; background-color: white;"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <c:if test="${nowMember.role == 0}">
          <button type="button" class="btn btn-danger" id="button_event" onclick="button_event()">멤버 삭제</button>

        </c:if>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<!-- 사용자 Add -->
<div class="modal fade" id="MemberAddModal" tabindex="-1" role="dialog" aria-labelledby="MemberAddModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="MemberAddModalLabel">초대하기</h5>
        <button id="memberAddModalClose" type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form id='modalMemberAddForm' action='invite' method='post' class="inputGroup">
      <div class="modal-body">
          <input name="class_no" type="hidden" value="${clazzNowNo}"> <input name="role" type="hidden">
          <input class="form-control" type="email" name="email" id="emailInput" placeholder="초대 대상의 이메일을 입력하세요." />
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="memberAddBtn">초대 보내기</button>
      </div>
      </form>
    </div>
  </div>
</div>

<script>
		//유저 상세보기 모달 스크립트
		function showUserDetail(userNo, memberNo) {
		       // 비동기로 detail을 get 요청하여 수업 상세 정보를 가져와 모달에 넣어준다.
	        let xhr = new XMLHttpRequest();
	        xhr.open("GET", "detail?user_no="+userNo+"&member_no="+memberNo , true);
	        xhr.onreadystatechange = () => {
	          if(xhr.readyState == 4) {
	            if(xhr.status == 200) {
	              const form = document.getElementById('modal-memberDetail');
	              const jsonMap = JSON.parse(xhr.responseText);
	              const userJson = JSON.parse(jsonMap.user);
	              form.memberNo.value = jsonMap.memberNo;
	              form.email.value= userJson.email;
	              form.name.value= userJson.name;
	              if(userJson.tel != undefined) {
  	              form.tel.value= userJson.tel;
	              }
	              if(userJson.major != undefined) {
	 	              form.major.value= userJson.major;
	              }
	              if(userJson.introduce != undefined) {
  	              form.introduce.value= userJson.introduce;
	              }
	              form.createDate.value= userJson.createDate;
	            }else {
	                
	            }
	          }
	        }
	        xhr.send();
		}
		// 맴버 삭제시 정말 삭제할지 묻는 코드
		  function button_event() {
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
		                    let roomNo = ${clazzNowNo};
		                    let delMemberNo = document.getElementById('modal-memberDetail').memberNo.value;
		                       location.href='delete?member_no='+delMemberNo+"&room_no="+roomNo;
		                }
		      });

		   }
		</script>
<script>
		function memberAddModalActive(role) {
			$('#MemberAddModal').modal("show");
			document.getElementById('modalMemberAddForm').role.value = role;
		}
		
$('#modalMemberAddForm').submit(function(event){
    event.preventDefault();
    let form = document.getElementById("modalMemberAddForm");
    const input = document.getElementById("emailInput");
    const email = form.email.value;
    // 입력값이 없으면 경고창 띄움
    if(email.length == 0) {
        input.focus();
        return;
    } else {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "check?email="+email, false);
        xhr.send();
        // get요쳥으로 이메일 체크 
        if(xhr.status == 404) { // 입력한 이메일을 가진 유저가 없으면 404
            input.value = "";
            input.setAttribute("placeholder", "유효하지 않는 이메일입니다!");
            input.focus();
            return;
        }
        if(xhr.status == 200) { // 이메일이 유효하고, 클래스룸의 소속이면 200
            input.value = "";
            input.setAttribute("placeholder", "이미 클래스의 멤버입니다!");
            input.focus();
            return;
        }
        if(xhr.status == 204) { // 이메일은 유효하나 클래스룸의 소속이 아니면 204
            inviteMember();
            return;
        }
    }
    
    // 사용자 추가를 비동기로 처리 후 팝업창 닫기
   async function inviteMember() {
    	$.ajax({
    	  url:'invite',
    	  type:"POST",
    	  contentType: "application/json",
    	  data: JSON.stringify({
    		  classNo: form.class_no.value,
              role: form.role.value,
              email: form.email.value,
              invitorNo: '${nowMember.userNo}'
    	  }),
    	  beforeSend: function(){
              var width = 0;
              var height = 0;
              var left = 0;
              var top = 0;
              width = 50;
              height = 50;
              top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
              left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();
              if($("#div_ajax_load_image").length != 0) {
                     $("#div_ajax_load_image").css({
                            "top": top+"px",
                            "left": left+"px"
                     });
                     $("#div_ajax_load_image").show();
              }
              else {
                     $('body').append('<div id="div_ajax_load_image" style="position:absolute; top:' 
                     + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height 
                     + 'px; z-index:9999; background:#f0f0f0; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="/Team-project/images/loading.gif" style="width:50px; height:50px;"></div>');
              }

    	  },
    	  success:function(){
    		  location.reload();
              $('#memberAddModalClose').trigger('click');
              Swal.fire({
                  icon : 'success',
                  title : '초대 이메일을 보냈습니다!',
              });
    	  },
    	  fail:function(){
    		  $('#memberAddModalClose').trigger('click');
              Swal.fire({
                  icon : 'error',
                  title : '사용자 추가에 실패했습니다.',
              });
    	  },
    	  complete: function () {
              $("#div_ajax_load_image").hide();
        }

    	
    	});//ajax끝
    } //inviteMember()끝
}); //submit()끝

         
</script>
</body>
</html>

