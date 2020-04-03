-- 학생 데이터 
insert into user(email, name, password, tel, major, introduce, login_method)
  values('linus@kakao.com', '리누스', 'sdofijn', '010-1234-5678', '컴퓨터공학', '노잼', 1);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('koreano@gmail.com', '세종대왕', 'ffdv', '010-1231-1231', '국어국문학', '나랏말싸미', 2);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('james@kako.com', 'James', 'asdas', '010-4243-7567', '영어영문학', 'hello~!', 1);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('asdwd395@gmail.com', '이타치', 'sdf!asd', '010-3466-4454', '일어일문학', '아리가또', 2);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('sdwdw@naver.com', '클레오파트라', '123123', '010-1233-5657', '패션', '청청이 어울림', 0);
  
-- 클래스 생성

insert into class(name, description, room, class_code)
  values('롤수업', '다이아찍기', '강의실1', 'sdiuhfw');
insert into class(name, description,  class_code)
  values('쿠킹수업', '혼밥 마스터되기', 'dsdl2d2');
insert into class(name, description, room, class_code)
  values('자바수업', '자바스프링', '강의실2', 'dsdl2d2');
insert into class(name, description, room, class_code)
  values('게임만들기 수업', '유니티엔진으로 만들기', '강의실3', 'dsdl2d2');
insert into class(name, class_code)
  values('자수 수업', 'dsdl2d2');
  
-- 참여멤버생성

insert into class_member(user_no, class_no, role)
  values(1, 2, 1);
insert into class_member(user_no, class_no, role)
  values(2, 2, 1);
insert into class_member(user_no, class_no, role)
  values(3, 2, 0);
insert into class_member(user_no, class_no, role)
  values(4, 2, 0);
insert into class_member(user_no, class_no, role)
  values(5, 2, 1);
  
-- 과제 입력

insert into assignment(class_no, member_no, title, content, file, deadline, standard)
  values(2, 4, '자반콩 만들기', '잘해오세요', '요리법.pdf', '2020-02-21 23:50:14', '얼마나 맛있게 했나 평가');
insert into assignment(class_no, member_no, title, content, file, deadline, standard)
  values(2, 4, '오징어채 만들기', '맛있게 만들기', '요리방법.txt', '2020-03-31 23:50:14', '얼마나 맛있게 했나 평가');
insert into assignment(class_no, member_no, title, content, file, deadline, standard)
  values(2, 4, '김치찌개 만들기', '돼지고기, 참치 등 자유롭게 만들기', '방법.txt', '2020-04-02 23:50:14', '얼마나 맛있게 했나 평가');
insert into assignment(class_no, member_no, title, deadline)
  values(2, 5, '만둣국 만들기', '2020-04-01 23:50:14');
insert into assignment(class_no, member_no, title, deadline)
  values(2, 5, '오믈렛 만들기', '2020-04-01 23:50:14');
  
-- 과제 제출 입력

insert into assignment_submmit(member_no, assignment_no, file, score, content, feedback)
  values(1, 1, 'b.pdf', 30, '열심히해왔습니다.', '잘못해왔습니다.');
insert into assignment_submmit(member_no, assignment_no, file, score, content, feedback)
  values(2, 2, 'c.pdf', 40, '열심히해왔습니다.', '잘못해왔습니다.');
insert into assignment_submmit(member_no, assignment_no, file, score, content, feedback)
  values(2, 3, 'f.pdf', 100, '열심히해왔습니다.', 'very good');
insert into assignment_submmit(member_no, assignment_no, file, score, content, feedback)
  values(1, 4, 'g.pdf', 90, '열심히해왔습니다.', '잘했어요~!.');
insert into assignment_submmit(member_no, assignment_no, file, score, content, feedback)
  values(3, 5, 'g.pdf', 90, '열심히해왔습니다.', '마스터피스입니다');
  
-- 질문 입력

insert into question(member_no, title, content, file, deadLine)
  values(4, '단답형-수업어떤가요?', '자유롭게 의견 보내주세요', '참고.txt', '2020-04-01 20:49:32');
insert into question(member_no, title, content, file, deadLine)
  values(4, '[단답]-만들고 싶은 음식은?', '수업 중 만들고 싶은 음식들 알려주세요', '요리종류예시.pdf', '2020-04-01 20:49:32');
insert into question(member_no, title, content, deadLine)
  values(5, '원하는 수업시간은?', '다섯가지 선택지중 골라주세요', '2020-04-01 20:49:32');
insert into question(member_no, title, content, file, deadLine)
  values(5, '수업 만족도 조사', '자유롭게 선택해주세요', '수업 내용.pdf', '2020-04-01 20:49:32');
insert into question(member_no, title, content, deadLine)
  values(5, '내일 무얼 만들까요?', '골라주세요', '2020-04-01 20:49:32');
  
-- 객관식항목

insert into multiple(question_no, no, content)
  values(3, 1, '9시');
insert into multiple(question_no, no, content)
  values(3, 2, '9시반');
insert into multiple(question_no, no, content)
  values(3, 1, '10시');
insert into multiple(question_no, no, content)
  values(4, 1, '만족');
insert into multiple(question_no, no, content)
  values(4, 2, '보통');
insert into multiple(question_no, no, content)
  values(4, 3, '불만족');
insert into multiple(question_no, no, content)
  values(5, 1, '김치찌개');
insert into multiple(question_no, no, content)
  values(5, 2, '된장찌개');
  
-- 질문 답변
insert into answer(member_no, question_no, content)
  values(1, 1, '수업 너무 재밌어요');
insert into answer(member_no, question_no, content)
  values(2, 2, '짬뽕이요~!');
insert into answer(member_no, question_no, multiple_no)
  values(1, 3, 3);
insert into answer(member_no, question_no, multiple_no)
  values(2, 4, 1);
insert into answer(member_no, question_no, multiple_no)
  values(3, 5, 2);
  
-- 쪽지

insert into message(caller_no, receiver_no, content)
 values(1, 4, '수업 너무 유익해용');
insert into message(caller_no, receiver_no, content)
 values(4, 5, '수업 잘 되가나요?');
insert into message(caller_no, receiver_no, content)
 values(3, 2, '집가고싶다');
insert into message(caller_no, receiver_no, content)
 values(2, 1, '술먹고싶다');
insert into message(caller_no, receiver_no, content)
 values(5, 4, '네~ 그럼요');

-- 게시판 입력
insert into board(class_no, title, notice)
  values(2, '공지', 1);
insert into board(class_no, title, notice)
  values(2, '자료실', 1);
insert into board(class_no, title, notice)
  values(2, 'Q&A', 0);
insert into board(class_no, title, notice)
  values(2, '1조', 0);
insert into board(class_no, title, notice)
  values(2, '2조', 0);

-- 게시글 입력
insert into post(board_no, member_no, title, content)
    values(3, 1, '선생님 질문있습니다!', '찌개 끓일때 어떤 간장 써야 하나요?');
insert into post(board_no, member_no, title, content)
    values(2, 4, '수업자료 받아가세요~!', '음식입니다.');
insert into post(board_no, member_no, title, content)
    values(1, 5, '공지사항입니다.', '내일 수업 쉽니다.');
insert into post(board_no, member_no, title, content)
    values(5, 2, '여러분 이거 어때요?', '우리 내일 다같이 회식ㄱ?');
insert into post(board_no, member_no, title, content)
    values(4, 3, '1조 홧팅', '다같이 힘내봐요');
  
 
-- 클래스 태그 입력
insert into class_tag(class_no, tag_no) values(2, 1);
insert into class_tag(class_no, tag_no) values(2, 2);
insert into class_tag(class_no, tag_no) values(2, 3);
insert into class_tag(class_no, tag_no) values(2, 4);
insert into class_tag(class_no, tag_no) values(2, 5);
  
-- 태그 입력
insert into tag(name) values('1주차');
insert into tag(name) values('2주차');
insert into tag(name) values('3주차');
insert into tag(name) values('중간평가');
insert into tag(name) values('기말평가');

-- 과제 태그 입력
insert into assignment_tag(assignment_no, tag_no) values (1, 1);
insert into assignment_tag(assignment_no, tag_no) values (2, 2);
insert into assignment_tag(assignment_no, tag_no) values (3, 3);
insert into assignment_tag(assignment_no, tag_no) values (4, 4);
insert into assignment_tag(assignment_no, tag_no) values (5, 5);

-- 질문 태그 입력
insert into question_tag(question_no, tag_no)
  values(1, 1);
insert into question_tag(question_no, tag_no)
  values(2, 2);
insert into question_tag(question_no, tag_no)
  values(3, 3);
insert into question_tag(question_no, tag_no)
  values(2, 4);
insert into question_tag(question_no, tag_no)
  values(2, 5);
  
-- 게시판 태그 입력
insert into board_tag(post_no, tag_no) values (1, 1);
insert into board_tag(post_no, tag_no) values (2, 2);
insert into board_tag(post_no, tag_no) values (3, 3);
insert into board_tag(post_no, tag_no) values (4, 4);
insert into board_tag(post_no, tag_no) values (5, 5);