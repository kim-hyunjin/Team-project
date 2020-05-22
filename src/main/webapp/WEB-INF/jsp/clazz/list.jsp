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
                  <div onMouseover="this.style.backgroundColor='red';" onMouseout="this.style.backgroundColor='white';" class="class-update-btn" data-toggle="modal" data-target="#updateClass">수정</div>
                  <div onMouseover="this.style.backgroundColor='red';" onMouseout="this.style.backgroundColor='white';" onclick="location.href='delete?class_no=${clazz.classNo}'">삭제</div>
                </div>
              </div>
              <span>${clazz.room}</span>
            </div>
          <div class="description">${clazz.description}</div>
        </div>
    </c:forEach>
    </c:if>
  </div>
  
  <!-- Modal -->
<div class="modal fade" id="updateClass" tabindex="-1" role="dialog" aria-labelledby="updateClassLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="updateClassLabel">수업 정보 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="updateForm" action='update' method='post'>
         <input name='classNo' type='hidden'>
         <input name='from' type='hidden' value='main'>
         <input name='name' type='text' placeholder="수업명">
         <input name ='description' type ='text' placeholder="설명">
         <input name='room' type='text' placeholder="강의실">
         <input name='classCode' type='text' placeholder="수업코드">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="create-modal-close">Close</button>
        <button type="button" class="btn btn-primary" id="modal-updateBtn">Update</button>
      </div>
    </div>
  </div>
</div>
  
  
<script>
let modalStatus = 0;
	$(document).on('click', '.clazz-modal', function(event) {
		var parentDiv = event.currentTarget.parentNode;
		var div = parentDiv.children[2];
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
    <script>
    $(document).on('click', '.class-update-btn', function (event) {
    	var parent = event.currentTarget.parentNode;
    	console.log(parent);
    	parent.setAttribute("style", "display:none;");
    	modalStatus = 0;
    	
    	// update시 필요한 classNo를 가져온다.
    	let classNo = parent.getAttribute('id').replace('clazz-detail-box ', '');
    	console.log(classNo);
    	let form = document.getElementById("updateForm");
    	form.classNo.value = classNo;
    	
    	// 비동기로 detail을 get 요청하여 수업 상세 정보를 가져와 모달에 넣어준다.
    	let xhr = new XMLHttpRequest();
        xhr.open("GET", "detail?classNo="+classNo, true);
        xhr.onreadystatechange = () => {
          if(xhr.readyState == 4) {
            if(xhr.status == 200) {
              const clazzJson = JSON.parse(xhr.responseText);
              console.log(clazzJson);
              form.name.value= clazzJson.name;
              form.description.value= clazzJson.description;
              form.room.value= clazzJson.room;
              form.classCode.value= clazzJson.classCode;
            }else {
              
            }
          }
        }
        xhr.send();
    });
    
    $('#modal-updateBtn').click(function() {
    	$('#updateForm').submit();
    });

    $(document).on('mouseleave', '.main_card', function (e) {
    	$(e.target).find('.clazz-detail-box').css('display','none');
    });
    
    $(document).on('mouseenter', '.main_card', function (e) {
        modalStatus = 0;
    });
    </script>
    
</body>
</html>