<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 추가</title>
        <!-- 이메일 입력 해야만 확인이 활성화 되어 등록가능하게 하는 코드 -->

</head>
<body>
    
	<h1>이메일로 추가</h1>
	<form id='form' action='add' method='post'>
		<input name="class_no" type="hidden" value="${class_no}"><br>
		<input name="role" type="hidden" value="${role}"><br>

		이메일: <input type="email" name="email" id="input_text" />

		<button type="button" id="btn">완료</button>
    </form>
		
<script>
let btn = document.getElementById("btn");
// 버튼 클릭시 유효성 검사 시작(type="button"인 경우 버튼을 클릭해도 submit을 수행하지 않는다.)
btn.addEventListener("click", function(event){
	const email = document.getElementById("input_text").value;
	// 입력값이 없으면 경고창 띄움
	if(email.length == 0) {
	    event.preventDefault();
		alert("email을 입력해주세요!");
		return;
	} else {
		var xhr = new XMLHttpRequest();
	    xhr.open("GET", "check?email="+email, false);
	    xhr.send();
	    // get요쳥으로 이메일 체크 
	    if(xhr.status == 404) { // 입력한 이메일을 가진 유저가 없으면 404
	    	event.preventDefault();
	    	alert("유효하지 않는 이메일입니다!");
	    	return;
	    }
	    if(xhr.status == 200) { // 이메일이 유효하고, 클래스룸의 소속이면 200
	    	event.preventDefault();
	    	alert("이미 클래스의 멤버입니다!");
	    	return;
	    }
	    if(xhr.status == 204) { // 이메일은 유효하나 클래스룸의 소속이 아니면 204
	    	document.getElementById("form").submit(); // form의 submit()을 실행한다.
	    	return;
	    }
	}
	
	
}); 

         
</script>
</body>
</html>