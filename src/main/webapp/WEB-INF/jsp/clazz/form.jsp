<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<title>수업 만들기</title>
<style>
input {
	font-size: large;
	height: 20%;
	width: 100%;
	margin-top: 1em;
}

button {
	margin-top: 1em;
	margin-left: 8em;
	font-size: large;
	font-weight: 500;
	width: 30%;
	height: 10%
}
</style>
</head>
<body>
	<form id="form" action='add' method='post'>
		<input name='name' type='text' placeholder="수업명"> <input
			name='description' type='text' placeholder="설명"> <input
			name='room' type='text' placeholder="강의실">
		<button id="btn">만들기</button>
	</form>
	<script>
		document.getElementById("btn").onclick = function(event) {
				event.preventDefault();
			let form = document.getElementById("form");
			if(!form.name.value) {
				form.name.setAttribute("placeholder", "수업명을 입력해주세요!");
				form.name.focus();
			} else {
				addClass();
			}
			
	}
		// 수업추가를 비동기로 처리
		async function addClass() {
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
		        	window.opener.parent.location.reload();
		            window.close();
		        }		        
				  // 수업 추가에 실패한 경우 알림창을 띄우고 팝업창은 닫는다.
			  }catch(error) {
				  alert("수업 추가에 실패했습니다.");
				  window.close();
			  }
	  }

			
	  
		</script>
</body>
</html>