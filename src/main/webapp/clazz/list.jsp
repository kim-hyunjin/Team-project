<%@page import="Team.project.domain.Clazz"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="clazzList" type="java.util.List<Clazz>"
  class="java.util.ArrayList" scope="request"
/>
<jsp:include page="/header.jsp"></jsp:include>
  <h1>클래스 목록</h1>
  <a href="add">수업 추가</a><br>
  <%
  for(Clazz clazz : clazzList) { 
    pageContext.setAttribute("clazz", clazz);
    %>
    ${clazz.classNo}, <a href="detail?no=${clazz.classNo}">${clazz.name}</a>, 
    ${clazz.description}, ${clazz.room}, ${clazz.createDate}<br>
  <%}%>
<jsp:include page="/footer.jsp"></jsp:include>