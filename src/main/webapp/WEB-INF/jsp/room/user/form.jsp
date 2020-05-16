<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 추가</title>
<style>
#input_text {
  font-size: large;
  width: 100%;
  height:3em;
}

button {
  margin-top: 1em;
  margin-left: 6em;
  font-size: large;
  font-weight: 500;
  width: 40%;
  height: 10%
}
</style>
</head>
<body>
    
	<form id='form' action='add' method='post'>
		<input name="class_no" type="hidden" value="${class_no}"><br>
		<input name="role" type="hidden" value="${role}"><br>

		<input type="email" name="email" id="input_text" placeholder="초대 대상의 이메일을 입력하세요." />

		<button type="button" id="btn">초대 보내기</button>
    </form>
		
<script>
let btn = document.getElementById("btn");
// 버튼 클릭시 유효성 검사 시작(type="button"인 경우 버튼을 클릭해도 submit을 수행하지 않는다.)
btn.addEventListener("click", function(event){
	let form = document.getElementById("form");
	const input = document.getElementById("input_text");
	const email = form.email.value;
	// 입력값이 없으면 경고창 띄움
	if(email.length == 0) {
	    event.preventDefault();
	    input.focus();
		return;
	} else {
		var xhr = new XMLHttpRequest();
	    xhr.open("GET", "check?email="+email, false);
	    xhr.send();
	    // get요쳥으로 이메일 체크 
	    if(xhr.status == 404) { // 입력한 이메일을 가진 유저가 없으면 404
	    	event.preventDefault();
	    	input.value = "";
	    	input.setAttribute("placeholder", "유효하지 않는 이메일입니다!");
	    	input.focus();
	    	return;
	    }
	    if(xhr.status == 200) { // 이메일이 유효하고, 클래스룸의 소속이면 200
	    	event.preventDefault();
	    	input.value = "";
	    	input.setAttribute("placeholder", "이미 클래스의 멤버입니다!");
	    	input.focus();
	    	return;
	    }
	    if(xhr.status == 204) { // 이메일은 유효하나 클래스룸의 소속이 아니면 204
	    	addMember();
	    	return;
	    }
	}
	
	// 사용자 추가를 비동기로 처리 후 팝업창 닫기
	async function addMember() {
		//사용자가 폼에 입력한 데이터를 json으로 만든다.
		  let member = {
	            classNo: form.class_no.value,
	            role: form.role.value,
	            email: form.email.value
	        };
		
		  try {
			  //fetch()를 통해 room/user/add에 위에서 만든 json 데이터를 가지고 POST요청한다.
	        let response = await fetch('add', {
	              method: 'POST',
	              headers: {
	                'Content-Type': 'application/json;charset=utf-8'
	              },
	              body: JSON.stringify(member)
	        });
			  // 응답이 200번대로 오면 팝업창을 띄운 부모창을 새로고침하고 팝업창은 닫는다.
	        if (response.ok) {
	        	window.opener.parent.location.reload();
	            window.close();
	        }		        
			  // 사용자 추가에 실패한 경우 알림창을 띄우고 팝업창은 닫는다.
		  }catch(error) {
			  alert("사용자 추가에 실패했습니다.");
			  window.close();
		  }
  }
	
}); 

         
</script>
</body>
</html>