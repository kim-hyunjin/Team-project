<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="room_header.jsp"/>

        <div class="room_contents">
        <h2>과제</h2>
        <div class="assignments">
          <c:if test="${not empty assignments}">
            <c:forEach items="${assignments}" var="ass">
              <table>
              <tr>
                <th>과제 번호</th>
                <th>과제 제목</th>
                <th>마감일</th>
              </tr>
              <tr>
                <td>${ass.assignmentNo}</td>
                <td>${ass.title}</td>
                <td>${ass.deadline}</td>
              </tr>
              </table>
            </c:forEach>
          </c:if>
        </div>
        
        </div>
    </div>
</body>
</html>