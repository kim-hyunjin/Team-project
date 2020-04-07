-- 학생 데이터 
insert into user(email, name, password, tel, major, introduce, login_method)
  values('qwertrtt9395@naver.com', '신지섭', 1111, 010-1234-5678, '하하하', '하기싫어요', 1);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('wltjq2006@naver.com', '가야', 1111, 010-5412-4471, '잘부탁드려요', '나두여', 1);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('11541_1@naver.com', '고기', 1111, 010-4415-5574, '이제시작입니다.', '그렇니까여', 1);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('qwqwexzxc395@naver.com', '가지마', 1111, 010-7415-5412, '감사합니다.', '하기싫어요', 0);
insert into user(email, name, password, tel, major, introduce, login_method)
  values('dsdccc@daum.com', '오징어', 1111, 010-8742-4512, '나도몰라요', '하기싫어요', 0);
  
-- 클래스 생성

insert into class(name, description, room, class_code)
  values('비트캠프', '자바만들기', '강의실2', 'sdskl2d2');
insert into class(name, description, room, class_code)
  values('쌍용컴퓨터학원', '프로토타입만들기', '강의실1', 'dsdw2kl2d2');
insert into class(name, description, room, class_code)
  values('롤아카데미', '다이아만들기', '강의실2', 'sqwed2d2');
insert into class(name, description, room, class_code)
  values('돌아온아카데미', 'HTML만들기', '강의실4', 'sdstggkl2d2');
insert into class(name, description, room, class_code)
  values('그린컴퓨터학원', 'SQL응용', '강의실3', 'dfdfskl2d2');

  
  -- 참여멤버생성

insert into class_member(user_no, class_no, role)
  values(1, 1, 1);
insert into class_member(user_no, class_no, role)
  values(2, 1, 1);
insert into class_member(user_no, class_no, role)
  values(3, 1, 1);
insert into class_member(user_no, class_no, role)
  values(4, 1, 0);
insert into class_member(user_no, class_no, role)
  values(5, 1, 1);
  
-- 과제 입력

insert into assignment(class_no, member_no, title, content, file, deadline, standard)
  values(1, 4, '디비숙제', '잘해오세요', '첨부파일', '2020-04-01 23:50:14', '많이해오세요');
insert into assignment(class_no, member_no, title, content, file, deadline, standard)
  values(1, 4, '프로토타입', '이쁘게만들기', 'a.txt', '2020-04-01 23:50:14', '9ood');
  
-- 과제 제출 입력

insert into assignment_submmit(member_no, assignment_no, file, score, content, feedback)
  values(1, 1, 'b.pdf', 30, '열심히해왔습니다.', '잘못해왔습니다.');
insert into assignment_submmit(member_no, assignment_no, file, score, content, feedback)
  values(3, 1, 'c.pdf', 40, '열심히해왔습니다.', '잘못해왔습니다.');
insert into assignment_submmit(member_no, assignment_no, file, score, content, feedback)
  values(4, 1, 'f.pdf', 100, '열심히해왔습니다.', '잘못해왔습니다.');
insert into assignment_submmit(member_no, assignment_no, file, score, content, feedback)
  values(6, 1, 'g.pdf', 90, '열심히해왔습니다.', '잘못해왔습니다.');
  
-- 질문 입력

insert into question(member_no, title, content, file, deadLine)
  values(4, '가렌 궁쓰는방법', '궁쓰면 마체가 붙습니다.', '가렌공유법.txt', '2020-04-01 20:49:32');
insert into question(member_no, title, content, file, deadLine)
  values(4, '람머스 궁쓰는방법', '구른다! 방법.', '람머스방법.txt', '2020-04-01 20:49:32');
insert into question(member_no, title, content, file, deadLine)
  values(4, '아무무 궁쓰는방법', '룬추천.', '아무무궁쓰는방법.txt', '2020-04-01 20:49:32');
insert into question(member_no, title, content, file, deadLine)
  values(4, '티모 궁쓰는방법', '정글도는방법.', '티모공략.txt', '2020-04-01 20:49:32');
insert into question(member_no, title, content, file, deadLine)
  values(4, '베인 궁쓰는방법', '하면 안되는 이유.', '베인하면 안되는이유.txt', '2020-04-01 20:49:32');
insert into question(member_no, title, file, deadLine)
  values(4, '헤카림 궁쓰는방법', '아이번궁쓰는방법.txt', '2020-04-01 20:49:32');
  
-- 객관식항목

 insert into multiple(question_no, no, content)
  values(6, 1, '궁쿨타임 줄어들었어요');
 insert into multiple(question_no, no, content)
  values(6, 1, 'q쿨타임 줄어들었어요');
 insert into multiple(question_no, no, content)
  values(6, 1, 'w쿨타임 줄어들었어요');
 insert into multiple(question_no, no, content)
  values(6, 1, '패시브시간 줄어들었어요');
  
-- 질문 답변
insert into answer(member_no, question_no, content)
  values(1, 1, '궁쓰고 캐릭클릭해야해요');
insert into answer(member_no, question_no, content)
  values(3, 2, '궁쓰고 캐릭클릭해야해요');
insert into answer(member_no, question_no, content)
  values(5, 3, '궁쓰고 캐릭클릭해야해요');
insert into answer(member_no, question_no, multiple_no)
  values(6, 6, 1);
  
-- 쪽지

insert into message(caller_no, receiver_no, content)
 values(1, 3, '기억니은드귿리을');
insert into message(caller_no, receiver_no, content)
 values(3, 4, '배가너무부르다.');
insert into message(caller_no, receiver_no, content)
 values(3, 5, '넌 뭐먹었어?');
insert into message(caller_no, receiver_no, content)
 values(4, 5, '난 술먹었엉');
insert into message(caller_no, receiver_no, content)
 values(4, 3, '허허허허엉');
 
 -- 게시판
 
 insert into board(class_no, title, notice)
  values(1, '학생마당', 0);
 insert into board(class_no, title, notice)
  values(1, '자료실', 1);
 insert into board(class_no, title, notice)
  values(1, 'Q&A', 0);
 insert into board(class_no, title, notice)
  values(1, '진짜모르게쒀요', 0);

-- 게시글
  
  insert into post(board_no, member_no, title, content)
    values(1, 1, '배가고파요', '밥을먹어야겠어요.');
  insert into post(board_no, member_no, title, content)
    values(2, 1, '배가불러요', '화장실갈게요.');
  insert into post(board_no, member_no, title, content)
    values(3, 1, '모여봐여 우리', '같이코딩해요.');
  insert into post(board_no, member_no, title, content)
    values(4, 1, '너무어려워요', '진짜모르게쒀요.');
  insert into post(board_no, member_no, title, content)
    values(5, 1, '2번문제 답이 뭐예요?', '모르게쒀요.');
  insert into post(board_no, member_no, title, content)
    values(4, 5, '1번 클래스 코드가 어떻게 되나요?', 'aaaaab2입니다.');
    
 -- 태그
 
insert into tag(name) values('시즌1');
insert into tag(name) values('시즌2');
insert into tag(name) values('시즌3');
insert into tag(name) values('시즌4');
insert into tag(name) values('시즌5');

-- 질문 

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
    
 -- 클래스
  
insert into class_tag(class_no, tag_no) values(2, 1);
insert into class_tag(class_no, tag_no) values(2, 2);
insert into class_tag(class_no, tag_no) values(1, 3);
insert into class_tag(class_no, tag_no) values(1, 4);
insert into class_tag(class_no, tag_no) values(1, 5);

-- 과제

insert into assignment_tag(assignment_no, tag_no) values (1, 1);
insert into assignment_tag(assignment_no, tag_no) values (2, 2);
insert into assignment_tag(assignment_no, tag_no) values (1, 3);
insert into assignment_tag(assignment_no, tag_no) values (1, 4);
insert into assignment_tag(assignment_no, tag_no) values (1, 5);

-- 보드

insert into board_tag(post_no, tag_no) values (1, 1);
insert into board_tag(post_no, tag_no) values (2, 2);
insert into board_tag(post_no, tag_no) values (3, 3);
insert into board_tag(post_no, tag_no) values (4, 4);
insert into board_tag(post_no, tag_no) values (5, 5);
