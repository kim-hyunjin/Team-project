-- 학생 데이터 
insert into user(email, name, password, tel, major, introduce, login_method)
  values('asdzxc9395@naver.com', '채진호선생님', password('1111'), '1515', '조리과', '하기싫어요', 1);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('asdzx@naver.com', '조이', password('1111'), 23423, '조리과', '하기싫어요', 1);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('9395@naver.com', '아이번', password('1111'), 234234, '조리과.', '하기싫어요', 1);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('asdwd395@naver.com', '갈리오', password('1111'), 343432, '조리과.', '하기싫어요', 0);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('sdwdw@test.com', '아무무', password('1111'), 234234, '조리과', '하기싫어요', 0);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('linus@kakao.com', '리누스', password('1111'), '010-1234-5678', '조리과', '노잼', 1);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('koreano@gmail.com', '세종대왕', password('1111'), '010-1231-1231', '조리과', '나랏말싸미', 2);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('james@kako.com', 'James', password('1111'), '010-4243-7567', '조리과', 'hello~!', 1);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('asdwd395@gmail.com', '이타치', password('1111'), '010-3466-4454', '조리과', '아리가또', 2);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('sdwdw@naver.com', '클레오파트라', password('1111'), '010-1233-5657', '조리과', '청청이 어울림', 0);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('qwertrtt9395@naver.com', '신지섭', password('1111'), 010-1234-5678, '컴퓨터공학', '안녕하세요', 1);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('wltjq202206@naver.com', '가야', password('1111'), 010-5412-4471, '컴퓨터공학', '반갑습니다', 1);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('11541_1@naver.com', '고기', password('1111'), 010-4415-5574, '컴퓨터공학.', '홧팅', 1);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('qwqwexzxc395@naver.com', '가지마', password('1111'), 010-7415-5412, '컴퓨터공학.', '잘부탁드려요', 0);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('dsdccc@daum.com', '오징어', password('1111'), 010-8742-4512, '컴퓨터공학', 'ㅎㅎ', 0);
insert into user(email, name, password, major, introduce, login_method, create_date)
  values('ha@gamil.com', '하정우', password('1111'), '컴퓨터공학', '안녕하세요', '0', '2020-4-20');
insert into user(email, name, password, tel, major, introduce, profile_photo, login_method, create_date)
  values('kim@gamil.com', '김사랑', password('1111'), '010-1111-2222', '수학', '안녕', 'b.gif', '1', '2020-4-21');
insert into user(email, name, password, tel, introduce, profile_photo, login_method, create_date)
  values('lim@gamil.com', '임윤아', password('1111'), '010-1111-3333', '하이', 'c.gif', '1', '2020-4-22');
insert into user(email, name, password, tel, major, introduce, profile_photo, login_method, create_date)
  values('son@gamil.com', '손흥민', password('1111'), '010-1111-4444', '사회', '할룽', 'd.gif', '0', '2020-4-23');
insert into user(email, name, password, tel, major, profile_photo, login_method, create_date)
  values('naldo@gamil.com', '호날두', password('1111'), '010-1111-5555', '역사', 'e.gif', '0', '2020-4-24');
insert into user(email, name, password, tel, major, profile_photo, login_method, create_date)
  values('123@123', '테스트', password('123'), '010-1111-5555', '역사', 'e.gif', '0', '2020-4-24');
  
  
-- 클래스 생성

insert into class(name, description, room, class_code)
  values('우송요리학원', '양식배우기', '강의실1', 'sdskl2d2');
  insert into class(name, description, room, class_code)
  values('비트요리학원', '한식배우기', '강의실2', 'dsdw2kl2d2');
  insert into class(class_no, name, room, class_code, create_date) 
  values(3, '컴퓨터', '어렵다', 'abc', '2020-4-20');
insert into class(class_no, name, description, room, class_code, create_date) 
  values(4, '수학', '수학과놀이', '하기싫다', 'sdf', '2020-4-22');
insert into class(class_no, name, description, class_code, create_date) 
  values(5, '과학', '과학놀이터', 'wer', '2020-4-23');
insert into class(class_no, name, description, room, class_code, create_date) 
  values(6, '사회', '사회사회', '헐퀴', 'fgh', '2020-4-24');
insert into class(class_no, name, class_code, create_date) 
  values(7, '역사', 'abqwe', '2020-4-25');

  
-- 참여멤버생성

insert into class_member(user_no, class_no, role)
  values(1, 1, 0);
insert into class_member(user_no, class_no, role)
  values(2, 1, 1);
insert into class_member(user_no, class_no, role)
  values(3, 1, 1);
insert into class_member(user_no, class_no, role)
  values(4, 1, 1);
insert into class_member(user_no, class_no, role)
  values(5, 1, 1);
insert into class_member(user_no, class_no, role)
  values(6, 1, 1);
insert into class_member(user_no, class_no, role)
  values(7, 1, 1);
insert into class_member(user_no, class_no, role)
  values(8, 1, 1);
insert into class_member(user_no, class_no, role)
  values(9, 1, 1);
insert into class_member(user_no, class_no, role)
  values(10, 1, 1);
insert into class_member(user_no, class_no, role)
  values(11, 3, 0);
insert into class_member(user_no, class_no, role)
  values(12, 3, 1);
insert into class_member(user_no, class_no, role)
  values(13, 3, 1);
insert into class_member(user_no, class_no, role)
  values(14, 3, 1);
insert into class_member(user_no, class_no, role)
  values(15, 3, 1);
insert into class_member(user_no, class_no, role) 
  values(16, 3, 1);
insert into class_member(user_no, class_no, role) 
  values(17, 3, 1);
insert into class_member(user_no, class_no, role) 
  values(18, 3, 1);
insert into class_member(user_no, class_no, role) 
  values(19, 3, 1);
insert into class_member(user_no, class_no, role) 
  values(20, 3, 1);
insert into class_member(user_no, class_no, role) 
  values(21, 1, 0);
insert into class_member(user_no, class_no, role) 
  values(21, 2, 1);
insert into class_member(user_no, class_no, role) 
  values(21, 3, 1);
  
  
-- 과제 입력

insert into assignment(class_no, member_no, title, content, file, start_date, deadline, standard)
  values(1, 1, '짜장면만들기', '춘장잘볶아야해요', '첨부파일', '2020-04-01 23:50:14', '2020-04-06 23:50:14', '많이해오세요');
insert into assignment(class_no, member_no, title, content, file, start_date, deadline, standard)
  values(2, 1, '신선로만들기', '재료의 배치를 잘 두어야 해요', 'a.txt', '2020-04-01 23:50:14', '2020-04-04 23:50:14', '9ood');
insert into assignment(class_no, member_no, title, content, file, start_date, deadline, standard)
  values(3, 11, '디비숙제', '잘해오세요', '첨부파일', '2020-04-01 23:50:14', '2020-04-03 23:50:14', '많이해오세요');
insert into assignment(class_no, member_no, title, content, file, start_date, deadline)
  values(3, 11, '프로토타입', '이쁘게만들기', 'a.txt', '2020-05-01 23:50:14', '2020-05-01 23:50:14');
insert into assignment(class_no, member_no, title, file, start_date, deadline, standard) 
  values(3, 11, '근의공식', 'a.gif', '2020-04-21', '2020-04-23', '유래,기원');
insert into assignment(class_no, member_no, title, content, file, start_date, deadline, standard) 
  values(3, 11, '자바프로그래밍', 'Java로 프로그래밍해오기', 'b.gif', '2020-04-21', '2020-04-22', '객체지향을 얼마나 잘 했나');
insert into assignment(class_no, member_no, title, content, start_date, deadline, standard) 
  values(3, 11, 'DB모델링', 'DB모델링 해오기', '2020-04-21', '2020-04-21', '정규화 정도, 무결성 규칙이 잘 지켜졌는가');
insert into assignment(class_no, member_no, title, content, file, start_date, deadline, standard) 
  values(3, 11, '객체지향', '객체지향 개념 정리해오기', 'd.gif', '2020-04-21', '2020-04-21', '표절 시 0점');
insert into assignment(class_no, member_no, title, content, file, start_date, deadline) 
  values(3, 11, '알고리즘', '알고리즘 문제 풀기', 'e.gif', '2020-04-21', '2020-04-21');
  
-- 과제 제출 입력

insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
  values(2, 1, '짜장면레시피1.pdf', 30, '춘장볶는게 어려워요.', '연습해야죠.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
  values(3, 1, '짜장면레시피2.pdf', 40, '미원을 너무 많이넣었어요.', '네 짜네요.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
  values(4, 1, '짜장면레시피3.pdf', 100, '완벽합니다.', '구라치지마세요.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
  values(5, 1, '짜장면레시피4.pdf', 90, '뭐가 잘못된지모르겠씁니다..', '저도몰라요.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
  values(6, 1, '짜장면레시피5.pdf', 90, '열심히해왔습니다.', '네 그래요.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
  values(7, 1, '짜장면레시피6.pdf', 90, '먹어보세요.', '싫어요.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
  values(8, 1, '짜장면레시피7.pdf', 90, '속옷준비해오세요.', '갈아입기 귀찮아요.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
  values(9, 1, '짜장면레시피8.pdf', 90, '아무노래나일단틀어.', '분위기겁나싸해.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
  values(10, 1, '짜장면레시피9.pdf', 90, '뭐가문제야 saysomething.', '아무노래나일단틀어.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
  values(12, 4, 'c.pdf', 40, '열심히해왔습니다.', 'UI UX가 조금 아쉽네요.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
  values(13, 5, 'f.pdf', 100, '열심히해왔습니다.', '멋져요!');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
  values(14, 6, 'g.doc', 90, '열심히해왔습니다.', '참 잘했어요.');
insert into assignment_submit(member_no, assignment_no, file, score, feedback, create_date) 
  values(15, 7, 'assignment.hwp', 100, '잘했습니다.', '2020-04-23' );  
insert into assignment_submit(member_no, assignment_no, file, content) 
  values(16, 8, 'b.doc', '시간이 빠듯해 힘들었어요'); 
insert into assignment_submit(member_no, assignment_no, file, score, content, create_date) 
  values(17, 3, 'db.exerd', 40, '과제 제출합니다.', '2020-04-23' ); 
insert into assignment_submit(member_no, assignment_no, file, score, feedback, create_date) 
  values(18, 4, 'url.txt', 20, '시간이 부족했나요?', '2020-04-23' ); 
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
  values(19, 3, 'b.pdf', 30, '열심히해왔습니다.', '부족합니다.');

  
-- 질문 입력

insert into question(class_no, member_no, title, content, file, start_date, deadLine)
  values(1, 1, '춘장 잘볶는기준?', '뭘까요?', 'a.txt', '2020-04-01 20:49:32', '2020-04-03 20:49:32');
insert into question(class_no, member_no, title, content, file, start_date, deadLine)
  values(1, 1, '파마생의 비율?', '몇대 몇일까요?', 'b.txt', '2020-04-01 20:49:32', '2020-04-04 20:49:32');
insert into question(class_no, member_no, title, content, file,start_date, deadLine)
  values(1, 1, '미원하고 치킨스톡의 차이?', '10줄이상 적어오세요', 'c.txt', '2020-04-01 20:49:32', '2020-04-05 20:49:32');
insert into question(class_no, member_no, title, content, file,start_date, deadLine)
  values(1, 1, '백짜장과 간짜장의 차이?', '간략하게 적으세요.', 'd.txt', '2020-04-01 20:49:32', '2020-04-07 20:49:32');
insert into question(class_no, member_no, title, file,start_date, deadLine)
  values(1, 1, '동파육의 어원?(객관식)', '중국집.txt', '2020-04-01 20:49:32', '2020-04-08 20:49:32');
insert into question(class_no, question_no, member_no, title, file, deadline, start_date) 
  values(3, 6, '11', '객체지향이란?', '참고.pdf', '2020-4-21', '2020-4-20');  
insert into question(class_no, question_no, member_no, title, deadline, start_date) 
  values(3, 7, '11', '정규화란?', '2020-4-21', '2020-4-20');  
insert into question(class_no, question_no, member_no, title, content, deadline, start_date) 
  values(3, 8, '11', 'HTML 통신규칙이 아닌 것은?', '객관식 문제입니다.', '2020-4-5', '2020-4-1');  
 
  
-- 객관식항목

 insert into multiple(question_no, no, content)
  values(5, 1, '중국');
 insert into multiple(question_no, no, content)
  values(5, 2, '베트남');
 insert into multiple(question_no, no, content)
  values(5, 3, '한국');
 insert into multiple(question_no, no, content)
  values(5, 4, '미국');
 insert into multiple(question_no, no, content)
  values(5, 5, '캐나다');
insert into multiple(multiple_no, question_no, no, content) 
  values(6, 8, 5, 'GET');  
insert into multiple(multiple_no, question_no, no, content) 
  values(7, 8, 4, 'POST');  
insert into multiple(multiple_no, question_no, no, content) 
  values(8, 8, 3, 'TRACE');  
insert into multiple(multiple_no, question_no, no, content) 
  values(9, 8, 2, 'HEAD');  
insert into multiple(multiple_no, question_no, no, content) 
  values(10, 8, 1, 'OVER');  

-- 질문 답변
insert into answer(member_no, question_no, content)
  values(2, 1, '고소한 향이 나야해요');
insert into answer(member_no, question_no, content)
  values(3, 2, '1:1:1입니다.');
insert into answer(member_no, question_no, content)
  values(4, 3, '향과 쓰이는 용도가 다릅니다.');
insert into answer(member_no, question_no, multiple_no)
  values(5, 5, 1);
insert into answer(member_no, question_no, multiple_no)
  values(6, 5, 2);
insert into answer(member_no, question_no, multiple_no)
  values(7, 5, 3);
insert into answer(member_no, question_no, multiple_no)
  values(8, 5, 4);
insert into answer(member_no, question_no, multiple_no)
  values(9, 5, 5);
insert into answer(member_no, question_no, content)
  values(12, 6, '객체 지향 프로그래밍은 컴퓨터 프로그래밍의 패러다임 중 하나이다.');
insert into answer(member_no, question_no, content)
  values(13, 7, '정규화 과정은 각각의 정규형이 되기 위한 조건들을 충족시키는 과정이라고 볼 수 있습니다. ');
insert into answer(member_no, question_no, content)
  values(15, 7, '정규형에는 단계가 있는데, 높은 단계로 갈수록 중복이 적은 릴레이션으로 설계됩니다.');
insert into answer(member_no, question_no, multiple_no)
  values(16, 8, 6);
insert into answer(member_no, question_no, multiple_no) 
  values(17, 8, 7);    
insert into answer(member_no, question_no, multiple_no) 
  values(18, 8, 8);   
insert into answer(member_no, question_no, multiple_no) 
  values(19, 8, 9);   
insert into answer(member_no, question_no, multiple_no) 
  values(20, 8, 10); 

  
-- 쪽지

insert into message(caller_no, receiver_no, content)
 values(2, 3, '안녕하세요');
insert into message(caller_no, receiver_no, content)
 values(3, 4, '진짜배고프다');
insert into message(caller_no, receiver_no, content)
 values(3, 5, '집가고싶다');
insert into message(caller_no, receiver_no, content)
 values(4, 5, '술먹고싶다');
insert into message(caller_no, receiver_no, content)
 values(4, 3, '허어어어ㅠㅠㅠㅠ');
insert into message(caller_no, receiver_no, content)
 values(11, 13, '기억니은드귿리을');
insert into message(caller_no, receiver_no, content)
 values(13, 14, '배가너무부르다.');
insert into message(caller_no, receiver_no, content)
 values(13, 15, '넌 뭐먹었어?');
insert into message(caller_no, receiver_no, content)
 values(14, 15, '난 술먹었엉');
insert into message(caller_no, receiver_no, content)
 values(14, 13, '허허허허엉');
 insert into message(caller_no, receiver_no, content, create_date) 
  values(11, 12, '안녕하세요', '2020-4-20');
insert into message(caller_no, receiver_no, content, create_date) 
  values(12, 11, '안녕', '2020-04-21');
insert into message(caller_no, receiver_no, content, create_date) 
  values(13, 15, '할룽', '2020-04-22');
insert into message(caller_no, receiver_no, content, create_date) 
  values(14, 12, '바이룽', '2020-04-23');
insert into message(caller_no, receiver_no, content, create_date) 
  values(15, 13, '하이', '2020-04-24');
 -- 게시판
 
 insert into board(class_no, title, notice)
  values(1, '학생게시판', 0);
 insert into board(class_no, title, notice)
  values(1, '자료실', 1);
 insert into board(class_no, title, notice)
  values(1, 'Q&A', 0);
   insert into board(class_no, title, notice)
  values(1, '공지사항', 1);
 insert into board(class_no, title, notice)
  values(3, '학생마당', 0);
 insert into board(class_no, title, notice)
  values(3, '자료실', 1);
 insert into board(class_no, title, notice)
  values(3, 'Q&A', 0);
   insert into board(class_no, title, notice)
  values(3, '공지사항', 1);

-- 게시글
  
  insert into post(board_no, member_no, title, content)
    values(1, 1, '강사님 진짜 죄송해요', '석고대죄하겠습니다.');
  insert into post(board_no, member_no, title, content)
    values(1, 1, 'ㅋㅋㅋ 진짜 집가고싶다', 'ㅇㅈ?.');
  insert into post(board_no, member_no, title, content)
    values(1, 1, '코딩잘하는방법은?', '없습니다..');
  insert into post(board_no, member_no, title, content)
    values(2, 1, '수업자료입니다.', '참고하세요.');
  insert into post(board_no, member_no, title, content)
    values(3, 1, '강사님 어케 짜장면만들어요?', '자료참고하세요.');
insert into post(board_no, member_no, title, content)
    values(4, 12, '배가고파요', '밥을먹어야겠어요.');
  insert into post(board_no, member_no, title, content)
    values(4, 13, '배가불러요', '화장실갈게요.');
  insert into post(board_no, member_no, title, content)
    values(4, 14, '모여봐여 우리', '같이코딩해요.');
  insert into post(board_no, member_no, title, content)
    values(4, 15, '너무어려워요', '진짜모르게쒀요.');
  insert into post(board_no, member_no, title, content)
    values(4, 16, '2번문제 답이 뭐예요?', '모르게쒀요.');
  insert into post(board_no, member_no, title, content)
    values(4, 17, '반갑습니다.', 'aaaaab2입니다.');
insert into post(board_no, member_no, title, content, create_date) 
  values(7, 11, '휴강안내합니다', '30일휴강', '2020-4-20');
insert into post(board_no, member_no, title, content, create_date) 
  values(7, 11, '중간고사', '다음주', '2020-4-20');
insert into post(board_no, member_no, title, content, create_date) 
  values(7, 11, '기말고사', '다음달', '2020-4-20');
insert into post(board_no, member_no, title, create_date) 
  values(7, 11, '숙제', '2020-4-20');
insert into post(board_no, member_no, title, content, create_date) 
  values(7, 11, '과제', '3번문제', '2020-4-20');

    
 -- 태그
 
insert into tag(name) values('시즌1');
insert into tag(name) values('시즌2');
insert into tag(name) values('시즌3');
insert into tag(name) values('시즌4');
insert into tag(name) values('시즌5');
insert into tag(name) 
  values('즐겨찾기1');  
insert into tag(name) 
  values('즐겨찾기2');  
insert into tag(name) 
  values('즐겨찾기3');  
insert into tag(name) 
  values('즐겨찾기4');  
insert into tag(name) 
  values('즐겨찾기5');  

-- 질문 태그

insert into question_tag(question_no, tag_no) 
  values(1, '5');  
  insert into question_tag(question_no, tag_no) 
  values(2, '4'); 
  insert into question_tag(question_no, tag_no) 
  values(3, '3'); 
  insert into question_tag(question_no, tag_no) 
  values(4, '2'); 
  insert into question_tag(question_no, tag_no) 
  values(5, '1'); 
    
 -- 클래스 태그
  
insert into class_tag(class_no, tag_no) values(2, 1);
insert into class_tag(class_no, tag_no) values(2, 2);
insert into class_tag(class_no, tag_no) values(1, 3);
insert into class_tag(class_no, tag_no) values(1, 4);
insert into class_tag(class_no, tag_no) values(1, 5);
insert into class_tag(class_no, tag_no) 
  values(3, '1');  
insert into class_tag(class_no, tag_no) 
  values(3, '2');  
insert into class_tag(class_no, tag_no) 
  values(3, '3');  
insert into class_tag(class_no, tag_no) 
  values(3, '4');  
insert into class_tag(class_no, tag_no) 
  values(3, '5');  

-- 과제 태그

insert into assignment_tag(assignment_no, tag_no) values (1, 1);
insert into assignment_tag(assignment_no, tag_no) values (2, 2);
insert into assignment_tag(assignment_no, tag_no) values (1, 3);
insert into assignment_tag(assignment_no, tag_no) values (1, 4);
insert into assignment_tag(assignment_no, tag_no) values (1, 5);


-- 게시글 태그

insert into board_tag(post_no, tag_no) values (1, 1);
insert into board_tag(post_no, tag_no) values (2, 2);
insert into board_tag(post_no, tag_no) values (3, 3);
insert into board_tag(post_no, tag_no) values (4, 4);
insert into board_tag(post_no, tag_no) values (5, 5);
insert into board_tag(post_no, tag_no) 
  values(1, '5');  
insert into board_tag(post_no, tag_no) 
  values(2, '4');  
insert into board_tag(post_no, tag_no) 
  values(3, '3');  
insert into board_tag(post_no, tag_no) 
  values(4, '2');  
insert into board_tag(post_no, tag_no) 
  values(5, '1');  

