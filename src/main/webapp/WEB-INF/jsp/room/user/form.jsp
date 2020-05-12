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
	<form action='add' method='post'>
		<input name="class_no" type="hidden" value="${class_no}"><br>
		<input name="role" type="hidden" value="${role}"><br>

		이메일: <input type="email" name="email" id="input_text" />

		<button id="email" class="btn btn-primary">완료</button>
    </form>
		
<script>
let btn = document.getElementById("email");
btn.onclick = (event) => {
	const email = document.getElementById("input_text").value;
	if(email.length == 0) {
	    event.preventDefault();
		alert("email을 입력해주세요!");
	} else {
		event.preventDefault();
		var xhr = new XMLHttpRequest();
	    xhr.open("GET", "check?email="+email, false);
	    xhr.send();
	    if(xhr.responseText == email) {
	    	console.log(xhr.responseText);
	    	alert("이미 클래스의 멤버입니다!");
	    } else if(xhr.status == 404) {
	    	alert("존재하지 않는 이메일입니다!");
	    }
	}
	
	
}

         
</script>
</body>
</html>