-- SC IT 마스터 웹 프로그램 Step Project : 인터넷 뱅킹 Step2

-- 고객 정보 테이블
CREATE TABLE CUSTOMER
(
	CUSTID VARCHAR2(20) CONSTRAINT CUSTID_PK PRIMARY KEY, -- 고객 아이디 
	PASSWORD VARCHAR2(20) NOT NULL,	-- 비밀번호
	NAME VARCHAR2(30) NOT NULL, -- 고객 이름
	EMAIL VARCHAR2(30), -- 고객 E-MAIL
	DIVISION VARCHAR2(20) NOT NULL, 	-- 고객구분 : personal(개인), company(기업)
	IDNO VARCHAR2(20) CONSTRAINT CUST_ID_UK UNIQUE,  -- 식별번호 (개인: 주민번호, 법인: 사업자 번호)
	ADDRESS VARCHAR2(100)
);

-- 테스트용 고객 데이터 
INSERT INTO CUSTOMER VALUES ('aaa','aaa', '홍길동', 'aaa@aaa.com', 'personal', '801230-1234567', '서울시');
select * from customer


-- 게시판 본문 글
create table board2 (
	boardnum	number	primary key,		--글번호
	id			varchar2(20) not null,		--작성자 ID
	title		varchar2(100) not null,		--글제목
	content		varchar2(2000) not null,	--글내용
	inputdate	date	default sysdate,	--작성날짜,시간
	hits	number 	default 0			--조회수
);
-- 게시판 일련번호에 사용할 시퀀스 
create sequence board2_seq start with 1 increment by 1;
-- 리플 내용
create table reply2 (
	replynum	number	primary key,		--리플번호
	boardnum	number not null,			--본문 글번호
	id			varchar2(20) not null,		--작성자 ID
	text		varchar2(200) not null,		--리플내용
	inputdate	  date 	default sysdate,	--작성날짜
	constraint reply2_fk foreign key(boardnum) 
		references board2(boardnum) on delete cascade
);
-- 리플에 사용할 시퀀스
create sequence reply2_seq start with 1 increment by 1;

-- 글 저장 예
insert into board2 (boardnum, id, title, content) values (board2_seq.nextval, 'aaa', '글제목11', '글내용11');
	
-- 리플 저장 예
insert into reply2 (replynum, boardnum, id, text) values (reply2_seq.nextval, 1, 'bbb', '리플의 내용...');
	

-- 검색 예
select * from board2 order by boardnum desc;
select * from reply2 order by replynum desc;


-- 게시판 글 목록에 사용할 쿼리
select * from
(
	select rownum r, b.* from 
	(
		select boardnum, id, title, to_char(inputdate, 'YYYY/MM/DD') inputdate, hits 
		from board2 order by boardnum desc
	) b
)
where r between 11 and 20;

update board2 set hits=1 where=21

