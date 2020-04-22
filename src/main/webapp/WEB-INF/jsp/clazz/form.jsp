<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<jsp:include page="../header.jsp"/>

<h1>클래스 만들기</h1>

<form action='add' method='post'>
클래스명: <input name='name' type='text'><br>
내용: <input name='description' type='text'><br>
강의실: <input name='room' type='text'><br>
클래스코드: <input name='classCode' type='text'><br>
<button>완료</button>
</form>

<jsp:include page="../footer.jsp"/>