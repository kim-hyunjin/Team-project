
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../../room/room_header.jsp" />

<div class="user_content">
  <div class="teacher">
    <div class="teacher__header">
      <div style="font-size: x-large; font-weight: bold;">선생</div>
      <span onclick="memberAddModalActive(0)" style="cursor: pointer;" onclick="popup(0)"> <i
        class="fas fa-user-plus"></i></span>
    </div>
    <hr>
    <ul class="teacher_list user_list">
      <c:forEach items="${teachers}" var="teacher">
        <li class="user_card" onclick="showUserDetail(${teacher.user.userNo},${teacher.memberNo})"><c:if
            test="${not empty teacher.user.profilePhoto}">
            <span class="user_list__profile"><img
              src="${pageContext.servletContext.contextPath}/upload/user/thumbnail.${teacher.user.profilePhoto}.jpg" /></span>
          </c:if> <c:if test="${empty teacher.user.profilePhoto}">
            <span class="user_list__profile"><i class="far fa-user"></i></span>
          </c:if> <span data-toggle="modal" data-target="#MemberDetailModal" style="cursor: pointer;">${teacher.user.name}</span>
        </li>
      </c:forEach>
    </ul>
  </div>

  <div class="student" style="margin-top: 10em;">
    <div class="student__header">
      <div style="font-size: x-large; font-weight: bold;">학생</div>
      <span onclick="memberAddModalActive(1)" style="cursor: pointer;"><i class="fas fa-user-plus"></i></span>
    </div>
    <hr>
    <ul class="student_list user_list">
      <c:forEach items="${students}" var="student">
        <li class="user_card" onclick="showUserDetail(${student.user.userNo}, ${student.memberNo})"><c:if
            test="${not empty student.user.profilePhoto}">
            <span class="user_list__profile"><img
              src="${pageContext.servletContext.contextPath}/upload/user/thumbnail.${student.user.profilePhoto}.jpg" /></span>
          </c:if> <c:if test="${empty student.user.profilePhoto}">
            <span class="user_list__profile"><i class="far fa-user"></i></span>
          </c:if> <span data-toggle="modal" data-target="#MemberDetailModal" style="cursor: pointer;">${student.user.name}</span>
        </li>
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
            <label class="col-3 text-primary font-weight-bold">이메일</label><input class="form-control" name='email' type='text' readonly>
          </div>
          <div class="d-flex mt-2">
            <label class="col-3 text-primary font-weight-bold">이름</label><input class="form-control" name='name' type='text' readonly>
          </div>
          <div class="d-flex mt-2">
            <label class="col-3 text-primary font-weight-bold">전화번호</label><input class="form-control" name='tel' type='text' readonly>
          </div>
          <div class="d-flex mt-2">
            <label class="col-3 text-primary font-weight-bold">전공</label><input class="form-control" name='major' type='text' readonly>
          </div>
          <div class="d-flex flex-column mt-2">
            <label class="col-3 text-primary font-weight-bold">소개</label>
            <textarea class="form-control" name='introduce' type='text' readonly style="resize: none; background-color:white;"></textarea>
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
        <h5 class="modal-title" id="MemberAddModalLabel">초대 코드</h5>
        <button id="memberAddModalClose" type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id='modalMemberAddForm' action='add' method='post' class="inputGroup">
          <input name="class_no" type="hidden" value="${clazzNowNo}"> <input name="role" type="hidden">
          <input class="form-control" type="email" name="email" id="emailInput" placeholder="초대 대상의 이메일을 입력하세요." />
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="memberAddBtn">초대 보내기</button>
      </div>
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
		                confirmButtonColor: '#3085d6',
		                cancelButtonColor: '#d33',
		                confirmButtonText: 'Yes, delete it!'
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
		
		
		
let btn = document.getElementById("memberAddBtn");
// 버튼 클릭시 유효성 검사 시작(type="button"인 경우 버튼을 클릭해도 submit을 수행하지 않는다.)
btn.addEventListener("click", function(event){
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
            addMember();
            return;
        }
    }
    
    // 사용자 추가를 비동기로 처리 후 팝업창 닫기
    async function addMember() {
        //사용자가 폼에 입력한 데이터를 json으로 만든다.
          let member = {
                classNo: form.class_no.value,
                role: form.role.value,
                email: form.email.value
            };
        
          try {
              //fetch()를 통해 room/user/add에 위에서 만든 json 데이터를 가지고 POST요청한다.
            let response = await fetch('add', {
                  method: 'POST',
                  headers: {
                    'Content-Type': 'application/json;charset=utf-8'
                  },
                  body: JSON.stringify(member)
            });
              // 응답이 200번대로 오면 팝업창을 띄운 부모창을 새로고침하고 팝업창은 닫는다.
            if (response.ok) {
                location.reload();
                $('#memberAddModalClose').trigger('click');
            }               
              // 사용자 추가에 실패한 경우 알림창을 띄우고 팝업창은 닫는다.
          }catch(error) {
              alert("사용자 추가에 실패했습니다.");
              $('#memberAddModalClose').trigger('click');
          }
  }
    
}); 

         
</script>
</body>
</html>

