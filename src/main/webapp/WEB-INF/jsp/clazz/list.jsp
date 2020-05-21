<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="main_header.jsp"/>

  <div class="main_list">
  <c:if test="${loginUser.alterKey != 'Y' }">
    <h3>이메일 인증을 완료해주세요!</h3>
  </c:if>
  <c:if test="${not empty clazzList && loginUser.alterKey == 'Y'}">
    <c:forEach items="${clazzList}" var="clazz">
        <div class="main_card">
            <div class="main_name">
              <div class="main_card__header" style="position:relative">
                <a class="main_name_title" href="../room/lesson/list?room_no=${clazz.classNo}">
                ${clazz.name}</a>
                <span class="clazz-modal" style="cursor:pointer;"><i class="fas fa-ellipsis-v"></i></span>
                <div class="clazz-detail-box" id="clazz-detail-box ${clazz.classNo}">
                  <div onclick="location.href='detail?class_no=${clazz.classNo}'" style="cursor:pointer;">수정</div>
                  <div onclick="location.href='delete?class_no=${clazz.classNo}'" style="cursor:pointer;">삭제</div>
                </div>
              </div>
              <span>${clazz.room}</span>
            </div>
          <div class="description">${clazz.description}</div>
        </div>
    </c:forEach>
    </c:if>
  </div>
  
<script>
let modalStatus = 0;
	$(document).on('click', '.clazz-modal', function(event) {
		var parentDiv = event.currentTarget.parentNode;
		console.log(parentDiv);
		var div = parentDiv.children[2];
		console.log(div);
		if(modalStatus == 0) {
			div.setAttribute("style", "display:block");
			   modalStatus = 1;
		} else {
			div.setAttribute("style", "display:none");
            modalStatus = 0;
		}
	});

$(function () {
    $("#joinBtn").click(function () {
    let xhr = new XMLHttpRequest();
    const code = $("#modal-code").val();
    console.log(code);
    xhr.open("GET", "join?code="+code, true);
    xhr.onreadystatechange = () => {
      if(xhr.readyState == 4) {
        if(xhr.status == 200) {
          location.reload(true);
          $("#join-modal-close").trigger("click");
        }else if(xhr.status == 400) {
          alert("중복된 수업입니다.");
          $("#modal-code").focus();
        }else {
          alert("유효하지 않는 수업코드입니다.");
          $("#modal-code").focus();
        }
      }
    }
    xhr.send();
  });
});


</script>  

  <script>
  $(function() {
	  $("#createBtn").click(function() {
		  let form = document.getElementById("createForm");
	      if(!form.name.value) {
	        form.name.setAttribute("placeholder", "수업명을 입력해주세요!");
	        form.name.focus();
	      } else {
	        addClass(form);
	      }
	  })
  });
    
    // 수업추가를 비동기로 처리
    async function addClass(form) {
      //사용자가 폼에 입력한 데이터를 json으로 만든다.
        let clazz = {
                name: form.name.value,
                description: form.description.value,
                room: form.room.value
            };
      
        try {
          //fetch()를 통해 clazz/add에 위에서 만든 json 데이터를 가지고 POST요청한다.
            let response = await fetch('add', {
                  method: 'POST',
                  headers: {
                    'Content-Type': 'application/json;charset=utf-8'
                  },
                  body: JSON.stringify(clazz)
            });
          // 응답이 200번대로 오면 팝업창을 띄운 부모창을 새로고침하고 팝업창은 닫는다.
            if (response.ok) {
              location.reload();
              $("#create-modal-close").trigger("click");
            }           
          // 수업 추가에 실패한 경우 알림창을 띄우고 팝업창은 닫는다.
        }catch(error) {
          alert("수업 추가에 실패했습니다.");
          form.reset();
        }
    }
    </script>  
</body>
</html>