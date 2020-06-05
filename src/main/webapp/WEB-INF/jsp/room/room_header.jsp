<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- vue.js -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<!-- jQuery 및 bootstrap -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
  integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
  integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<title>BTS | ${clazzNow.name}</title>

<!--favicon -->
<link rel="favicon" href="images/favicon.ico">
<link rel="shortcut icon" href="http://localhost:9999/Team-project/images/favicon.ico" type="image/x-icon" />
<link rel="icon" href="http://localhost:9999/Team-project/images/favicon.ico" type="image/x-icon" />


<!-- sweet alert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
<!-- 카카오 로그인 -->
<script src="/Team-project/script/kakao.js"></script>
<!-- 구글 로그인 -->
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
<meta name="google-signin-client_id" content="360175730868-7161sh4v73h0hsufdvgmoa9u3o25oi21.apps.googleusercontent.com">
<script>

//카카오 로그인 관련
        Kakao.init('e42d7bc3930faad4ef83d4fb783cf136');
        console.log(Kakao.isInitialized());
        function kakaoLogout() {
        if (!Kakao.Auth.getAccessToken()) {
          return
        }
        Kakao.Auth.logout(function() {
          window.location.href="../../auth/logout";
        })
      }

        //구글 로그인, 로그아웃 관련
    function signOut() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
          console.log('User signed out.');
          auth2.disconnect();
          window.location.href="../../auth/logout";
        });
      }
    
    function onLoad() {
        gapi.load('auth2', function() {
          gapi.auth2.init();
        });
      }
</script>
<!-- css -->
<link rel="stylesheet" href="/Team-project/css/style.css" />
</head>
<body>
  <nav class="header room_header d-flex">
    <div class="col-3">
      <a href="/Team-project/app/clazz/list" title="BtS 홈페이지로 이동" id="logo"> <img src="../../../images/logo_bts.png"
        alt="로고" width="70" height="70">
      </a> <a href="../lesson/list?room_no=${clazzNow.classNo}""><span style="font-weight: bold; font-size: 1.2em;">${clazzNow.name}</span></a>
    </div>
    <div class="col-6">
      <a href="../lesson/list?room_no=${clazzNow.classNo}"onmouseover="this.style.fontWeight='bold';this.style.color='#66ccff';" onmouseout="this.style.fontWeight='';this.style.color='';"><span class="room_header__menu">수업</span></a> <a
        href="../user/list?room_no=${clazzNow.classNo}"><span class="room_header__menu"onmouseover="this.style.fontWeight='bold';this.style.color='#66ccff';" onmouseout="this.style.fontWeight='';this.style.color='';">사용자</span></a> <a
        href="../grade/list?room_no=${clazzNow.classNo}"onmouseover="this.style.fontWeight='bold';this.style.color='#66ccff';" onmouseout="this.style.fontWeight='';this.style.color='';"><span class="room_header__menu">성적</span></a> <a
        href="../board/list"><span class="room_header__menu"onmouseover="this.style.fontWeight='bold';this.style.color='#66ccff';" onmouseout="this.style.fontWeight='';this.style.color='';">게시판</span></a>
    </div>
    <div class="col-3">
      <c:if test="${nowMember.role == 0}">
        <a href="#" data-toggle="modal" data-target="#classDetailModal" id="class_settings"><i class="fas fa-cog"
          style="font-size: 1.2em;"></i></a>
      </c:if>
      <c:if test="${not empty loginUser}">
        <div class="header__user">
          <c:if test="${not empty loginUser.profilePhoto && loginUser.profilePhoto ne 'undefined'}">
              <span class="header__user__photo"><img class="img-thumbnail" style="border:0;"
                src='${pageContext.servletContext.contextPath}/upload/user/thumbnail.${loginUser.profilePhoto}.jpg'></span>
          </c:if>
          <c:if test="${empty loginUser.profilePhoto  || loginUser.profilePhoto eq 'undefined'}">
            <i class="far fa-user" style="font-size: 1.5em; margin-right: 0.3em;"></i>
          </c:if>
          <div id="headerUserName" data-toggle="modal" data-target="#userDetailModal" style="cursor: pointer;">${loginUser.name}</div>
        </div>
        <c:if test="${loginUser.loginMethod == 2}">
          <a href="#" onclick="signOut();">로그아웃</a>
        </c:if>
        <c:if test="${loginUser.loginMethod == 0}">
          <a href="../../auth/logout">로그아웃</a>
        </c:if>
        <c:if test="${loginUser.loginMethod == 1}">
          <a href="#" class="api-btn" onclick="kakaoLogout()">로그아웃</a>
        </c:if>
      </c:if>
    </div>
  </nav>

  <!-- 수업정보 모달 -->
  <div class="modal fade" id="classDetailModal" tabindex="-1" role="dialog" aria-labelledby="classDetailModalTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="classDetailModalTitle">수업 상세정보</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form class="d-flex flex-column" id="modal-class-update" action='../../clazz/update?from=room' method='post'
            enctype='multipart/form-data'>
            <input name='classNo' type='hidden'>
            <div class="form-group">
              <label>수업명</label><input class="form-control" name='name' type='text' maxlength="30">
            </div>
            <div class="form-group">
              <label>설명</label>
              <textarea class="form-control" rows="5" name='description' style="resize: none"></textarea>
            </div>
            <div class="form-group">
              <label>강의실</label><input class="form-control" name='room' type='text'>
            </div>
            <div class="form-group">
              <label>수업코드</label><input class="form-control form-control-sm" name='classCode' type='text'>
            </div>
            <div class="form-group">
              <label>테마색상</label><input class="form-control" name='color' type='color'>
            </div>
            <div>
              <label>생성일</label><span id="class-createDate" style="font-size: 1.2em; margin-left: 1em;"></span>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" id="class-delete-Btn">수업삭제</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal" id="class-update-closeBtn">닫기</button>
          <button type="button" class="btn btn-primary" id="class-update-updateBtn">저장</button>
        </div>
      </div>
    </div>
  </div>

  <!-- 유저정보 Modal -->
  <div class="modal fade" id="userDetailModal" tabindex="-1" role="dialog" aria-labelledby="userDetailModalTitle"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="userDetailModalTitle">내 상세정보</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div id="modal-user-profile-div">
            <img id="modal-user-img" src=''>
          </div>
          <form class="d-flex flex-column" id="modal-user-update" action='../../user/update' method='post'
            enctype='multipart/form-data'>
            <input name='userNo' type='hidden'>
            <div class="form-group">
              <label>이메일</label><input class="form-control" name='email' type='email' readonly
                style="background-color: white;">
            </div>
            <div class="form-group">
              <label>이름</label><input class="form-control" name='name' type='text' maxlength="30">
            </div>
            <div class="form-group">
              <label>암호</label><input class="form-control" name='password' type='password'
                placeholder="변경하고자하는 비밀번호를 입력하세요.">
            </div>
            <div class="form-group">
              <label>전화</label><input class="form-control" name='tel' type='tel'>
            </div>
            <div class="form-group">
              <label>전공</label><input class="form-control" name='major' type='text'>
            </div>
            <div class="form-group">
              <label>자기소개</label>
              <textarea class="form-control" name='introduce' rows='5' cols='55' style="resize: none"></textarea>
            </div>
            <div class="form-group">
              <label for='user-photo-input'>프로필 사진 업로드</label> <input name='photo' type='file'
                class="btn btn-light btn-sm">
            </div>
            <div class="form-group">
              <label class="mr-3">가입일</label><span id="user-createDate"></span>
            </div>
            <div class="d-flex">
              <button id="modal-user-delete-btn" type="button" class="btn btn-danger btn-sm">계정삭제</button>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" id="user-update-closeBtn">닫기</button>
          <button type="button" class="btn btn-primary" id="user-update-updateBtn">저장</button>
        </div>
      </div>
    </div>
  </div>

  <script>
    // 수업 정보 수정을 위한 스크립트
    $('#class_settings').click(function () {
      let classData = undefined;
      $.getJSON("../../clazz/detail", function(data) {
          classData = data;
          let classUpdateForm = document.getElementById('modal-class-update');
          classUpdateForm.classNo.value = data.classNo;
          classUpdateForm.name.value = data.name;
          if(data.description != undefined){
            classUpdateForm.description.value = data.description;
          }
          if(data.room != undefined) {
            classUpdateForm.room.value = data.room;
          }
          classUpdateForm.classCode.value = data.classCode;
          $('#class-createDate').html(data.createDate);
          classUpdateForm.color.value = data.color;
      });
      
      $('#class-delete-Btn').click(() =>{
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
                          location.href = "../../clazz/delete?no="+classData.classNo;
                      }
            });
        });
    });
    
    $('#class-update-updateBtn').click(()=>{
      $('#modal-class-update').submit();
    });

    // 유저 정보 수정을 위한 스크립트
    $('#headerUserName').click(function () {
    let userJson = undefined;
    $.getJSON("../../user/detail?userNo=${loginUser.userNo}", function(data) {
        userJson = data;
        if(userJson.profilePhoto != undefined && userJson.profilePhoto != 'undefined' && userJson.loginMethod == 0) {
            document.getElementById('modal-user-img').setAttribute('src', '${pageContext.servletContext.contextPath}/upload/user/thumbnail.'+userJson.profilePhoto+'.jpg');
              } else if(userJson.profilePhoto != undefined && userJson.profilePhoto != 'undefined' && userJson.loginMethod > 0) {
                  document.getElementById('modal-user-img').setAttribute('src', userJson.profilePhoto);
              } else {
                  $('#modal-user-profile-div').html('<i class="far fa-user"></i>');
              }
          let userUpdateForm = document.getElementById('modal-user-update');
          userUpdateForm.userNo.value = userJson.userNo;
          userUpdateForm.email.value = userJson.email;
          userUpdateForm.name.value = userJson.name
          if(userJson.tel != undefined) {
            userUpdateForm.tel.value = userJson.tel;
          }
          if(userJson.major != undefined) {
            userUpdateForm.major.value = userJson.major;
          }
          if(userJson.introduce != undefined) {
            userUpdateForm.introduce.innerHTML = userJson.introduce;
          }
          $('#user-createDate').html(userJson.createDate);
    });
    
      $('#modal-user-delete-btn').click(() =>{
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
                      location.href = "../../user/delete?no="+userJson.userNo;
                  }
            })
          
        });
    });
    
    $('#user-update-updateBtn').click(()=>{
      $('#modal-user-update').submit();
    });
</script>