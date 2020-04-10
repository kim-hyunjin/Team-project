<%@page import="Team.project.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>회원 상세정보</title>
</head>
<body>
<h1>회원 상세정보</h1>
<%
User user = (User) request.getAttribute("user");
if (user != null) {
%>
<img src='../upload/thumbnail.<%=user.getProfilePhoto()%>.jpg'><br>
<form action='update' method='post' enctype='multipart/form-data'>
        번호: <input name='no' type='text' readonly value='<%=user.getUserNo()%>'><br>
        이메일: <input name='email' type='email' value='<%=user.getEmail()%>'><br>
        이름: <input name='name' type='text' value='<%=user.getName()%>'><br>
        암호: <input name='password' type='password'><br>
        전화: <input name='tel' type='tel' value='<%=user.getTel()%>'><br>
        전공: <input name='major' type='text' value='<%=user.getMajor()%>'><br>
        자기소개<br><textarea name='introduce' rows='5' cols='60'><%=user.getIntroduce()%></textarea><br>
        사진: <input name='profilePhoto' type='file'><br>
        <%
        int loginm = user.getLoginMethod();
        String loginstr;
        switch(loginm) {
          case 0 : loginstr = "이메일"; break;
          case 1 : loginstr = "카카오"; break;
          case 2 : loginstr = "구글"; break;
          default : loginstr = "null";
        } %>
        로그인 방식: <%=loginstr%><br>
        회원가입일 : <%=user.getCreateDate()%>
        <p><button>변경</button>
        <a href='delete?no=<%=user.getUserNo()%>'>삭제</a></p>
        </form>
      <% } else {
        throw new Exception("해당 번호의 회원이 없습니다.");
      }%>
      </body>
      </html>