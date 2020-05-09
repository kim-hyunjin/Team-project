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
        <p> 
                번호: ${user.userNo}<br>
                이메일: ${user.email}<br>
                이름:${user.name}<br>
                전화:${user.tel}<br>
                전공:${user.major}<br>
                자기소개${user.introduce}<br>
                회원가입일 : ${user.createDate}
        </p>
         <input type="button" value="삭제하기" onclick="button_event();">
	</c:if>
    <c:if test="${empty user}">
       <p>해당 회원이 없습니다.</p>
    </c:if>
    
    <script type="text/javascript">
function button_event(){
if (confirm("정말 삭제하시겠습니까??") == true){    //확인
    location.href = 'delete?member_no=${member_no}&room_no=${room_no}';
}else{   //취소
    return;
}
}
</script>
</body>
</html>
