<%@page import="java.util.List"%>
<%@page import="Team.project.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset='UTF-8'>
  <title>회원 검색</title>
</head>
<body>
  <h1>회원 검색 결과</h1>
  <% 
  List<User> users = (List<User>)request.getAttribute("users");
  for (User user : users) {%>
      <%=user.getUserNo()%>, <%=user.getEmail()%>, 
      <a href='detail?no=<%=user.getUserNo()%>'><%=user.getName()%></a><br>
      <%}%>
      <a href='list'>목록으로 돌아가기</a><br>
</body>
</html>
