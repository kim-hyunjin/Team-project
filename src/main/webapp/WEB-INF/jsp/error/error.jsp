<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 및 bootstrap -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
  integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
  integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<title>ERROR!</title>
<style>
html, body, .container, .contents {
height:100%;
}
</style>
</head>
<body>
  <div class="container">
    <div class="contents d-flex justify-content-center align-items-center flex-column" style="margin-top:-6em;">
      <img src="${pageContext.servletContext.contextPath}/images/logo_bts.png" style="width:10em; height:10em;">
      <div class="row font-weight-bold" style="font-size:2em;">Oops!</div>
      <div class="row font-weight-bold" style="font-size:1.2em;">죄송합니다. 무엇인가 잘못되었네요.</div>
      <div class="row">
        <a class="mr-3" href="/Team-project/app/clazz/list">메인화면으로 돌아가기</a>
        <a href="javascript:history.back()">뒤로가기</a>
      </div>
    </div>
  </div>
</body>
</html>