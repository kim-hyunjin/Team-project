<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../../css/style.css" />
<link rel="favicon" href="images/favicon.ico">
<link rel="shortcut icon" href="http://localhost:9999/Team-project/images/favicon.ico" type="image/x-icon" />
<link rel="icon" href="http://localhost:9999/Team-project/images/favicon.ico" type="image/x-icon" />

<!-- sweet alert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
<!-- 부트스트랩 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<!-- 카카오 로그인 -->
<script src="/Team-project/script/kakao.js"></script>
    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('e42d7bc3930faad4ef83d4fb783cf136');
        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>
<!--구글 로그인 -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name = "google-signin-client_id"
content = "360175730868-7161sh4v73h0hsufdvgmoa9u3o25oi21.apps.googleusercontent.com">    

<title>BTS-로그인</title>
<style>
html, body, .container {
    height: 100%;
}
</style>

</head>
<body>
    <div class="container d-flex justify-content-center align-items-center">
        <div class="d-flex flex-column">
            <div class="social_login">
                <div class="g-signin2" data-onsuccess="onSignIn" data-width="220" data-height="45" data-longtitle="true"></div>
                <button id="kakao_login_btn" style="margin-top:1em; border:none; background-color:white;"></button>
            </div>
            <div class="email_login d-flex flex-column align-items-center w-100">
                <form id="loginForm" name="loginForm" method="post" action="login">
                    <input class="email_login__input form-control" type="text" name="email"
                        placeholder="  email" onkeyup="enterkey();"> <input
                        class="email_login__input form-control" type="password" name="password"
                        placeholder="  password" onkeyup="enterkey();">
                    </td>
                    <div style="margin-top: 1em;">
                        <input type="checkbox" name="idsave" value="saveOk">아이디 저장
                    </div>
                    <input class="email_login__input login_btn" type="button"
                        value="로그인" onclick="sendit()">
                </form>
            </div>
            <div class="join mt-3 d-flex flex-column align-items-center">
              <div>
                <span style="margin-right: 1em;">계정이 없나요?</span>
                <a href="../user/form">회원가입</a>
              </div>
            <div data-toggle="modal" data-target="#findPasswordModal" class="mt-3 text-muted" style="cursor:pointer;">비밀번호를 잊으셨나요?</div>
            </div>
        </div>
    </div>
<div class="modal fade" id="findPasswordModal" tabindex="-1" role="dialog" aria-labelledby="findPasswordLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="findPasswordLabel">비밀번호 찾기</h5>
        <button id="memberAddModalClose" type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form id='findPasswordForm' action='findPassword' method='post' class="inputGroup">
      <div class="modal-body">
          <input class="form-control" type="email" name="email" id="emailInput" placeholder="이메일을 입력하세요." />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="findPasswordBtn">임시비밀번호 발급</button>
      </div>
      </form>
    </div>
  </div>
</div>

<script>
var agent = navigator.userAgent.toLowerCase();
if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
    Swal.fire({
        icon : 'warning',
        title : '죄송합니다. Internet Explorer에서는 원활한 서비스를 지원하지 않습니다. 다른 브라우저를 사용해주세요.'
    });
}

//로그인 실패시 에러 처리
const error = '${loginError}';
if(error != '') {
    if(error == '1') {
	      Swal.fire({
            icon : 'error',
            title : '이메일 인증을 완료해주세요!'
        });
    } else if(error == '2') {
	      Swal.fire({
            icon : 'error',
            title : '죄송합니다. 이메일 또는 비밀번호가 유효하지 않습니다.'
        });
    }
}

</script>

<script>
//비밀번호 찾기
$('#findPasswordBtn').click(function() {
   $.ajax({
       url: "findPassword",
      method:"GET",
      data:{
	      email:$('#emailInput').val()
      },
      beforeSend:function() {
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
      complete:function() {
	      $("#div_ajax_load_image").hide();
      },
      statusCode:{
	      200:function() {
  		    Swal.fire({
  		        icon : 'success',
  		        title : '이메일로 임시비밀번호를 발급했습니다.'
  		    });
	      },
	      400:function() {
		        Swal.fire({
	              icon : 'error',
	              title : '유효하지 않는 이메일입니다.'
	          });
	      }
      }
   }); 
});
</script>
<script src="/Team-project/script/loginForm.js"></script>
<script>
//카카오 로그인 script
Kakao.Auth.createLoginButton({
  container: '#kakao_login_btn',
  success: function(authObj) {
      Kakao.API.request({
            url: '/v2/user/me',
            success: function(user) {
                console.log(user);
                console.log(user.properties.profile_image);
               window.location.href="social?email="+user.kakao_account.email
                        +"&id="+user.id
                        +"&nickname="+encodeURI(user.properties.nickname, "UTF-8")
                        +"&loginMethod=1";
            },
            fail: function(error) {
                console.log(error);
            }
        });
  },
  fail: function(error) {
    console.log(error);
  },
});
</script>
<script>
//구글로그인 script
function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
      
    console.log('ID: ' + profile.getId());
    console.log('Name: ' + profile.getName());
    console.log('Email: ' + profile.getEmail());
    window.location.href="social?email="+profile.getEmail()
    +"&id="+profile.getId()
    +"&nickname="+encodeURI(profile.getName(), "UTF-8")
    +"&loginMethod=2";
}
</script>

</body>
</html>