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
                <a class="main_name_title" href="../room/lesson/list?room_no=${clazz.classNo}">${clazz.name}</a>
                <i class="fas fa-ellipsis-v js-main_name__menu"></i>
              </div>
              <span>${clazz.room}</span>
            </div>
          <div class="description">${clazz.description}</div>
        </div>
    </c:forEach>
    </c:if>
  </div>
  
<script>
document.getElementById("assignClass").onclick = () => {
	let inputString = prompt('수업참여', '수업코드를 입력하세요.');
	let form = document.createElement("form");
	form.setAttribute("action", "join");
	form.setAttribute("method", "get");
	let codeInput = document.createElement("input");
	codeInput.setAttribute("name", "code");
	codeInput.value = inputString;
	form.appendChild(codeInput);
	document.body.appendChild(form);
	form.submit();
}

</script>  
</body>
</html>
