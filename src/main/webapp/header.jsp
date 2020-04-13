<%@page import="Team.project.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="../index.html">비트클래스</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">타임라인 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../clazz/list">수업</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../user/list">사용자</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">성적</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">게시판</a>
      </li>
    </ul>
    <%
    User loginUser = (User)request.getSession().getAttribute("loginUser");
    if(loginUser != null) {
    %>
    <span class='navbar-brand mr-2'>
      <a href='../user/detail?no=<%=loginUser.getUserNo()%>'><%=loginUser.getName()%></a>
    </span>
    <a href='../auth/logout' class='btn btn-outline-dark btn-sm'>Logout</a>
    <%} else {%>
    <span>
    <a class="btn btn-outline-dark btn-sm" href="../auth/login" role="button">Login</a>
    </span>
    <%}%>
  </div>
</nav>
<div class="container-fluid" style="margin-top:20px; margin-left:20px;">
