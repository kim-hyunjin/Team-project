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
  if(inputString != null) {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", "join?code="+inputString, true);
    xhr.onreadystatechange = () => {
      if(xhr.readyState == 4) {
        if(xhr.status == 200) {
          location.reload(true);
        }else {
          alert("유효하지 않는 수업코드입니다.");
        }
      }
    }
    xhr.send();
  }
	
}

function add_popup() {
  let popupWidth = 400;
  let popupHeight = 300;

  let popupX = (window.screen.width / 2) - (popupWidth / 2);
  // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

  let popupY= (window.screen.height / 2) - (popupHeight / 2);
  // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음

  let url = "form";
  let name = "clazz add";
  let option = "width=400, height=300, top="+popupY+", left="+popupX;
  let popup = window.open(url, name, option);


}

</script>  
</body>
</html>
