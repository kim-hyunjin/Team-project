<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/764f0503e3.js"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<!-- summernote -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<link rel="stylesheet" href="/Team-project/css/style.css" />
</head>
<body>
	<div class="container">
		<h3>게시글 등록</h3>
		<span class="d-flex flex-row-reverse"> <i
			class="fas fa-times col-2"
			onclick="location.href='javascript:history.back()'"
			style="font-size: 2em; cursor: pointer"></i>
		</span>
		<form class="mt-3" action='../post/add' method='post'
			enctype='multipart/form-data' onsubmit='return formCheck(this)'>
			<input name="boardNo" type="hidden" value="${boardNo}">
			<div class="inputGroup mb-3" style="width: 58em;">
				<div>
					<label class="inputGroupText">제목</label> <input id='titleInput'
						name='title' type='text' placeholder='제목을 입력하세요.' maxlength="50">
				</div>
			</div>
			<textarea id="summernote" name="content"></textarea>
			<div class="d-flex justify-content-between mt-5" style="width: 50em;">
				<input name='partFile' type='file'>
				<button class="btn btn-primary">확인</button>
			</div>
		</form>
	</div>
	<script>
	function formCheck(frm) {
	    if (frm.title.value == "") {
		Swal.fire({
		    position : 'top',
		    icon : 'error',
		    title : '제목을 입력해주세요.',
		});
		frm.title.focus();
		return false;
	    }
	    return true;
	}
    </script>
	<script>
	$('#summernote').summernote({
	    height : 300,
	    width : 800,
	    placeholder : '내용을 입력하세요.'
	});
    </script>
</body>
</html>


