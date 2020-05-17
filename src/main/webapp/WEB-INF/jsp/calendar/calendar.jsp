<%@ page language="java" 
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>수업 일정</title>
    <link rel=" shortcut icon" href="image/favicon.ico">

    <link rel="stylesheet" href="../../css/calendar/fullcalendar.min.css" />
    <link rel="stylesheet" href="../../css/calendar/bootstrap.min.css" />
    <link rel="stylesheet" href='../../css/calendar/select2.min.css' />
    <link rel="stylesheet" href='../../css/calendar/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600" >
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" >

    <link rel="stylesheet" href="../../css/calendar/main.css">

</head>


<body>
    <div class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">카테고리1</a></li>
                <li><a tabindex="-1" href="#">카테고리2</a></li>
                <li><a tabindex="-1" href="#">카테고리3</a></li>
                <li><a tabindex="-1" href="#">카테고리4</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal" >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" readonly/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">제출 시작일</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" readonly/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">제출 마감일</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" readonly/>
                            </div>
                        </div>
<!--                         <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="카테고리1">카테고리1</option>
                                    <option value="카테고리2">카테고리2</option>
                                    <option value="카테고리3">카테고리3</option>
                                    <option value="카테고리4">카테고리4</option>
                                </select>
                            </div>
                        </div> -->
<!--                         <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div> -->
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc" style="resize: none;" readonly></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <!--<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>  -->
                        
                        
                        <button type="button" class="btn btn-primary"
                         onclick="location.href='../room/lesson/list?room_no=${clazz.classNo}'">클래스로 이동</button>
                        
                    
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default" style="display:none">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body">
               

               <div class="col-lg-6" style="display:none">
                    <label for="calendar_view">과제, 질문별</label>
                    <div class="input-group">
                    <c:forEach items="${assignmentList}" var="item">
                        <label class="checkbox-inline">
                        <input class='filter' type="checkbox" value="${item.title}" checked>${item.title}
                        <br>
                        </label>
                    </c:forEach>
                     <c:forEach items="${questionList}" var="item">
                        <label class="checkbox-inline">
                        <input class='filter' type="checkbox" value="${item.title}" checked>${item.title}
                        </label>
                    </c:forEach> 
                    </div>
                    </div>
            </div>
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->
    <script src="../../script/calendar/jquery.min.js"></script>
    <script src="../../script/calendar/bootstrap.min.js"></script>
    <script src="../../script/calendar/moment.min.js"></script>
    <script src="../../script/calendar/fullcalendar.min.js"></script>
    <script src="../../script/calendar/ko.js"></script>
    <script src="../../script/calendar/select2.min.js"></script>
    <script src="../../script/calendar/bootstrap-datetimepicker.min.js"></script>
    <script src="../../script/calendar/main.js"></script>
    <script src="../../script/calendar/addEvent.js"></script>
    <script src="../../script/calendar/editEvent.js"></script>
    <script src="../../script/calendar/etcSetting.js"></script>
</body>

</html>