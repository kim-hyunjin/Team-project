<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/Team-project/css/style.css" />
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

<!-- summernote -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

</head>


<body>
	<div class="container mt-5">
		<span class="d-flex flex-row-reverse"> <i
			class="fas fa-times col-2"
			onclick="location.href='javascript:history.back()'"
			style="font-size: 2em; cursor: pointer"></i>
		</span>
		<c:set var="a" value="${post.memberNo}" />
		<c:set var="b" value="${classMember}" />
		<c:choose>
			<c:when test="${a == b}">
				<form action='update' method='post' enctype='multipart/form-data'
					onsubmit='return formCheck(this)'>
					<input name='memberNo' style='display: none'
						value='${post.memberNo}'> <input name='boardNo'
						type='hidden' value='${post.boardNo}'>
					<!-- 번호 -->
					<input name='postNo' type='hidden' readonly value='${post.postNo}'>
					<div class="inputGroup mb-3" style="width: 58em;">
						<div>
							<label class="inputGroupText">제목</label> <input name='title'
								type='text' value='${post.title}'>
						</div>
						<span>작성일 : ${post.createDate}</span>
					</div>
					<textarea id='summernote' name='content'>${post.content}</textarea>
					<!-- 파일 -->
					<div class="mt-3 d-flex">
						<div class="col-6">
							<div>
								<label class="inputGroupText">첨부파일</label> <span id="download"
									title="다운로드" style="cursor: pointer; font-size: 1.2em;">${file.originalName}</span>
							</div>
						</div>
						<div class="col-6">
							<input name='partFile' type='file'>
						</div>
					</div>
					<div class="d-flex flex-row-reverse mt-5" style="width: 50em;">
						<button type="submit" class="btn btn-primary">변경</button>
						<button type="button" class="btn btn-danger mr-3"
							onclick="confirmDelete()">삭제</button>
					</div>

				</form>

				<!-- <a href="delete?no=${post.postNo}&bno=${post.boardNo}">삭제</a> -->
			</c:when>

			<c:otherwise>
				<input name='memberNo' type='hidden' value='${post.memberNo}'>
				<input name='boardNo' type='hidden' value='${post.boardNo}'>
				<!-- 번호 -->
				<input name='postNo' type='hidden' readonly value='${post.postNo}'>
				<div class="inputGroup mb-3" style="width: 58em;">
					<div>
						<label class="inputGroupText">제목</label> <input name='title'
							type='text' readonly value='${post.title}'>
					</div>
					<span>작성일 : ${post.createDate}</span>
				</div>
				<textarea id='summernote-readonly' name='content'
					style="background-color: white;">${post.content}</textarea>
				<!-- 파일 -->
        <label class="inputGroupText">첨부파일</label>
				<span id="download" title="다운로드" class="mt-3"
					style="cursor: pointer; font-size: 1.2em;">${file.originalName}</span>

			</c:otherwise>
		</c:choose>
	</div>

	<script>
  document.getElementById("download").onclick = () => {
  window.location = '../download?fileId='+`${file.fileId}`;
  }

  
  $('#summernote').summernote({
      height: 300,
      width: 800
    });  
  
  $('#summernote-readonly').summernote({
    toolbar: false,
    height: 300,
      width: 800
  });  
  $('#summernote-readonly').summernote('disable');
  $('.note-editable').css('background-color', 'white');
  </script>

	<script>
  //function confirmDelete() {
  //    if(confirm("정말 삭제하시겠습니까?")) {
  //      location.href="delete?no=${post.postNo}&bno=${post.boardNo}";
  //    }
  //}
  
  //function confirmDelete() {
  //   swal({
	//		  title: "정말 삭제하시겠습니까?",
	//		  text: "삭제하면 되돌릴 수 없습니다.",
	//		  icon: "warning",
	//		  buttons: true,
	//		  dangerMode: true
	//		})
	//		.then((willDelete) => {
	//		  if (willDelete) {
	//		      location.href="delete?no=${post.postNo}&bno=${post.boardNo}";
	//		  }
	//		});
	// }
function confirmDelete() {
	  Swal.fire({
	  position: 'top',
	  title: '정말 삭제하시겠습니까?',
	  text: '삭제하면 되돌릴 수 없습니다.',
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#d33',
	  cancelButtonColor: '#A4A4A4',
	  cancelButtonText: '취소',
	  confirmButtonText: '삭제'
	}).then((result) => {
	  if (result.value) {
	      location.href="delete?no=${post.postNo}&bno=${post.boardNo}";
	  }
	});
}
  
//    function formCheck(frm) {
//      if (frm.title.value == "") {
//        alert("제목을 입력해 주세요.");
//        frm.title.focus();
//        return false;
//      }
//      return true;
//    }
    
    function formCheck(frm) {
	      if (frm.title.value == "") {
		  Swal.fire({
		      position: 'top',
		      icon: 'error',
		      title: '제목을 입력해주세요.',
		    });
	        frm.title.focus();
	        return false;
	      }
	      return true;
	    }
    
  </script>
</body>
</html>

