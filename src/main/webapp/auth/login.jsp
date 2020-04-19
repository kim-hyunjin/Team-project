<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/header.jsp"></jsp:include>

<% String email = (String)request.getAttribute("email"); %>
      <h1>로그인</h1>
      <form action='login' method='post'>
      <input name='email' type='email' placeholder="이메일" value='<%=email%>'>
      <input type='checkbox' name='saveEamil'>이메일 저장해두기<br>
      <input name='password' placeholder="비밀번호" type='password'><br>
      <button>로그인</button>
      </form>
<jsp:include page="/footer.jsp"></jsp:include>