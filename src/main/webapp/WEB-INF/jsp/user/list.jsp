<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../room/room_header.jsp"/>

		<div class="user_content">
		<div class="teacher">
			<div class="teacher__header">
				<div style="font-size: x-large; font-weight: bold;">선생</div>
				<a href="../../room/user/form">
				<div><i class="fas fa-user-plus"></i></div></a>
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
						<a href='detail?no=${teacher.user.userNo}&room_no=${room_no}'>${teacher.user.name}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
				
		<div class="student" style="margin-top: 10em;">
			<div class="student__header">
				<div style="font-size: x-large; font-weight: bold;">학생</div>
				<a href="../../room/user/form"><div><i class="fas fa-user-plus"></i></div></a>
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
						<a href='detail?no=${student.user.userNo}&room_no=${room_no}'>${student.user.name}</a>
				</li>
				</c:forEach>
			</ul>
		</div>

		</div>
	</body>
</html>

