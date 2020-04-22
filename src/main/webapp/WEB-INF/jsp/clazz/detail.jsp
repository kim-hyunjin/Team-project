<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header.jsp"/>

<h1>클래스 상세정보</h1>

<c:if test="${not empty clazz}">
<form action='update' method='post'>
번호: <input name='classNo' readonly type='text' value='${clazz.classNo}'><br>
클래스명 : <input name='name' type='text' value='${clazz.name}'><br>
내용: <br>
<textarea name='description' rows='5' cols='60'>${clazz.description}</textarea><br>
강의실: <input name='room' type='text' value='${clazz.room}'><br>
코드번호: <input name='classCode' type='text' value='${clazz.classCode}'><br>
생성일: <input name='createDate' readonly type='date' value='${clazz.createDate}'><br> 
<p><button>변경</button>
<a href='delete?no=${clazz.classNo}'>삭제</a></p>
</form>
</c:if>

<c:if test="${empty clazz}">
<p>해당 번호의 수업이 없습니다.</p>
</c:if>

<jsp:include page="../footer.jsp"/>