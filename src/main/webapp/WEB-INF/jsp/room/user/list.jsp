<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../room/room_header.jsp"/>

		<div class="user_content">
		<div class="teacher">
			<div class="teacher__header">
				<div style="font-size: x-large; font-weight: bold;">선생</div>
				<span onclick="popup(0)" style="cursor: pointer;"><i class="fas fa-user-plus"></i></span>
			</div>
			<hr>
			<ul class="teacher_list user_list">
				<c:forEach items="${teachers}" var="teacher">
					<li class="user_card">
						<c:if test="${not empty teacher.user.profilePhoto}">
							<span class="user_list__profile"><img src="${pageContext.servletContext.contextPath}/upload/user/thumbnail.${teacher.user.profilePhoto}.jpg" /></span>
						</c:if>
						<c:if test="${empty teacher.user.profilePhoto}">
							<span class="user_list__profile"><i class="far fa-user"></i></span>
						</c:if>
						<a href='detail?user_no=${teacher.user.userNo}&room_no=${room_no}&member_no=${teacher.memberNo}'>${teacher.user.name}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
				
		<div class="student" style="margin-top: 10em;">
			<div class="student__header">
				<div style="font-size: x-large; font-weight: bold;">학생</div>
				<span onclick="popup(1)" style="cursor: pointer;"><i class="fas fa-user-plus"></i></span>
			</div>
			<hr>
			<ul class="student_list user_list">
				<c:forEach items="${students}" var="student">
				<li class="user_card">
					<c:if test="${not empty student.user.profilePhoto}">
						<span class="user_list__profile"><img src="${pageContext.servletContext.contextPath}/upload/user/thumbnail.${student.user.profilePhoto}.jpg" /></span>
					</c:if>
					<c:if test="${empty student.user.profilePhoto}">
						<span class="user_list__profile"><i class="far fa-user"></i></span>
					</c:if>
						<a href='detail?user_no=${student.user.userNo}&room_no=${room_no}&member_no=${student.memberNo}'>${student.user.name}</a>
				</li>
				</c:forEach>
			</ul>
		</div>

		</div>
		<script>
		
		function popup(role) {
  let popupWidth = 400;
  let popupHeight = 250;

  let popupX = (window.screen.width / 2) - (popupWidth / 2);
  // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

  let popupY= (window.screen.height / 2) - (popupHeight / 2);
  // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음

  let url = "../../room/user/form?class_no="+${room_no}+"&role="+role;
  let name = "class member add";
  let option = "width=400, height=200, top="+popupY+", left="+popupX;
  let popup = window.open(url, name, option);


}
		</script>
	</body>
</html>

