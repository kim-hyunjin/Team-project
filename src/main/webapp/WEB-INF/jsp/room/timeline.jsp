<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <jsp:include page="room_header.jsp"/>

  <div class="room_contents">
  
        
    <table border='1'>
    <tr>
      <th>게시판제목</th>
      <th>제목</th>
      <th>내용</th>
      <th>작성일</th>
    </tr>
    
  <c:if test="${not empty posts}">
    <h1>게시글 리스트</h1>
  <c:forEach items="${posts}" var="item">
    <tr>
      <td>${item.board.title}</td>
      <td>${item.title}</td>
      <td>${item.content}</td>
      <td>${item.createDate}</td>
    </tr>
  </c:forEach>
  </c:if>
  </table>

   <h2>질문게시판</h2>
   <table border='1' style="width:100%">
   <tr>
    <th>번호</th>
    <th>질문제목</th>
    <th>질문마감기한</th>
   </tr>
    <c:forEach items="${questions}" var="item">
      <tr>
        <td>${item.questionNo}</td>
        <td><a href='../question/detail?qno=${item.questionNo}'>${item.title}</a></td>
        <td>${item.deadline}</td>
       </tr>
    </c:forEach>
    </table>

        <h2>과제</h2>
        <div class="assignments">
          <c:if test="${not empty assignments}">
              <table border='1' style="width:100%">
		              <tr>
		                <th>과제 번호</th>
		                <th>과제 제목</th>
		                <th>마감일</th>
		              </tr>
		            <c:forEach items="${assignments}" var="ass">
		              <tr>
		                <td>${ass.assignmentNo}</td>
		                <td>${ass.title}</td>
		                <td>${ass.deadline}</td>
		              </tr>
		            </c:forEach>
              </table>
          </c:if>
        </div>
        
    </div>
</body>
</html>

