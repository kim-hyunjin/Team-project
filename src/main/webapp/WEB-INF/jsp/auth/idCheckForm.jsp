<%@page import="Team.project.dao.CheckDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<div style="text-align:center"></div>
<h3>아이디 중복확인 결과</h3>

<%
// 사용가능한 아이디일 경우, 아이디 입력 폼에 넣기
String id=request.getParameter("id");
int cnt=CheckDao.duplecateID(id);
out.println("입력 ID:<strong>" + id + "</strong>");
if(cnt == 0){
  out.println("<p> 사용 가능한 아이디입니다.</p>");
  out.println("<a href='javascript:apply(\"" + id + "\")'>[적용]</a>");
%>

<script>
"use strict"
function apply(id){
    console.log(id);
    // 중복 확인 id를 부모창에 적용 , 부모창 opener
 opener.document.form.id.value=id;
    window.close();
}
</script>

<%
} else {
  out.println("<p style='color: red'>해당 아이디는 사용하실 수 없습니다.</p>");
}
%>
<hr>
<a href="javascript:history.back()">[다시시도]</a>
&nbsp; &nbsp;
<a href="javascript:window.close()">[창닫기]</a>