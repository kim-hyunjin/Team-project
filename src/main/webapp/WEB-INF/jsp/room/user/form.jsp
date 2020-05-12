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

		<button disabled="true" id="email" class="btn btn-primary">완료</button>
		
<script>
const btn = document.getElementById("email");
btn.addEventListener("click", "alert(event)");


         
</script>
         
	</form>
</body>
</html>