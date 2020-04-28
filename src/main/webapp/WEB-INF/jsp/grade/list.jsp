<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../room/room_header.jsp"/>

        <div class="room_contents">
          <table border='1'>
  <tr>
    <th>수업참여자</th>
    <c:forEach items="${assignments}" var="item">
      <th>${item.title}</th>
    </c:forEach>
    
  </tr>
<c:forEach items="${clazzMembers}" var="item">
  <c:if test="${item.role == 1}"> 
  <tr>
        <th>${item.user.name}</th>
      <c:forEach items="${userAssignmentSubmits.get(item.userNo)}" var="assignment">
        <th>${assignment.score}</th>   
      </c:forEach>
        
 </tr>
 </c:if>
</c:forEach>
  
  <!-- 
        <c:forEach items="${assignmentsubmitList}" var="test">
      </c:forEach>
  ${item.assignmentNo}/${item.memberNo}:
            <c:if test="${
          test1.clazzMember.memberNo eq test1.assignment.memberNo 
          }">
          </c:if>
          test.user.userNo eq test.clazzMember.userNo &&
          test.clazzMember.memberNo eq test.assignment.memberNo &&
          &&
          test.assignment.assignmentNo eq test.assignmentNo
   -->
  
<%--   <c:forEach items="{${listoflist},${clazzMemberList}}" var="list">
  <tr>
      <th>${list.user.name}</th>
      <c:forEach items="list" var="test">
        <th>${test.score}</th>
      </c:forEach>
 </tr>
    </c:forEach> --%>


  
  
  
  
  
  
  
  
  </table>
        </div>
      
</body>
</html>