<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="../room/room_header.jsp" />
<div class="room_contents">
		  <div class="board_part">
		   <button onclick="func()" id="boardManagement" style="display:;">관리</button>
		   <div id="addlink"></div>
		   <!-- 게시판 목록 출력 -->
			   <div class="board_list">
			   <table border='1'>
			   <tr>
			    <th>번호</th>
			    <th>게시판제목</th>
			   </tr>
				 <c:forEach items="${list}" var="item">
				    <tr>
				      <td>${item.boardNo}</td> 
				      <td><a href='list?bno=${item.boardNo}' target=postList>${item.title}</a>
				      <a href="delete?no=${item.boardNo}"><span class="board_delete"></span></a>
				      <a href="updateForm?no=${item.boardNo}"><span class="board_update"></span></a></td> 
				    </tr>
				 </c:forEach>
			   </table>
			   </div>
			   </div>
			   <div class="post_part">
		      <iframe src="" name="postList" class="post_part__content"></iframe>
		   </div>

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
		 const deleteBtnArr = document.getElementsByClassName("board_delete");
		 
		 const updateBtnArr = document.getElementsByClassName("board_update");
		 
     const content = "<a href='form'>새 게시판</a>";
		 const xBtn = "<i class='fas fa-times'></i>";
		 
		 const rBtn = "<i class='fas fa-edit'></i></a>"

		 
     function func() {
    	console.log("func()");
			if(state === 0) {
				state = 1;
    		addlink.innerHTML = content;
				for(let i in deleteBtnArr) {
					document.getElementsByClassName("board_delete")[i].innerHTML = xBtn;
					
					document.getElementsByClassName("board_update")[i].innerHTML = rBtn;
				}
			} else {
				state = 0;
				addlink.innerHTML = "";
				for(let i in deleteBtnArr) {
					document.getElementsByClassName("board_delete")[i].innerHTML = "";
					
					document.getElementsByClassName("board_update")[i].innerHTML = "";
				}
			}
    	 
     }
     
     </script>
     
     
   </body>
</html>