-- 학생 데이터 
insert into user(user_no, email, name, password, tel, major, introduce, login_method, alterkey, create_date)
values(1, 'teacherkim@gmail.com', '김민성교수', password('1111'), '010-1111-1111', '국제통상학과', '국제무역 강의를 맡은 김민성 교수입니다. 반갑습니다.', 0, 'Y', '2020-01-01');
insert into user(user_no, email, name, password, tel, major, introduce, login_method, alterkey, create_date)
values(2, 'lee02@naver.com', '이주희', password('1111'), '010-2222-2222', '국제통상학과', '20학번 신입생 이주희라고 합니다. 반갑습니다!', 0, 'Y', '2020-02-10');
insert into user(user_no, email, name, password, tel, major, introduce, login_method, alterkey, create_date)
values(3, 'park03@daum.com', '박진우', password('1111'), '010-3333-3333', '국제통상학과', '18학번 박진우 입니다. 복학생이에요. 잘부탁드려요.', 0, 'Y', '2020-02-14');
insert into user(user_no, email, name, password, tel, major, introduce, login_method, alterkey, create_date)
values(4, 'kyu04@nate.com', '한규림', password('1111'), '010-4444-4444', '국어국문학과', '복수전공입니다. 반가워요!', 0, 'Y', '2020-02-20');
insert into user(user_no, email, name, password, tel, major, introduce, login_method, alterkey, create_date)
values(5, 'ju05@kakao.com', '주호성', password('1111'), '010-5555-5555', '국제통상학과', '안녕하세요. 주호성이라고 합니다.', 0, 'Y', '2020-02-22');
insert into user(user_no, email, name, password, tel, major, introduce, login_method, alterkey, create_date)
  values(6, 'asdzxc9395@naver.com', '채진호', password('1111'), '010-1234-5687', '조리과', '안녕하세요. 반갑습니다.', 0, 'Y', '2019-05-23');
insert into user(user_no, email, name, password, tel, major, introduce, login_method, alterkey, create_date)
  values(7, 'bgfd235@gmail.com', '김덕배', password('1111'), '010-1444-5512', '스포츠학과', '잘부탁드립니다.', 0, 'Y', '2020-03-17');
insert into user(user_no, email, name, password, tel, major, introduce, login_method, alterkey, create_date)
  values(8, 'dfjgh3495@daum.com', '김철수', password('1111'), '010-4312-6542', '경영학과', '', 0, 'Y', '2019-02-12');
insert into user(user_no, email, name, password, tel, major, introduce, login_method, alterkey, create_date)
  values(9, '383zxc@kakao.com', '순이', password('1111'), '010-5435-4544', '농학과', '만나서 반가워요.', 0, 'Y', '2020-05-26');
insert into user(user_no, email, name, password, tel, major, introduce, login_method, alterkey, create_date)
  values(10, '2374d9395@naver.com', '홍길동', password('1111'), '010-6787-6787', '사회학과', '모두 즐거운 하루~', 0, 'Y', '2019-12-20');
insert into user(user_no, email, name, password, tel, major, introduce, login_method, alterkey, create_date)
values(11,'01049236753a@gmail.com', '홍수진교수님', password('1111'), '010-4923-6753', '국어국문학과', '잘부탁드립니다!', 0, 'Y', '2020-05-14');
insert into user(user_no, email, name, password, tel, major, introduce, login_method, alterkey, create_date)
values(12,'asdzx@naver.com', '권혁', password('1111'), '010-8521-4125', '영어영문학과', '영어잘하고싶어요!', 1, 'Y', '2020-05-25');
insert into user(user_no,email, name, password, tel, major, introduce, login_method, alterkey, create_date)
values(13, 'guswlsdlWkd@naver.com', '감수석', password('1111'), '010-7777-7758', '컴퓨터과학과', '캐리해줄게요~~', 1, 'Y', '2020-06-01');
insert into user(user_no, email, name, password, tel, major, introduce, login_method, alterkey, create_date)
values(14, 'tjdwns123', '이준수', password('1111'), '010-5245-2422', '기계공학과', '같이로봇만들어요', 1, 'Y', '2020-05-28');
insert into user(user_no,email, name, password, tel, major, introduce, login_method, alterkey, create_date)
values(15, 'sdwdw@test.com', '이지은', password('1111'), '010-7482-1278', '방송연애학과', '잘부탁드립니다', 1, 'Y', '2020-06-03');  
  
-- 클래스 생성
insert into class(class_no, name, description, room, class_code)
  values(1, '국제무역', '국제 무역의 정의와 이론', '1', 'trade1');
insert into class(class_no, name, description, room, class_code, create_date, color)
  values(2, '글쓰기 수업', '함께 문학을 공부해봐요', '', 'abcdefg', '2020-05-23', '#03fca5');
insert into class(class_no, name, description, room, class_code, create_date)
values(3, '논리회로', '디지털 회로 기초', '강의실2', 'qwer123123', '2020-05-28');

-- 참여멤버생성
insert into class_member(member_no, user_no, class_no, role)
values(1, 1, 1, 0);
insert into class_member(member_no, user_no, class_no, role)
values(2, 2, 1, 1);
insert into class_member(member_no, user_no, class_no, role)
values(3, 3, 1, 1);
insert into class_member(member_no, user_no, class_no, role)
values(4, 4, 1, 1);
insert into class_member(member_no, user_no, class_no, role)
values(5, 5, 1, 1);
insert into class_member(member_no, user_no, class_no, role)
  values(6, 6, 2, 0);
insert into class_member(member_no, user_no, class_no, role)
  values(7, 7, 2, 1);
insert into class_member(member_no, user_no, class_no, role)
  values(8, 8, 2, 1);
insert into class_member(member_no, user_no, class_no, role)
  values(9, 9, 2, 1);
insert into class_member(member_no, user_no, class_no, role)
  values(10, 10, 2, 1);
insert into class_member(member_no, user_no, class_no, role)
values(11, 11, 3, 0);
insert into class_member(member_no, user_no, class_no, role)
values(12, 12, 3, 1);
insert into class_member(member_no, user_no, class_no, role)
values(13, 13, 3, 1);
insert into class_member(member_no, user_no, class_no, role)
values(14, 14, 3, 1);
insert into class_member(member_no, user_no, class_no, role)
values(15, 15, 3, 1);

-- 과제 입력
insert into assignment(assignment_no, class_no, member_no, title, content, file, start_date, deadline, standard)
values(1, 1, 1, '국제무역의 정의', '국제무역이란?', '국제무역.txt', '2020-06-01 18:00:00', '2020-06-03 23:59:59', '정의에 대한 이해와 해석');
insert into assignment(assignment_no, class_no, member_no, title, content, file, start_date, deadline, standard)
values(2, 1, 1, '해상무역이란?', '해상운송이란?', '해상운송.txt', '2020-06-04 18:00:00', '2020-06-05 23:59:59', '해상운송에 대한 이해');
insert into assignment(assignment_no, class_no, member_no, title, content, file, start_date, deadline, standard)
values(3, 1, 1, '항공무역이란?', '항공운송이란?', '항공운송.txt', '2020-06-03 18:00:00', '2020-06-08 23:59:59', '항공운송에 대한 이해');

insert into assignment(assignment_no, class_no, member_no, title, content, start_date, deadline, standard)
  values(4, 2, 6, '개화기 시대 문학작품 분석하기', '시대상황과 함께 작가를 특정해서 깊이 있게 분석해오세요', '2020-04-01 23:50:14', '2020-04-06 23:50:14', '완전한 정답은 없습니다. 자신만의 관점이 드러날 수록 좋습니다.');
insert into assignment(assignment_no, class_no, member_no, title, content, start_date, deadline, standard)
  values(5, 2, 6, '함민복 시인의 작품 소감문 작성하기', '함민복 시인의 작품 하나를 골라 소감문을 페이지 5장 내외로 작성해오세요.', '2020-06-01 00:00:00', '2020-06-10 00:00:00', '독창적인 생각을 중점으로 보겠습니다.');
insert into assignment(assignment_no, class_no, member_no, title, content, start_date, deadline, standard)
  values(6, 2, 6, '시 1편', '평가는 없습니다. 자유롭게 작품을 만들어보세요. 함께 작품을 공유하며 피드백해봅시다.', '2020-04-01 23:50:14', '2020-04-03 23:50:14', '평가는 없습니다.');
  
insert into assignment(assignment_no, class_no, member_no, title, content, start_date, deadline, standard)
values(7, 3, 11, '원하는 게이트회로에 대해 서술 하시오', '100자 이내로 작성 하세요',  '2020-05-10 10:00:05', '2020-05-18 23:59:59', '자유롭게 작성하세요');
insert into assignment(assignment_no, class_no, member_no, title, content,  start_date, deadline, standard)
values(8, 3, 11, '부울대수와 논리 연산 방법에 서술 하시오', '50자 이내로 작성 하세요', '2020-05-19 13:00:00', '2020-05-25 23:59:59', '자유롭게 작성하세요');
insert into assignment(assignment_no, class_no, member_no, title, content, start_date, deadline, standard)
values(9, 3, 11, '수체계(자연수)에 대해 서술 하시오', '100자 이내로 작성 하세요', '2020-05-29 13:00:00', '2020-06-05 23:59:59', '자유롭게 작성하세요');

-- 과제 제출 입력
-- 1번 과제
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
values(2, 1, '국제무역의 정의_이주희.pdf', 100, '국제 무역(國際貿易)은 국가 사이에 일어나는 자본, 상품, 용역 등의 상거래 행위를 말합니다.', '과제를 잘 이해했네요. 좋은 답변이었습니다.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
values(3, 1, '국제무역의 정의_박진우.pdf', 85, '국제적으로 상품을 거래하는 행위입니다.', '좋은 답변이었습니다. 전반적으로 잘 이해하고 있네요.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
values(4, 1, '국제무역의 정의_한규림.pdf', 80, '상품을 거래하고 교환하는 행위입니다.', '조금 아쉬운 답변입니다. 정의에 대한 이해가 조금 부족합니다.');

-- 2번 과제
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
values(2, 2, '해상운송이란_이주희.pdf', 95, '상업적 목적하에 있는 화물과 여객을 운송하는 것을 말합니다.', '과제를 잘 이해했네요.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
values(3, 2, '해상운송이란_박진우.pdf', 80, '화물과 여객을 운송하는 것을 말합니다.', '좋은 답변이었습니다. 조금 아쉬운 답변이었습니다.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
values(5, 2, '해상운송이란_주호성.pdf', 60, '해상으로 운송하는 것을 말합니다.', '과제에 대한 이해도가 떨어집니다.');

-- 3번 과제
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
values(2, 3, '항공운송이란_이주희.pdf', 95, '항공화물운송은 항공기에 적재되는 승객의 수화물과 우편물을 제외한 항공화물운송장(AWB)에
에 의해 운송되는 화물의 운송을 말합니다.', '과제를 잘 이해했네요. 무역에 대한 이해도가 높습니다.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
values(3, 3, '항공운송이란_박진우.pdf', 85, '항공기에 적재되는 물품을 가지고 운송하는 것을 말합니다.', '좋은 답변이었습니다. 해상무역보다는 이해도가 좋네요.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
values(4, 3, '항공운송이란_한규림.pdf', 90, '항공기를 통해 AWB에 의해 운송되는 화물운송을 말합니다.', '이해도가 많이 높아졌네요.');
insert into assignment_submit(member_no, assignment_no, file, score, content, feedback)
values(5, 3, '항공운송이란_주호성.pdf', 80, '항공기를 통해 물품을 운송하는 것을 말합니다.', '지난 과제보다 많이 발전한 모습이 보이네요.');

insert into assignment_submit(assignment_no, member_no, file, score, content, feedback)
  values(4, 7, '개화기 시대 문학작품 분석_김덕배.hwp', 90, '과제 제출합니다.', '좋습니다. 글의 논리적인 흐름이 깔끔하네요.');
insert into assignment_submit(assignment_no, member_no, file, score, content, feedback)
  values(4, 8, '개화기 시대 문학작품 분석_김철수.hwp', 50, '', '조금은 아쉽네요. 기존의 분석을 답습하고 있습니다.');
insert into assignment_submit(assignment_no, member_no, file, score, content, feedback)
  values(4, 9, '개화기 시대 문학작품 분석_순이.hwp', 100, '과제 파일 제출합니다.', '완벽합니다. 자신만의 관점이 매우 독창적이네요.');
  
insert into assignment_submit(assignment_no, member_no, file, score, content, feedback)
  values(5, 7, '그날나는슬픔도배불렀다_소감문_김덕배.hwp', 90, '평상시 좋아하던 시인이라 이번 과제가 재미있었습니다.', '시인에 대한 애정이 느껴졌네요. 소감문도 자신만의 관점이 잘 드러나 좋았습니다.');
insert into assignment_submit(assignment_no, member_no, file, score, content, feedback)
  values(5, 9, '서울역 그 식당_소감문_김철수.hwp', 60, '열심히해왔습니다.', '잘했습니다. 하지만 조금 더 자신의 생각을 풀어내었으면 좋았을 것 같네요.');
insert into assignment_submit(assignment_no, member_no, file, score, content, feedback)
  values(5, 10, '긍정적인 밥_소감문_홍길동.hwp', 50, '', '고생하셨습니다. 하지만 분량이 아쉽네요.');
  
insert into assignment_submit(assignment_no, member_no, file)
  values(6, 7, '개나리_김덕배.hwp');
insert into assignment_submit(assignment_no, member_no, file)
  values(6, 8, '올리브_김철수.hwp');
insert into assignment_submit(assignment_no, member_no, file)
  values(6, 9, '나는_순이.hwp');
insert into assignment_submit(assignment_no, member_no, file)
  values(6, 10, '동해번쩍_홍길동.hwp');
  
insert into assignment_submit(assignment_no, member_no, file, score)
values(7, 12, 'AND게이트에 대하여_권혁.pdf', 70);
insert into assignment_submit(assignment_no, member_no, file, score, content, feedback)
values(7, 13, 'OR게이트에 대하여_감수석.pdf', 60, '다른게이트도 조사해야하나요?', '아닙니다 한 가지만 해주세요.');
insert into assignment_submit(assignment_no, member_no, file, score,  feedback)
values(7, 15, 'AND와NAND게이트의 차이점_이지은.pdf', 100, '하나를 알려주면 열을 해결하셨네요. 아주 잘하셨어요');

insert into assignment_submit(assignment_no, member_no, file, score)
values(8, 13, '부울대수와 논리연상방법에 대하여_감수석.pdf', 80);
insert into assignment_submit(assignment_no, member_no, file, score)
values(8, 14, '부울대수 연산 방법에 대하여_이준수.pdf', 80);
insert into assignment_submit(assignment_no, member_no, file, score)
values(8, 15, '부울대수와 논리연상방법에 대하여_이지은.pdf', 90);

insert into assignment_submit(assignment_no, member_no, file, score)
values(9, 12, '수 체계에 대하여_권혁.pdf', 60);
insert into assignment_submit(assignment_no, member_no, file, score, feedback)
values(9, 13, '수 체계(자연수)_감수석.pdf', 70, '수 체계(자연수)');
insert into assignment_submit(assignment_no, member_no, file, score, feedback)
values(9, 14, '수 체계(자연수)_이준수.pdf', 50, '더욱 조사해서 작성해주세요');
insert into assignment_submit(assignment_no, member_no, file, score, content, feedback)
values(9, 15, '수 체계에 대하여_이지은.pdf', 100, '한번 봐주세요', '아주 잘하셨어요');

-- 질문 입력
insert into question(question_no, class_no, member_no, title, start_date, deadLine)
values(1, 1, 1, '다음 중 해상운송의 이점이 아닌 것은?', '2020-06-06 18:00:00', '2020-06-07 23:59:59');
insert into question(question_no, class_no, member_no, title, start_date, deadLine)
values(2, 1, 1, '다음 중 항공운송의 이점이 아닌 것은?', '2020-06-09 18:00:00', '2020-06-10 23:59:59');
insert into question(question_no, class_no, member_no, title, start_date, deadLine)
values(3, 1, 1, '다음 중 선적서류가 아닌 것은?', '2020-06-13 18:00:00', '2020-06-14 23:59:59');
insert into question(question_no, class_no, member_no, title, content, file, start_date, deadLine)
  values(4, 2, 6, '속담과 한자성어 문제', '속담과 한자성어의 뜻이 가장 비슷한 것은?', '', '2020-05-30 20:49:32', '2020-06-04 20:49:32');
insert into question(question_no, class_no, member_no, title, content, file, start_date, deadLine)
  values(5, 2, 6, '올바른 표기형태는?', '어제 보니까 동생이 참 잘생겼대/잘생겼데 이 중 올바른 표기형태를 고르고, 이유를 설명해보세요', '', '2020-05-25 20:49:32', '2020-06-12 20:49:32');
insert into question(question_no, class_no, member_no, title, content, file,start_date, deadLine)
  values(6, 2, 6, '다음 주 오프라인 모임 후 저녁식사 어떠세요?', 'Yes or No로 답하시면 돼요', '', '2020-06-01 20:49:32', '2020-06-05 00:00:00');
insert into question(question_no, class_no, member_no, title, content, start_date, deadLine)
values(7, 3, 11, '논리 게이트', '다음주 논리 게이트가 아닌 것은?',  '2020-05-01 10:00:00', '2020-05-10 23:59:59');
insert into question(question_no, class_no, member_no, title, content, start_date, deadLine)
values(8, 3, 11, '수 체계', '수 체계가 아닌 것은?', '2020-05-12 11:00:00', '2020-05-15 23:59:59');
insert into question(question_no, class_no, member_no, title, content, start_date, deadLine)
values(9, 3, 11, '트랜지스터', '트랜지스터를  설명 하시오.', '2020-05-28 09:00:00', '2020-06-05 23:59:59');

-- 객관식항목
-- 1번 질문
insert into multiple(multiple_no, question_no, no, content)
values(1, 1, 1, '화물 단위당 저렴한 운임');
insert into multiple(multiple_no, question_no, no, content)
values(2, 1, 2, '다양한 화물 취급');
insert into multiple(multiple_no, question_no, no, content)
values(3, 1, 3, '운송로의 자유도');
insert into multiple(multiple_no, question_no, no, content)
values(4, 1, 4, '보험료가 높다');
insert into multiple(multiple_no, question_no, no, content)
values(5, 1, 5, '일관 하역작업이 가능');

-- 2번 질문
insert into multiple(multiple_no, question_no, no, content)
values(6, 2, 1, '신속정시성');
insert into multiple(multiple_no, question_no, no, content)
values(7, 2, 2, '중량과 용적이 제한된다');
insert into multiple(multiple_no, question_no, no, content)
values(8, 2, 3, '비용이 절감된다');
insert into multiple(multiple_no, question_no, no, content)
values(9, 2, 4, '긴급을 요하는 화물 운송에 적합하다');
insert into multiple(multiple_no, question_no, no, content)
values(10, 2, 5, '안정성');

-- 3번 질문
insert into multiple(multiple_no, question_no, no, content)
values(11, 3, 1, '선하증권');
insert into multiple(multiple_no, question_no, no, content)
values(12, 3, 2, '상업송장');
insert into multiple(multiple_no, question_no, no, content)
values(13, 3, 3, '신용장');
insert into multiple(multiple_no, question_no, no, content)
values(14, 3, 4, '화물선취보증서');
insert into multiple(multiple_no, question_no, no, content)
values(15, 3, 5, '포장명세서');
 insert into multiple(multiple_no, question_no, no, content)
  values(16, 4, 1, '이 없으면 잇몸으로 산다 - 순망치한');
 insert into multiple(multiple_no, question_no, no, content)
  values(17, 4, 2, '개똥도 약에 쓰려면 없다 - 하로동선');
 insert into multiple(multiple_no, question_no, no, content)
  values(18, 4, 3, '우물 안의 개구리 - 하충의빙');
 insert into multiple(multiple_no, question_no, no, content)
  values(19, 4, 4, '굽은 나무가 선산을 지킨다 - 설중송백');
  
insert into multiple(multiple_no, question_no, no, content)
  values(20, 6, 1, 'YES');
 insert into multiple(multiple_no, question_no, no, content)
  values(21, 6, 2, 'NO');
  
insert into multiple(multiple_no, question_no, no, content)
values(22, 7, 1, 'ADN게이트');
insert into multiple(multiple_no, question_no, no, content)
values(23, 7, 2, 'MED게이트');
insert into multiple(multiple_no, question_no, no, content)
values(24, 7, 3, 'ANAD게이트');
insert into multiple(multiple_no, question_no, no, content)
values(25, 7, 4, 'NOT게이트');
insert into multiple(multiple_no, question_no, no, content)
values(26, 7, 5, 'ORT게이트');

insert into multiple(multiple_no, question_no, no, content)
values(27, 8, 1, '자연수');
insert into multiple(multiple_no, question_no, no, content)
values(28, 8, 2, '소수');
insert into multiple(multiple_no, question_no, no, content)
values(29, 8, 3, '실수');
insert into multiple(multiple_no, question_no, no, content)
values(30, 8, 4, '사원수');
insert into multiple(multiple_no, question_no, no, content)
values(31, 8, 5, '가수');

-- 질문 답변
-- 1번 질문 답변
insert into answer(member_no, question_no, multiple_no)
values(2, 1, 4);
insert into answer(member_no, question_no, multiple_no)
values(3, 1, 4);
insert into answer(member_no, question_no, multiple_no)
values(4, 1, 4);
insert into answer(member_no, question_no, multiple_no)
values(5, 1, 5);

-- 2번 질문 답변
insert into answer(member_no, question_no, multiple_no)
values(2, 2, 7);
insert into answer(member_no, question_no, multiple_no)
values(3, 2, 8);
insert into answer(member_no, question_no, multiple_no)
values(4, 2, 7);
insert into answer(member_no, question_no, multiple_no)
values(5, 2, 7);

-- 3번 질문 답변
insert into answer(member_no, question_no, multiple_no)
values(2, 3, 13);
insert into answer(member_no, question_no, multiple_no)
values(3, 3, 11);
insert into answer(member_no, question_no, multiple_no)
values(4, 3, 13);
insert into answer(member_no, question_no, multiple_no)
values(5, 3, 15);

insert into answer(member_no, question_no, multiple_no)
  values(7, 4, 16);
insert into answer(member_no, question_no, multiple_no)
  values(8, 4, 17);
insert into answer(member_no, question_no, multiple_no)
  values(9, 4, 18);
insert into answer(member_no, question_no, multiple_no)
  values(10, 4, 19);

insert into answer(member_no, question_no, content)
  values(7, 5, '잘생겼대, 어미 ‘-대’는 화자가 직접 경험한 사실이 아니라 남이 말한 내용을 간접적으로 전달할 때 쓰입니다.');
insert into answer(member_no, question_no, content)
  values(8, 5, '잘생겼데, ‘-데’는 화자가 과거의 직접 경험한 내용임을 표시입니다.');
insert into answer(member_no, question_no, content)
  values(9, 5, '잘생겼대, 화자는 남이 했던 말을 전하고 있으니 ‘-대’가 맞는 것 같습니다.');

insert into answer(member_no, question_no, content, multiple_no)
  values(7, 6, '좋습니다!!', 20);
insert into answer(member_no, question_no, content, multiple_no)
  values(8, 6, '죄송합니다. 다른 약속이 있어요.', 21);
insert into answer(member_no, question_no, content, multiple_no)
  values(9, 6, '좋아요~ 어디서 먹나요?', 20);
insert into answer(member_no, question_no, content, multiple_no)
  values(10, 6, '간단하게 저녁만 먹는다면 가능해요.', 20);

-- 객관식 답변
insert into answer(member_no, question_no, multiple_no)
values(12, 7, 22);
insert into answer(member_no, question_no, multiple_no)
values(13, 7, 26);
insert into answer(member_no, question_no, multiple_no)
values(14, 7, 24);
insert into answer(member_no, question_no, multiple_no)
values(15, 7, 26);

insert into answer(member_no, question_no, multiple_no)
values(12, 8, 30);
insert into answer(member_no, question_no, multiple_no)
values(13, 8, 28);
insert into answer(member_no, question_no, multiple_no)
values(14, 8, 29);
insert into answer(member_no, question_no, multiple_no)
values(15, 8, 27);

insert into answer(member_no, question_no, content)
values(12, 9, '접합형 트랜지스터(BJT): PNP형과 NPN형이 있고, 베이스와 컬렉터 그리고 에미터를 가지고 있다.');
insert into answer(member_no, question_no, content)
values(13, 9, '접합형 전계 효과 트랜지스터(JFET):PN 접합형 게이트(+Si)로 구성되어있으며, 간단한 회로에 적합한 소신호용으로 사용된다. - D - S 사이의 채널이 하나인 단극성 소자이다. ');
insert into answer(member_no, question_no, content)
values(14, 9, '트랜지스터: 반도체 결정안의 전자나 양공에 의한 전기 전도를 이용해서 증폭등을 행하는 전자 소자');
insert into answer(member_no, question_no, content)
values(15, 9, '박막 트랜지스터 (TFT):박막 트랜지스터는 전계효과 트랜지스터의 한 종류로 박막의 형태로 되어 있다. ');

 -- 게시판
insert into board(board_no, class_no, title, notice)
values(1, 1, '공지사항', 1);
insert into board(board_no, class_no, title, notice)
values(2, 1, 'Q&A', 0);
insert into board(board_no, class_no, title, notice)
values(3, 1, '자료실', 1);
insert into board(board_no, class_no, title, notice)
values(4, 1, '학생게시판', 0);
insert into board(board_no, class_no, title, notice)
values(5, 1, '자유게시판', 0);

insert into board(board_no, class_no, title, notice)
  values(6, 2, '공지게시판', 1);
insert into board(board_no, class_no, title, notice)
  values(7, 2, '자료실', 1);
insert into board(board_no, class_no, title, notice)
  values(8, 2, '질문게시판', 0);
insert into board(board_no, class_no, title, notice)
values(9, 3, '학생게시판', 0);
insert into board(board_no, class_no, title, notice)
values(10, 3, '자료실', 0);
insert into board(board_no, class_no, title, notice)
values(11, 3, '자유게시판', 0);

-- 게시글
insert into post(board_no, member_no, title, content, create_date)
values(1, 1, '개학 문의 공지', '3월 2일 정상개학 예정입니다.', '2020-02-15');
insert into post(board_no, member_no, title, content, create_date)
values(1, 1, '긴급공지', '코로나 19가 심해짐에 따라 4월 6일로 개학이 연기 되었습니다. 참고하시길 바랍니다.', '2020-02-23');
insert into post(board_no, member_no, title, content, create_date)
values(1, 1, '코로나 19관련 공지', '정부 권고안에 따라 5월 31일까지 개학이 연기 되었습니다. 건강에 유의하시길 바랍니다. 문의사항은 02-555-5555로 전화주시길 바랍니다.', '2020-04-01');
insert into post(board_no, member_no, title, content, create_date)
values(1, 1, '개학 일정 공지', '정부 권고안에 따라 6월 1일 부터 온라인 강의로 변경되었습니다. 과제는 수업 섹션을, 관련 참고자료는 게시판섹션의 자료실 게시판을 참고해 주시길 바랍니다.', '2020-05-20');

insert into post(board_no, member_no, title, content, create_date)
values(2, 2, '교수님 개학 관련 문의드립니다.', '코로나가 심해져서 개학이 연기될 수 도 있다는데 개학 연기 예정에 있나요?', '2020-02-10');
insert into post(board_no, member_no, title, content, create_date)
values(2, 3, '교수님 정상개학하나요?', '정상 개학하나요?', '2020-02-11');
insert into post(board_no, member_no, title, content, create_date)
values(2, 4, '관세법 너무 어려워요 ㅠ.. ', '문제 쉽게 내주세요!', '2020-05-25');
insert into post(board_no, member_no, title, content, create_date)
values(2, 4, '해상무역과 항공무역 관련 질문드립니다.', '항공무역에 비해 해상무역의 장점이 무엇인지 궁금합니다.', '2020-05-29');

insert into post(board_no, member_no, title, content, create_date)
values(3, 1, '무역학개론', '참고자료입니다.', '2020-05-20');
insert into post(board_no, member_no, title, content, create_date)
values(3, 1, '관세법', '참고자료입니다.', '2020-05-21');
insert into post(board_no, member_no, title, content, create_date)
values(3, 1, '해상무역과 항공무역의 차이점', '참고자료입니다.', '2020-05-23');
insert into post(board_no, member_no, title, content, create_date)
values(3, 1, 'SCM이란?', '참고자료입니다.', '2020-05-28');

insert into post(board_no, member_no, title, content, create_date)
values(4, 5, '언제 개강하는지 아는사람?', '아는사람 있나..?', '2020-02-10');
insert into post(board_no, member_no, title, content, create_date)
values(4, 2, '개강 연기된다는 소문이 있던데요?', '조교님이 그러시던데 아마 연기될까요?', '2020-02-13');
insert into post(board_no, member_no, title, content, create_date)
values(4, 3, '관세법 어려운가?', '선배들이 어렵다고하는데 걱정되네', '2020-05-25');
insert into post(board_no, member_no, title, content, create_date)
values(4, 5, '수업 같이 들을 사람!', '학교 가게 되면 같이 다닐 사람 있나!!?', '2020-05-28');
insert into post(board_no, member_no, title, content, create_date)
values(4, 4, '스터디 할사람있나요?', '관세법 어렵다는데 스터디하면서 공부할사람 있나요? 복수전공이라 어려워요 ㅠㅠ', '2020-06-01');

insert into post(board_no, member_no, title, content, create_date)
values(5, 4, '학교 개교기념일 언젠지 아는사람?', '궁금', '2020-06-05');
insert into post(board_no, member_no, title, content, create_date)
values(5, 3, '강남역 근처 맛집 추천한다.', '육전식당 맛있음!', '2020-06-08');

insert into post(board_no, member_no, title, content, create_date)
  values(6, 6, '내일 수업은 없습니다.', '12일까지 남은 과제 꼭 제출해주세요.', '2020-06-09');
insert into post(board_no, member_no, title, content)
  values(6, 6, '다음에 함께 토론할 작품', '다음 작품은 황석영의 <<삼포 가는 길>> 입니다.');
insert into post(board_no, member_no, title, content, create_date)
  values(6, 6, '다음 주에는 오프라인 모임이 있습니다.', '장소는 xxx, 시간은 오후 3시입니다.', '2020-06-09');

insert into post(board_no, member_no, title, content, file)
  values(7, 6, '수업자료입니다.', '참고하세요.', '현대시의 이해.hwp');
insert into post(board_no, member_no, title, content, file)
  values(7, 6, '문법 관련 자료입니다.', '자료참고하세요.', '자주 헷갈리는 문법 모음.hwp');
insert into post(board_no, member_no, title, content, file)
  values(7, 6, '모두 화이팅입니다. 문학사 수업 자료에요.', '한국문학사.hwp');

insert into post(board_no, member_no, title, content)
  values(8, 8, '시화전 관련 질문', '시화전의 주제는 정해져있나요?');
insert into post(board_no, member_no, title, content)
  values(8, 9, '다음 주 오프라인 모임 관련 질문', '모임은 몇 시간 정도 예상하고 계시나요?');
insert into post(board_no, member_no, title, content)
  values(8, 10, '수업 건의 사항', '글쓰기 관련해서 작성해온 글에 첨삭도 해주실 수 있나요?');


insert into post(board_no, member_no, title, content)
values(9, 12, '애들아', '프로젝트 목표 달성하자 ');
insert into post(board_no, member_no, title, content)
values(9, 12, '집인데도 집가고싶다....', '그치?');
insert into post(board_no, member_no, title, content)
values(9, 14, '공부잘하는방법은?', '교과서 위주 공부하세요');
insert into post(board_no, member_no, title, content)
values(9, 15, '수업자료입니다.', '참고하세요.');
insert into post(board_no, member_no, title, file, content)
values(10, 11, '논리회로 참고 자료입니다.', '회로도.pdf', '자료참고하세요.');
insert into post(board_no, member_no, title, file, content)
values(10, 11, '정수에 대한 자료 입니다', '정수.pdf', '자료참고하세요.');


insert into post(board_no, member_no, title, content)
values(11, 13, '온라인 수업 좋은거같아요', '저만 밥먹은면서 하는거 아니죠?.');
insert into post(board_no, member_no, title, content)
values(11, 14, '다음 주 오프라인 수업은 어디서 할까요?', '저는 집만아니면 어디든 좋아요!');
insert into post(board_no, member_no, title, content)
values(11, 15, '교수님 너무 어렵게 내지마세요..', '진짜모르게쒀요.');
insert into post(board_no, member_no, title, content)
values(11, 11, '주관식 문제 답 몇가지로 하셨어요?', '저는 두가지로 했어요');