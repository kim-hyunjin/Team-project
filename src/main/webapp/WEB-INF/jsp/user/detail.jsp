<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../css/style.css" />
<script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
</head>
<body>
	<h1>회원 상세정보</h1>
	<c:if test="${not empty user}">
		<img src='${pageContext.servletContext.contextPath}/upload/user/thumbnail.${user.profilePhoto}.jpg'><br>
		<form action='update' method='post' enctype='multipart/form-data'>
		        번호: <input name='userNo' type='text' readonly value='${user.userNo}'><br>
		        이메일: <input name='email' type='email' value='${user.email}'><br>
		        이름: <input name='name' type='text' value='${user.name}'><br>
		        암호: <input name='password' type='password'><br>
		        전화: <input name='tel' type='tel' value='${user.tel}'><br>
		        전공: <input name='major' type='text' value='${user.major}'><br>
		        자기소개<br><textarea name='introduce' rows='5' cols='60'>${user.introduce}</textarea><br>
		        사진: <input name='photo' type='file'><br>
		        로그인 방식: ${loginMethod}<br>
		        회원가입일 : ${user.createDate}
		        <p><button>변경</button>
            <input type="button" value="삭제하기" onclick="button_event();">
</form>
	</c:if>
	<c:if test="${empty user}">
	   <p>해당 회원이 없습니다.</p>
	</c:if>

<script type="text/javascript">
function button_event(){
if (confirm("정말 삭제하시겠습니까??") == true){    //확인
    location.href = "delete?no="+${user.userNo};
}else{   //취소
    return;
}
}
</script>
</body>
</html>
