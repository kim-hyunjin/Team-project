<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="main_header.jsp"/>

  <div class="main_list">
  <c:if test="${not empty clazzList}">
    <c:forEach items="${clazzList}" var="clazz">
        <div class="main_card">
            <div class="main_name">
              <div>
                <a class="main_name_title" href="../room/timeline/list?room_no=${clazz.classNo}">${clazz.name}</a>
                <i class="fas fa-ellipsis-v js-main_name__menu"></i>
              </div>
              <span>${clazz.room}</span>
            </div>
          <div class="description">${clazz.description}</div>
        </div>
    </c:forEach>
    </c:if>
    <form action='join' method='get'>
수업코드입력: <input name='code' type='text'>
<button>등록</button>
  </div>
</div>
</body>
</html>
