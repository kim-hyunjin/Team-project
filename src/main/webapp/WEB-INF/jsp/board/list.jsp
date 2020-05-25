<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
<jsp:include page="../room/room_header.jsp" />
</head>


<body>
<div class="room_contents">
      <!-- 게시판 출력 사이즈 줄임 -->
		  <div class="board_part" style="width:15%; float:left;">
		   
		   <!-- <button onclick="func()" id="boardManagement" style="display:;">관리</button>  -->
		   <!-- 설정 아이콘 -->
		   <i class="fas fa-cog" onclick="func()" id="boardManagement" style="display:;"></i>
		   
		   
		   <div id="addlink"></div>
		   <!-- 게시판 목록 출력 -->
			 <div class="board_list">
			   
			   <!-- <table border='1'> 
			   <tr>
          <th>게시판제목</th>
         </tr>
         -->
			   
				 <c:forEach items="${list}" var="item">
				      <input name="boardNo" type="hidden" value="${item.boardNo}">
				    <tr>
				      <td><a onclick="postList()" href='../post/list?bno=${item.boardNo}&bTitle=${item.title}' target=postList>${item.title}</a>
				      <a href="updateForm?no=${item.boardNo}"><span class="board_update"></span></a>     
				      <a href="delete?no=${item.boardNo}"><span class="board_delete"></span></a></td>
				    </tr>
				    <hr>
				 </c:forEach>
			   </div>
			   </div>
			   
			   <!-- iframe float -->
			   <div class="post_part" style="position:absolute; position:static top; margin:0px 300px 100px 350px; overflow:hidden;" width="200" height="100">
			     <iframe name="postList" class="post_part__content" scrolling="no"></iframe>
	       </div>
	       
     </div>

     <script>
     const role = ${nowMember.role};
     const element = document.getElementById("boardManagement");
     if (role == 0) {
    	 element.style.display = "";
     } else {
    	 element.style.display = "none";
     }
     
     let state = 0; // 0일 때 - 기본, 1일 때 - 관리모드
     const addlink = document.getElementById("addlink");
		 const updateBtnArr = document.getElementsByClassName("board_update");
		 const deleteBtnArr = document.getElementsByClassName("board_delete");
		 
		 // const content = "<a href='form' >새 게시판 </a>";
		 // 게시판 추가 아이콘, 마우스 오버시 말풍선 띄우기
		 const content = "<a href='form' ><i class='fas fa-folder-plus' style='color:black;' title='게시판을 추가합니다.'></i></a>";

		 const rBtn = "<i class='fas fa-edit'></i></a>"
		 const xBtn = "<i class='fas fa-times'></i>";
		 
     function func() {
    	console.log("func()");
			if(state === 0) {
				state = 1;
    		addlink.innerHTML = content;
				for(let i in deleteBtnArr) {
					document.getElementsByClassName("board_update")[i].innerHTML = rBtn;
					document.getElementsByClassName("board_delete")[i].innerHTML = xBtn;
				}
			} else {
				state = 0;
				addlink.innerHTML = "";
				for(let i in deleteBtnArr) {
					document.getElementsByClassName("board_update")[i].innerHTML = "";
					document.getElementsByClassName("board_delete")[i].innerHTML = "";
				}
 			}
     }

		 </script>

   </body>
</html>
