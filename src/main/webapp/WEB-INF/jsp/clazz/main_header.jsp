<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

		<!-- favicon -->
		<link rel="favicon" href="images/favicon.ico">
		<link rel="shortcut icon" href="http://localhost:9999/Team-project/images/favicon.ico" type="image/x-icon" />
		<link rel="icon" href="http://localhost:9999/Team-project/images/favicon.ico" type="image/x-icon" />
		
		<script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
		<script src="/Team-project/script/kakao.js"></script>
		
<script>
        Kakao.init('e42d7bc3930faad4ef83d4fb783cf136');
        console.log(Kakao.isInitialized());
        function kakaoLogout() {
        if (!Kakao.Auth.getAccessToken()) {
          return
        }
        Kakao.Auth.logout(function() {
        	window.location.href="../auth/logout";
        })
      }
    </script>
<!-- 라이브러리 추가 -->
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

<!-- 구글 메타 태그 추가 -->
<meta name="google-signin-client_id" content="360175730868-7161sh4v73h0hsufdvgmoa9u3o25oi21.apps.googleusercontent.com">
<script>
    function signOut() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
          console.log('User signed out.');
          auth2.disconnect();
          window.location.href="../auth/logout";
        });
      }
    
    function onLoad() {
        gapi.load('auth2', function() {
          gapi.auth2.init();
        });
      }
      </script>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" />
<!-- 캘린더 -->
<link href='${pageContext.servletContext.contextPath}/script/fullcalendar/packages/core/main.css' rel='stylesheet' />
<link href='${pageContext.servletContext.contextPath}/script/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />

<script>
// 수업 참여를 위한 스크립트
$(function () {
    $("#joinBtn").click(function () {
    let xhr = new XMLHttpRequest();
    const code = $("#modal-code").val();
    console.log(code);
    xhr.open("GET", "join?code="+code, true);
    xhr.onreadystatechange = () => {
      if(xhr.readyState == 4) {
        if(xhr.status == 200) {
          location.reload(true);
          $("#join-modal-close").trigger("click");
        }else if(xhr.status == 400) {
          alert("중복된 수업입니다.");
          $("#modal-code").focus();
        }else {
          alert("유효하지 않는 수업코드입니다.");
          $("#modal-code").focus();
        }
      }
    }
    xhr.send();
  });
});


// 수업 생성 버튼 클릭시 post요청
    $("#createBtn").click(function() {
        $('#class_createForm').submit();
    })

    // 유저 정보 수정을 위한 스크립트
  var userJson;
    $('#headerUserName').click(function () {
      let xhr = new XMLHttpRequest();
      console.log(${loginUser.userNo});
      xhr.open("GET", "../user/detail?userNo=${loginUser.userNo}", true);
      xhr.onreadystatechange = () => {
            if(xhr.readyState == 4) {
              if(xhr.status == 200) {
                userJson = JSON.parse(xhr.responseText);
                console.log(userJson);
                if(userJson.profilePhoto != undefined) {
              document.getElementById('modal-user-img').setAttribute('src', '${pageContext.servletContext.contextPath}/upload/user/thumbnail.'+userJson.profilePhoto+'.jpg');
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
            
            
          }
        } 
     }
      xhr.send();
    });
    
    //유저 삭제 버튼 클릭시
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
        location.href = "../user/delete?no="+userJson.userNo;
          }
    })
  });
    
    // 유저정보 수정 버튼 클릭시
    $('#user-update-updateBtn').click(()=>{
	   $('#modal-user-update').submit();
    });
    </script>
</head>
<body>
  <nav class="header main_header">
    <div class="main_header__column">

      <a href="/Team-project/app/clazz/list" title="BtS 홈페이지로 이동" id="logo"> <img src="../../images/logo_bts.png"
        alt="로고" width="70" height="70">
      </a>

      <!--  
      <a class="navbar-brand" href="/Team-project/app/clazz/list"><i class="fas fa-home"></i></a>
      -->
      <span style="font-weight: bold; font-size: 1.2em;">BTS</span>


    </div>
    <div class="main_header__column">
      <c:if test="${loginUser.alterKey == 'Y' }">
        <span><a href="../calendar/main">캘린더</a></span>
        <span data-toggle="modal" data-target="#classJoin" style="cursor: pointer;">수업 참여</span>
        <span data-toggle="modal" data-target="#makeClass" style="cursor: pointer;">수업 만들기</span>
      </c:if>
      <c:if test="${not empty loginUser}">
        <div class="header__user">
          <c:if test="${not empty loginUser.profilePhoto}">
            <c:if test="${loginUser.loginMethod > 0}">
              <span class="header__user__photo"><img src='${loginUser.profilePhoto}'></span>
            </c:if>
            <c:if test="${loginUser.loginMethod == 0}">
              <span class="header__user__photo"><img
                src='${pageContext.servletContext.contextPath}/upload/user/thumbnail.${loginUser.profilePhoto}.jpg'></span>
            </c:if>
          </c:if>
          <c:if test="${empty loginUser.profilePhoto}">
            <i class="far fa-user" style="font-size: 1.5em; margin-right: 0.3em;"></i>
          </c:if>
          <div id="headerUserName" data-toggle="modal" data-target="#userDetailModal" style="cursor: pointer;">${loginUser.name}</div>
        </div>
        <c:if test="${loginUser.loginMethod == 2}">
          <a href="#" onclick="signOut();">로그아웃</a>
        </c:if>
        <c:if test="${loginUser.loginMethod == 0}">
          <a href="../auth/logout">로그아웃</a>
        </c:if>
        <c:if test="${loginUser.loginMethod == 1}">
          <button class="api-btn" onclick="kakaoLogout()">로그아웃</button>
        </c:if>
      </c:if>
    </div>
  </nav>

  <!-- 수업 참여하기 Modal -->
  <div class="modal fade" id="classJoin" tabindex="-1" role="dialog" aria-labelledby="classJoinLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="classJoinLabel">수업 참여</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <input class="form-control" id="modal-code" name="code" type="text" placeholder="수업 코드를 입력하세요."
            style="width: 100%;">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" id="join-modal-close">닫기</button>
          <button type="button" class="btn btn-primary" id="joinBtn">참여</button>
        </div>
      </div>
    </div>
  </div>

  <!-- 수업 만들기 Modal -->
  <div class="modal fade" id="makeClass" tabindex="-1" role="dialog" aria-labelledby="makeClassLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="makeClassLabel">수업 만들기</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id="class_createForm" action='add' method='post'>
            <input class="form-control" id="modal-name" name='name' type='text' placeholder="수업명" maxlength="30">
            <input class="form-control" id="modal-description" name='description' type='text' placeholder="설명">
            <input class="form-control" id="modal-room" name='room' type='text' placeholder="강의실"> <input
              class="form-control" name="color" type="color">
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" id="create-modal-close">닫기</button>
          <button type="button" class="btn btn-primary" id="createBtn">만들기</button>
        </div>
      </div>
    </div>
  </div>

  <!-- 유저 상세정보 Modal -->
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
          <form class="d-flex flex-column" id="modal-user-update" action='../user/update' method='post'
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