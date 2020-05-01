<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../room/room_header.jsp"/>
  <div class="room_contents">

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

