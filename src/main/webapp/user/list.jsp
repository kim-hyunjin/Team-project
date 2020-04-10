<%@page import="Team.project.domain.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<jsp:include page="/header.jsp"></jsp:include>
  <h1>유저목록</h1>
  <a href='add'>유저등록</a>
  <form action='search' method='get'>
    <input name='keyword' type='text' placeholder="유저 검색">
    <button>검색</button>
  </form>
  <% 
  List<User> users = (List<User>) request.getAttribute("users");
      for (User user : users) { %>
<%=user.getUserNo()%>, <%=user.getEmail()%>, <a href='detail?no=<%=user.getUserNo()%>'><%=user.getName()%></a><br>
<%}%>

<jsp:include page="/footer.jsp"></jsp:include>