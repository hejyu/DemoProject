-- 북챗 메인글 테이블
create table community(
  idx number(10) NOT NULL,
  writer VARCHAR2(50) NOT NULL,     --작성자(로그인계정 정보 등)
  title VARCHAR2(100) NOT NULL ,	--글제목
  content VARCHAR2(3000) NOT NULL,	-- 글 내용
  readCount number(10) default '0',    -- 조회수
  createdAt DATE DEFAULT sysdate,       -- 작성날짜와시간 기본값
  ip varchar2(15),  -- 작성자 ip
  commentCount number(10) default '0',   --댓글 갯수
  PRIMARY KEY(idx)
);  
create SEQUENCE community_idx_seq;

-- 북챗 댓글테이블
CREATE TABLE communityComments (
	idx number(10) NOT NULL,   	-- 기본키
	mref number(10) NOT NULL,   -- community 테이블의 idx	
	writer VARCHAR2(50) NOT NULL,	-- 작성자
	content VARCHAR2(1000) NOT NULL,  -- 댓글 내용
	createdAt DATE DEFAULT sysdate,  -- 작성날짜와시간 기본값
	ip VARCHAR2(15),  -- 작성자 ip
	heart number(3) DEFAULT '0',	-- 좋아요 갯수
	PRIMARY KEY(idx)
);
CREATE SEQUENCE comment_idx_seq;

-- 추천도서
CREATE TABLE newbooks
   (	idx NUMBER(5,0) NOT NULL ,
	title VARCHAR2(100) NOT NULL ,
	regdate DATE DEFAULT sysdate, 
	coverfile VARCHAR2(300), 
	userid VARCHAR2(20), 
	summary CLOB, 
	 PRIMARY KEY (idx)
);

CREATE SEQUENCE newbooks_idx_seq;

-- 공지사항
create table notice(
  idx number(10) NOT NULL,
  title VARCHAR2(100) NOT NULL ,	--글제목
  content VARCHAR2(3000) NOT NULL,	-- 글 내용
  readCount number(10) DEFAULT '0',    -- 조회수
  createdAt DATE DEFAULT sysdate,       -- 작성날짜와시간 기본값
  PRIMARY KEY(idx)
);  
create SEQUENCE notice_idx_seq;

-- 회원
CREATE TABLE "DEMO_MEMBER" 
   (	"USERID" VARCHAR2(100) NOT NULL , 
	"PASSWORD" CHAR(64) NOT NULL , 
	"NAME" VARCHAR2(100) NOT NULL , 
	"BIRTH" CHAR(8) NOT NULL , 
	"GENDER" VARCHAR2(10) NOT NULL , 
	"PHONE" VARCHAR2(20) NOT NULL , 
	"EMAIL" VARCHAR2(100) NOT NULL , 
	"ADDRESS1" VARCHAR2(100), 
	"ADDRESS2" VARCHAR2(100), 
	"ADULTYN" CHAR(1) NOT NULL , 
	"ADDRESS3" VARCHAR2(100), 
	"ADDRESS4" VARCHAR2(100), 
	"POSTALCODE" VARCHAR2(100), 
	"JOINDATE" DATE DEFAULT sysdate, 
	"FAVORITES" VARCHAR2(200), 
	 CONSTRAINT "DEMO_MEMBER_PK" PRIMARY KEY ("USERID")
);