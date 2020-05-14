<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<title>수업 만들기</title>
		<style>
			input{
				font-size: large;
				height: 20%;
				width: 100%;
				margin-top:1em;
			}
			button{
				margin-top: 1em;
				margin-left: 8em;
				font-size: large;
				font-weight: 500;
				width:30%;
				height: 10%
			}
		</style>
	</head>
	<body>
		<form id="form" action='add' method='post'>
			<input name='name' type='text' placeholder="수업명">
			<input name='description' type='text' placeholder="설명">
			<input name='room' type='text' placeholder="강의실">
			<button id="btn">만들기</button>
		</form>
		<script>
		document.getElementById("btn").onclick = function(event) {
			let form = document.getElementById("form");
			if(!form.name.value) {
				event.preventDefault();
				form.name.setAttribute("placeholder", "수업명을 입력해주세요!");
				form.name.focus();
			} else {
				form.submit();
				//클래스를 추가하는 동안 시간이 걸리기 때문에 새로고침을 여러번 해준다.
				window.opener.parent.location.reload();
				window.opener.parent.location.reload();
				window.opener.parent.location.reload();
				window.opener.parent.location.reload();
				window.opener.parent.location.reload();
				window.close();
			}
		}
			
		</script>
	</body>
</html>