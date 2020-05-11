<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 추가</title>
</head>
<body>
<h1>이메일로 추가</h1>
    <form action='add' method='post'>
        이메일: <input name="email" type="email"><br>
          <input name="class_no" type="hidden" value="${class_no}"><br>
          <input name="role" type="hidden" value="${role}"><br>
		<button>완료</button>
	</form>
	
	<script>
	   
	
	</script>
</body>
</html>