<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../room/room_header.jsp" />
<div class="room_contents">
  <span class="d-flex flex-row-reverse"> <i class="fas fa-times"
    onclick="location.href='javascript:history.back()'" style="font-size: 2em; cursor: pointer"></i>
  </span>
  <!-- 질문정보 렌더링 -->
  <div class="d-flex">
    <div class="col-2 p-0 pr-5 d-flex flex-column submitted_assignment_detail"
      style="border-right: thin solid rgba(0, 0, 0, 0.1)">
      <label class="inputGroupText">질문명</label>
      <div>${question.title}</div>
      <label class="inputGroupText">질문내용</label>
      <textarea class="form-control p-0 mb-3" style="overflow: hidden; width: 100%; height: 10em; border: 0;">${question.content}</textarea>
      <label class="inputGroupText">마감일</label>
      <div>${question.deadline}</div>
      <select class="mt-5 form-control" id="filter-select" onclick="answerFilter(this.value)">
        <option>전체</option>
        <c:forEach items="${multiples}" var="m">
          <option>${m.multipleContent}</option>
        </c:forEach>
      </select>
    </div>
    <div class="col-10 d-flex flex-column justify-content-start mt-3">
      <c:if test="${not empty multiples && not empty ratioMap}">
        <div class="progress" style="height: 2em;">
          <c:forEach items="${multiples}" var="m">
            <div class="progress-bar" role="progressbar" title="${ratioMap.get(m.multipleNo)}%"
              style="width:${ratioMap.get(m.multipleNo)}%;" aria-valuenow="${ratioMap.get(m.multipleNo)}"
              aria-valuemin="0" aria-valuemax="100">${m.multipleContent}</div>
          </c:forEach>
        </div>
      </c:if>
      <c:if test="${not empty answers}">
        <c:forEach items="${answers}" var="a">
          <div class="mt-5 answerList" style="display:flex;">
            <div class="col-6">
              <div class="userName text-primary font-weight-bold mb-2" style="font-size: 1.2em">${a.user.name}</div>
              <textarea readonly class="form-control" style="background-color: white;">${a.content}</textarea>
            </div>
            <c:if test="${not empty multipleAnswerMap.get(a.multipleNo)}">
              <div class="col-6 input-group d-flex flex-column justify-content-center">
                <div class="text-info font-weight-bold">객관식 답변</div>
                <div class="d-flex">
                  <label class="input-group-append mb-0"> <span class="input-group-text">
                      ${multipleAnswerMap.get(a.multipleNo).no}</span></label> <input readonly
                    class="form-control answerMultipeContent"
                    value="${multipleAnswerMap.get(a.multipleNo).multipleContent}" style="background-color: white;">
                </div>
              </div>
            </c:if>
          </div>
        </c:forEach>
      </c:if>
    </div>
  </div>
</div>
<script>
    $('.progress-bar:nth-child(n+1)').attr('class', 'progress-bar');
    $('.progress-bar:nth-child(n+2)').attr('class', 'progress-bar bg-warning');
    $('.progress-bar:nth-child(n+3)').attr('class', 'progress-bar bg-success');
    $('.progress-bar:nth-child(n+4)').attr('class', 'progress-bar bg-info');
    $('.progress-bar:nth-child(n+5)').attr('class', 'progress-bar bg-danger');

function answerFilter(value) {
	var name, item, i;
	value = value.toUpperCase();
	item = document.getElementsByClassName("answerList");
	for (i = 0; i < item.length; i++) {
	    name = item[i].getElementsByClassName("answerMultipeContent");
	    if (value == "전체") {
		item[i].style.display = "flex";
	    } else if (name[0].value.toUpperCase().includes(value) == true) {
		item[i].style.display = "flex";
	    } else {
		item[i].style.display = "none";
	    }
	}
}
</script>
</body>
</html>