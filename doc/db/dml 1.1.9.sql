-- 과제
DROP TABLE IF EXISTS `assignment` RESTRICT;

-- 질문
DROP TABLE IF EXISTS `question` RESTRICT;

-- 태그
DROP TABLE IF EXISTS `tag` RESTRICT;

-- 클래스
DROP TABLE IF EXISTS `class` RESTRICT;

-- 수업참여
DROP TABLE IF EXISTS `class_member` RESTRICT;

-- 사용자
DROP TABLE IF EXISTS `user` RESTRICT;

-- 과제제출
DROP TABLE IF EXISTS `assignment_submit` RESTRICT;

-- 쪽지
DROP TABLE IF EXISTS `message` RESTRICT;

-- 게시글
DROP TABLE IF EXISTS `post` RESTRICT;

-- 객관식항목
DROP TABLE IF EXISTS `multiple` RESTRICT;

-- 게시판
DROP TABLE IF EXISTS `board` RESTRICT;

-- 클래스태그
DROP TABLE IF EXISTS `class_tag` RESTRICT;

-- 과제태그
DROP TABLE IF EXISTS `assignment_tag` RESTRICT;

-- 답변
DROP TABLE IF EXISTS `answer` RESTRICT;

-- 질문태그
DROP TABLE IF EXISTS `question_tag` RESTRICT;

-- 게시글태그
DROP TABLE IF EXISTS `board_tag` RESTRICT;

-- 파일
DROP TABLE IF EXISTS `file` RESTRICT;

-- 과제
CREATE TABLE `assignment` (
  `assignment_no` INTEGER      NOT NULL COMMENT '과제번호', -- 과제번호
  `class_no`      INTEGER      NOT NULL COMMENT '클래스번호', -- 클래스번호
  `member_no`     INTEGER      NOT NULL COMMENT '선생님번호', -- 선생님번호
  `title`         VARCHAR(50)  NOT NULL COMMENT '제목', -- 제목
  `content`       TEXT         NULL     COMMENT '내용', -- 내용
  `file`          VARCHAR(255) NULL     COMMENT '첨부파일', -- 첨부파일
  `deadline`      DATETIME     NOT NULL COMMENT '제출마감일', -- 제출마감일
  `standard`      TEXT         NULL     COMMENT '평가기준', -- 평가기준
  `start_date`    DATETIME     NOT NULL COMMENT '시작일', -- 시작일
  `create_date`   DATETIME     NOT NULL DEFAULT now() COMMENT '생성일' -- 생성일
)
COMMENT '과제';

-- 과제
ALTER TABLE `assignment`
  ADD CONSTRAINT `PK_assignment` -- 과제 기본키
    PRIMARY KEY (
      `assignment_no` -- 과제번호
    );

ALTER TABLE `assignment`
  MODIFY COLUMN `assignment_no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '과제번호';

-- 질문
CREATE TABLE `question` (
  `question_no` INTEGER      NOT NULL COMMENT '질문번호', -- 질문번호
  `class_no`    INTEGER      NOT NULL COMMENT '클래스번호', -- 클래스번호
  `member_no`   INTEGER      NOT NULL COMMENT '선생님번호', -- 선생님번호
  `title`       VARCHAR(50)  NOT NULL COMMENT '제목', -- 제목
  `content`     TEXT         NULL     COMMENT '내용', -- 내용
  `file`        VARCHAR(255) NULL     COMMENT '첨부파일', -- 첨부파일
  `deadline`    DATETIME     NOT NULL COMMENT '답변마감일', -- 답변마감일
  `start_date`  DATETIME     NOT NULL COMMENT '시작일', -- 시작일
  `create_date` DATETIME     NOT NULL DEFAULT now() COMMENT '생성일' -- 생성일
)
COMMENT '질문';

-- 질문
ALTER TABLE `question`
  ADD CONSTRAINT `PK_question` -- 질문 기본키
    PRIMARY KEY (
      `question_no` -- 질문번호
    );

ALTER TABLE `question`
  MODIFY COLUMN `question_no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '질문번호';

-- 태그
CREATE TABLE `tag` (
  `tag_no` INTEGER     NOT NULL COMMENT '태그번호', -- 태그번호
  `name`   VARCHAR(30) NOT NULL COMMENT '태그명' -- 태그명
)
COMMENT '태그';

-- 태그
ALTER TABLE `tag`
  ADD CONSTRAINT `PK_tag` -- 태그 기본키
    PRIMARY KEY (
      `tag_no` -- 태그번호
    );

ALTER TABLE `tag`
  MODIFY COLUMN `tag_no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '태그번호';

-- 클래스
CREATE TABLE `class` (
  `class_no`    INTEGER     NOT NULL COMMENT '클래스번호', -- 클래스번호
  `name`        VARCHAR(30) NOT NULL COMMENT '수업이름', -- 수업이름
  `description` TEXT        NULL     COMMENT '설명', -- 설명
  `room`        VARCHAR(30) NULL     COMMENT '강의실', -- 강의실
  `class_code`  VARCHAR(30) NOT NULL COMMENT '수업코드', -- 수업코드
  `create_date` DATETIME    NOT NULL DEFAULT now() COMMENT '생성일', -- 생성일
  `color`       TEXT        NULL     COMMENT '컬러' -- 컬러
)
COMMENT '클래스';

-- 클래스
ALTER TABLE `class`
  ADD CONSTRAINT `PK_class` -- 클래스 기본키
    PRIMARY KEY (
      `class_no` -- 클래스번호
    );

ALTER TABLE `class`
  MODIFY COLUMN `class_no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '클래스번호';

-- 수업참여
CREATE TABLE `class_member` (
  `member_no` INTEGER NOT NULL COMMENT '수업참여자번호', -- 수업참여자번호
  `user_no`   INTEGER NOT NULL COMMENT '사용자번호', -- 사용자번호
  `class_no`  INTEGER NOT NULL COMMENT '클래스번호', -- 클래스번호
  `role`      INTEGER NOT NULL COMMENT '역할' -- 역할
)
COMMENT '수업참여';

-- 수업참여
ALTER TABLE `class_member`
  ADD CONSTRAINT `PK_class_member` -- 수업참여 기본키
    PRIMARY KEY (
      `member_no` -- 수업참여자번호
    );

-- 수업참여 유니크 인덱스
CREATE UNIQUE INDEX `UIX_class_member`
  ON `class_member` ( -- 수업참여
    `user_no` ASC,  -- 사용자번호
    `class_no` ASC  -- 클래스번호
  );

ALTER TABLE `class_member`
  MODIFY COLUMN `member_no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '수업참여자번호';

-- 사용자
CREATE TABLE `user` (
  `user_no`       INTEGER      NOT NULL COMMENT '사용자번호', -- 사용자번호
  `email`         VARCHAR(50)  NOT NULL COMMENT '이메일', -- 이메일
  `name`          VARCHAR(30)  NOT NULL COMMENT '이름', -- 이름
  `password`      VARCHAR(50)  NOT NULL COMMENT '비밀번호', -- 비밀번호
  `tel`           VARCHAR(20)  NULL     COMMENT '연락처', -- 연락처
  `major`         VARCHAR(30)  NULL     COMMENT '전공', -- 전공
  `introduce`     TEXT         NULL     COMMENT '자기소개', -- 자기소개
  `profile_photo` VARCHAR(255) NULL     COMMENT '프로필사진', -- 프로필사진
  `login_method`  INTEGER      NOT NULL COMMENT '로그인방식', -- 로그인방식
  `alterkey`      CHAR(30)     NULL     COMMENT '인증키', -- 인증키
  `create_date`   DATETIME     NOT NULL DEFAULT now() COMMENT '생성일' -- 생성일
)
COMMENT '사용자';

-- 사용자
ALTER TABLE `user`
  ADD CONSTRAINT `PK_user` -- 사용자 기본키
    PRIMARY KEY (
      `user_no` -- 사용자번호
    );

-- 사용자 유니크 인덱스
CREATE UNIQUE INDEX `UIX_user`
  ON `user` ( -- 사용자
    `email` ASC -- 이메일
  );

-- 사용자 인덱스
CREATE INDEX `IX_user`
  ON `user`( -- 사용자
    `name` ASC -- 이름
  );

ALTER TABLE `user`
  MODIFY COLUMN `user_no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '사용자번호';

-- 과제제출
CREATE TABLE `assignment_submit` (
  `member_no`     INTEGER      NOT NULL COMMENT '수업참여자번호', -- 수업참여자번호
  `assignment_no` INTEGER      NOT NULL COMMENT '과제번호', -- 과제번호
  `file`          VARCHAR(255) NULL     COMMENT '제출자료', -- 제출자료
  `score`         INTEGER      NULL     COMMENT '평가점수', -- 평가점수
  `content`       TEXT         NULL     COMMENT '내용', -- 내용
  `feedback`      TEXT         NULL     COMMENT '강사피드백', -- 강사피드백
  `create_date`   DATETIME     NOT NULL DEFAULT now() COMMENT '생성일' -- 생성일
)
COMMENT '과제제출';

-- 과제제출
ALTER TABLE `assignment_submit`
  ADD CONSTRAINT `PK_assignment_submit` -- 과제제출 기본키
    PRIMARY KEY (
      `member_no`,     -- 수업참여자번호
      `assignment_no`  -- 과제번호
    );

-- 쪽지
CREATE TABLE `message` (
  `message_no`  INTEGER  NOT NULL COMMENT '쪽지번호', -- 쪽지번호
  `caller_no`   INTEGER  NOT NULL COMMENT '발신자번호', -- 발신자번호
  `receiver_no` INTEGER  NOT NULL COMMENT '수신자번호', -- 수신자번호
  `content`     TEXT     NOT NULL COMMENT '내용', -- 내용
  `create_date` DATETIME NOT NULL DEFAULT now() COMMENT '작성일' -- 작성일
)
COMMENT '쪽지';

-- 쪽지
ALTER TABLE `message`
  ADD CONSTRAINT `PK_message` -- 쪽지 기본키
    PRIMARY KEY (
      `message_no` -- 쪽지번호
    );

ALTER TABLE `message`
  MODIFY COLUMN `message_no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '쪽지번호';

-- 게시글
CREATE TABLE `post` (
  `post_no`     INTEGER      NOT NULL COMMENT '게시글번호', -- 게시글번호
  `board_no`    INTEGER      NOT NULL COMMENT '게시판번호', -- 게시판번호
  `member_no`   INTEGER      NOT NULL COMMENT '작성자번호', -- 작성자번호
  `title`       VARCHAR(50)  NOT NULL COMMENT '제목', -- 제목
  `content`     TEXT         NULL     COMMENT '내용', -- 내용
  `create_date` DATETIME     NOT NULL DEFAULT now() COMMENT '작성일', -- 작성일
  `file`        VARCHAR(255) NULL     COMMENT '첨부파일' -- 첨부파일
)
COMMENT '게시글';

-- 게시글
ALTER TABLE `post`
  ADD CONSTRAINT `PK_post` -- 게시글 기본키
    PRIMARY KEY (
      `post_no` -- 게시글번호
    );

ALTER TABLE `post`
  MODIFY COLUMN `post_no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '게시글번호';

-- 객관식항목
CREATE TABLE `multiple` (
  `multiple_no` INTEGER NOT NULL COMMENT '객관식항목번호', -- 객관식항목번호
  `question_no` INTEGER NOT NULL COMMENT '질문번호', -- 질문번호
  `no`          INTEGER NOT NULL COMMENT '번호', -- 번호
  `content`     TEXT    NOT NULL COMMENT '내용' -- 내용
)
COMMENT '객관식항목';

-- 객관식항목
ALTER TABLE `multiple`
  ADD CONSTRAINT `PK_multiple` -- 객관식항목 기본키
    PRIMARY KEY (
      `multiple_no` -- 객관식항목번호
    );

ALTER TABLE `multiple`
  MODIFY COLUMN `multiple_no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '객관식항목번호';

-- 게시판
CREATE TABLE `board` (
  `board_no` INTEGER     NOT NULL COMMENT '게시판번호', -- 게시판번호
  `title`    VARCHAR(50) NOT NULL COMMENT '게시판제목', -- 게시판제목
  `class_no` INTEGER     NOT NULL COMMENT '클래스번호', -- 클래스번호
  `notice`   INTEGER     NOT NULL COMMENT '공지여부' -- 공지여부
)
COMMENT '게시판';

-- 게시판
ALTER TABLE `board`
  ADD CONSTRAINT `PK_board` -- 게시판 기본키
    PRIMARY KEY (
      `board_no` -- 게시판번호
    );

ALTER TABLE `board`
  MODIFY COLUMN `board_no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '게시판번호';

-- 클래스태그
CREATE TABLE `class_tag` (
  `class_no` INTEGER NOT NULL COMMENT '클래스번호', -- 클래스번호
  `tag_no`   INTEGER NOT NULL COMMENT '태그번호' -- 태그번호
)
COMMENT '클래스태그';

-- 클래스태그
ALTER TABLE `class_tag`
  ADD CONSTRAINT `PK_class_tag` -- 클래스태그 기본키
    PRIMARY KEY (
      `class_no`, -- 클래스번호
      `tag_no`    -- 태그번호
    );

-- 과제태그
CREATE TABLE `assignment_tag` (
  `assignment_no` INTEGER NOT NULL COMMENT '과제번호', -- 과제번호
  `tag_no`        INTEGER NOT NULL COMMENT '태그번호' -- 태그번호
)
COMMENT '과제태그';

-- 과제태그
ALTER TABLE `assignment_tag`
  ADD CONSTRAINT `PK_assignment_tag` -- 과제태그 기본키
    PRIMARY KEY (
      `assignment_no`, -- 과제번호
      `tag_no`         -- 태그번호
    );

-- 답변
CREATE TABLE `answer` (
  `member_no`   INTEGER  NOT NULL COMMENT '수업참여자번호', -- 수업참여자번호
  `question_no` INTEGER  NOT NULL COMMENT '질문번호', -- 질문번호
  `content`     TEXT     NULL     COMMENT '주관식답변내용', -- 주관식답변내용
  `multiple_no` INTEGER  NULL     COMMENT '객관식항목번호', -- 객관식항목번호
  `create_date` DATETIME NOT NULL DEFAULT now() COMMENT '생성일' -- 생성일
)
COMMENT '답변';

-- 답변
ALTER TABLE `answer`
  ADD CONSTRAINT `PK_answer` -- 답변 기본키
    PRIMARY KEY (
      `member_no`,   -- 수업참여자번호
      `question_no`  -- 질문번호
    );

-- 질문태그
CREATE TABLE `question_tag` (
  `question_no` INTEGER NOT NULL COMMENT '질문번호', -- 질문번호
  `tag_no`      INTEGER NOT NULL COMMENT '태그번호' -- 태그번호
)
COMMENT '질문태그';

-- 질문태그
ALTER TABLE `question_tag`
  ADD CONSTRAINT `PK_question_tag` -- 질문태그 기본키
    PRIMARY KEY (
      `question_no`, -- 질문번호
      `tag_no`       -- 태그번호
    );

-- 게시글태그
CREATE TABLE `board_tag` (
  `post_no` INTEGER NOT NULL COMMENT '게시글번호', -- 게시글번호
  `tag_no`  INTEGER NOT NULL COMMENT '태그번호' -- 태그번호
)
COMMENT '게시글태그';

-- 게시글태그
ALTER TABLE `board_tag`
  ADD CONSTRAINT `PK_board_tag` -- 게시글태그 기본키
    PRIMARY KEY (
      `post_no`, -- 게시글번호
      `tag_no`   -- 태그번호
    );

-- 파일
CREATE TABLE `file` (
  `file_id`       CHAR(36)     NOT NULL COMMENT '파일ID', -- 파일ID
  `original_name` VARCHAR(255) NULL     COMMENT '파일명', -- 파일명
  `extension`     CHAR(5)      NULL     COMMENT '확장자', -- 확장자
  `path`          VARCHAR(255) NULL     COMMENT '경로', -- 경로
  `size`          BIGINT       NULL     COMMENT '사이즈' -- 사이즈
)
COMMENT '파일';

-- 파일
ALTER TABLE `file`
  ADD CONSTRAINT `PK_file` -- 파일 기본키
    PRIMARY KEY (
      `file_id` -- 파일ID
    );

-- 과제
ALTER TABLE `assignment`
  ADD CONSTRAINT `FK_class_TO_assignment` -- 클래스 -> 과제
    FOREIGN KEY (
      `class_no` -- 클래스번호
    )
    REFERENCES `class` ( -- 클래스
      `class_no` -- 클래스번호
    )
    ON DELETE CASCADE;

-- 과제
ALTER TABLE `assignment`
  ADD CONSTRAINT `FK_class_member_TO_assignment` -- 수업참여 -> 과제
    FOREIGN KEY (
      `member_no` -- 선생님번호
    )
    REFERENCES `class_member` ( -- 수업참여
      `member_no` -- 수업참여자번호
    )
    ON DELETE CASCADE;

-- 질문
ALTER TABLE `question`
  ADD CONSTRAINT `FK_class_member_TO_question` -- 수업참여 -> 질문
    FOREIGN KEY (
      `member_no` -- 선생님번호
    )
    REFERENCES `class_member` ( -- 수업참여
      `member_no` -- 수업참여자번호
    )
    ON DELETE CASCADE;

-- 질문
ALTER TABLE `question`
  ADD CONSTRAINT `FK_class_TO_question` -- 클래스 -> 질문
    FOREIGN KEY (
      `class_no` -- 클래스번호
    )
    REFERENCES `class` ( -- 클래스
      `class_no` -- 클래스번호
    )
    ON DELETE CASCADE;

-- 수업참여
ALTER TABLE `class_member`
  ADD CONSTRAINT `FK_user_TO_class_member` -- 사용자 -> 수업참여
    FOREIGN KEY (
      `user_no` -- 사용자번호
    )
    REFERENCES `user` ( -- 사용자
      `user_no` -- 사용자번호
    )
    ON DELETE CASCADE;

-- 수업참여
ALTER TABLE `class_member`
  ADD CONSTRAINT `FK_class_TO_class_member` -- 클래스 -> 수업참여
    FOREIGN KEY (
      `class_no` -- 클래스번호
    )
    REFERENCES `class` ( -- 클래스
      `class_no` -- 클래스번호
    )
    ON DELETE CASCADE;

-- 과제제출
ALTER TABLE `assignment_submit`
  ADD CONSTRAINT `FK_class_member_TO_assignment_submit` -- 수업참여 -> 과제제출
    FOREIGN KEY (
      `member_no` -- 수업참여자번호
    )
    REFERENCES `class_member` ( -- 수업참여
      `member_no` -- 수업참여자번호
    )
    ON DELETE CASCADE;

-- 과제제출
ALTER TABLE `assignment_submit`
  ADD CONSTRAINT `FK_assignment_TO_assignment_submit` -- 과제 -> 과제제출
    FOREIGN KEY (
      `assignment_no` -- 과제번호
    )
    REFERENCES `assignment` ( -- 과제
      `assignment_no` -- 과제번호
    )
    ON DELETE CASCADE;

-- 쪽지
ALTER TABLE `message`
  ADD CONSTRAINT `FK_user_TO_message` -- 사용자 -> 쪽지
    FOREIGN KEY (
      `caller_no` -- 발신자번호
    )
    REFERENCES `user` ( -- 사용자
      `user_no` -- 사용자번호
    )
    ON DELETE CASCADE;

-- 쪽지
ALTER TABLE `message`
  ADD CONSTRAINT `FK_user_TO_message2` -- 사용자 -> 쪽지2
    FOREIGN KEY (
      `receiver_no` -- 수신자번호
    )
    REFERENCES `user` ( -- 사용자
      `user_no` -- 사용자번호
    )
    ON DELETE CASCADE;

-- 게시글
ALTER TABLE `post`
  ADD CONSTRAINT `FK_class_member_TO_post` -- 수업참여 -> 게시글
    FOREIGN KEY (
      `member_no` -- 작성자번호
    )
    REFERENCES `class_member` ( -- 수업참여
      `member_no` -- 수업참여자번호
    )
    ON DELETE CASCADE;

-- 게시글
ALTER TABLE `post`
  ADD CONSTRAINT `FK_board_TO_post` -- 게시판 -> 게시글
    FOREIGN KEY (
      `board_no` -- 게시판번호
    )
    REFERENCES `board` ( -- 게시판
      `board_no` -- 게시판번호
    )
    ON DELETE CASCADE;

-- 객관식항목
ALTER TABLE `multiple`
  ADD CONSTRAINT `FK_question_TO_multiple` -- 질문 -> 객관식항목
    FOREIGN KEY (
      `question_no` -- 질문번호
    )
    REFERENCES `question` ( -- 질문
      `question_no` -- 질문번호
    )
    ON DELETE CASCADE;

-- 게시판
ALTER TABLE `board`
  ADD CONSTRAINT `FK_class_TO_board` -- 클래스 -> 게시판
    FOREIGN KEY (
      `class_no` -- 클래스번호
    )
    REFERENCES `class` ( -- 클래스
      `class_no` -- 클래스번호
    )
    ON DELETE CASCADE;

-- 클래스태그
ALTER TABLE `class_tag`
  ADD CONSTRAINT `FK_class_TO_class_tag` -- 클래스 -> 클래스태그
    FOREIGN KEY (
      `class_no` -- 클래스번호
    )
    REFERENCES `class` ( -- 클래스
      `class_no` -- 클래스번호
    )
    ON DELETE CASCADE;

-- 클래스태그
ALTER TABLE `class_tag`
  ADD CONSTRAINT `FK_tag_TO_class_tag` -- 태그 -> 클래스태그
    FOREIGN KEY (
      `tag_no` -- 태그번호
    )
    REFERENCES `tag` ( -- 태그
      `tag_no` -- 태그번호
    );

-- 과제태그
ALTER TABLE `assignment_tag`
  ADD CONSTRAINT `FK_tag_TO_assignment_tag` -- 태그 -> 과제태그
    FOREIGN KEY (
      `tag_no` -- 태그번호
    )
    REFERENCES `tag` ( -- 태그
      `tag_no` -- 태그번호
    );

-- 과제태그
ALTER TABLE `assignment_tag`
  ADD CONSTRAINT `FK_assignment_TO_assignment_tag` -- 과제 -> 과제태그
    FOREIGN KEY (
      `assignment_no` -- 과제번호
    )
    REFERENCES `assignment` ( -- 과제
      `assignment_no` -- 과제번호
    )
    ON DELETE CASCADE;

-- 답변
ALTER TABLE `answer`
  ADD CONSTRAINT `FK_class_member_TO_answer` -- 수업참여 -> 답변
    FOREIGN KEY (
      `member_no` -- 수업참여자번호
    )
    REFERENCES `class_member` ( -- 수업참여
      `member_no` -- 수업참여자번호
    )
    ON DELETE CASCADE;

-- 답변
ALTER TABLE `answer`
  ADD CONSTRAINT `FK_question_TO_answer` -- 질문 -> 답변
    FOREIGN KEY (
      `question_no` -- 질문번호
    )
    REFERENCES `question` ( -- 질문
      `question_no` -- 질문번호
    )
    ON DELETE CASCADE;

-- 답변
ALTER TABLE `answer`
  ADD CONSTRAINT `FK_multiple_TO_answer` -- 객관식항목 -> 답변
    FOREIGN KEY (
      `multiple_no` -- 객관식항목번호
    )
    REFERENCES `multiple` ( -- 객관식항목
      `multiple_no` -- 객관식항목번호
    )
    ON DELETE CASCADE;

-- 질문태그
ALTER TABLE `question_tag`
  ADD CONSTRAINT `FK_tag_TO_question_tag` -- 태그 -> 질문태그
    FOREIGN KEY (
      `tag_no` -- 태그번호
    )
    REFERENCES `tag` ( -- 태그
      `tag_no` -- 태그번호
    );

-- 질문태그
ALTER TABLE `question_tag`
  ADD CONSTRAINT `FK_question_TO_question_tag` -- 질문 -> 질문태그
    FOREIGN KEY (
      `question_no` -- 질문번호
    )
    REFERENCES `question` ( -- 질문
      `question_no` -- 질문번호
    )
    ON DELETE CASCADE;

-- 게시글태그
ALTER TABLE `board_tag`
  ADD CONSTRAINT `FK_tag_TO_board_tag` -- 태그 -> 게시글태그
    FOREIGN KEY (
      `tag_no` -- 태그번호
    )
    REFERENCES `tag` ( -- 태그
      `tag_no` -- 태그번호
    );

-- 게시글태그
ALTER TABLE `board_tag`
  ADD CONSTRAINT `FK_post_TO_board_tag` -- 게시글 -> 게시글태그
    FOREIGN KEY (
      `post_no` -- 게시글번호
    )
    REFERENCES `post` ( -- 게시글
      `post_no` -- 게시글번호
    )
    ON DELETE CASCADE;