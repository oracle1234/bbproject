DROP TABLE fb_comment CASCADE CONSTRAINTS;
DROP TABLE fb_photo_board CASCADE CONSTRAINTS;
DROP TABLE fb_qa_board CASCADE CONSTRAINTS;
DROP TABLE fb_board CASCADE CONSTRAINTS;
DROP TABLE fb_member CASCADE CONSTRAINTS;
DROP TABLE fb_boardcategory CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_comment_no;
DROP SEQUENCE SEQ_board_no;
DROP SEQUENCE SEQ_photo_no;
DROP SEQUENCE SEQ_qa_no;
DROP SEQUENCE SEQ_member_no;

CREATE SEQUENCE SEQ_comment_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_board_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_photo_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_qa_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_member_no INCREMENT BY 1 START WITH 1;

CREATE TABLE fb_photo_board
(
	photo_no number NOT NULL,
	member_no number NOT NULL,
	boardcategory_no number NOT NULL,
	photo_subject varchar2(200) NOT NULL,
	photo_content varchar2(2000) NOT NULL,
	photo_reg_date date NOT NULL,
	photo_upload varchar2(500) NOT NULL,
	photo_writer varchar2(100) NOT NULL,
	PRIMARY KEY (photo_no)
);


CREATE TABLE fb_qa_board
(
	qa_no number NOT NULL,
	member_no number NOT NULL,
	boardcategory_no number NOT NULL,
	qa_subject varchar2(200) NOT NULL,
	qa_content varchar2(2000) NOT NULL,
	qa_readcount number NOT NULL,	
	qa_reg_date date NOT NULL,
	qa_upload varchar2(500) NOT NULL,
	qa_writer varchar2(100) NOT NULL,
	PRIMARY KEY (qa_no)
);

CREATE TABLE fb_board
(
	board_no number NOT NULL,
	member_no number NOT NULL,
	boardcategory_no number NOT NULL,
	board_subject varchar2(200) NOT NULL,
	board_content varchar2(2000) NOT NULL,
	board_readcount number NOT NULL,
	board_reg_date date NOT NULL,
	board_writer varchar2(100) NOT NULL,
	PRIMARY KEY (board_no)
);

CREATE TABLE fb_comment
(
	comment_no number NOT NULL,
	board_no number NOT NULL,
	qa_no number NOT NULL,
	photo_no number NOT NULL,
	comment_content varchar2(2000) NOT NULL,
	comment_writer varchar2(100) NOT NULL,
	comment_date date NOT NULL,
	member_no number NOT NULL,
	PRIMARY KEY (comment_no)
);

CREATE TABLE fb_boardcategory
(
	boardcategory_no number NOT NULL,
	boardcategory_name varchar2(50) NOT NULL,
	PRIMARY KEY (boardcategory_no)
);

CREATE TABLE fb_member
(
	member_no number NOT NULL,
	member_name varchar2(500) NOT NULL,
	id varchar2(50) NOT NULL UNIQUE,
	pw varchar2(50) NOT NULL UNIQUE,
	address varchar2(2000) NOT NULL,
	tel varchar2(100) NOT NULL UNIQUE,
	mail varchar2(100) NOT NULL UNIQUE,
	point number,
	PRIMARY KEY (member_no)
);


ALTER TABLE fb_comment
	ADD FOREIGN KEY (photo_no)
	REFERENCES fb_photo_board (photo_no) on delete cascade
;


ALTER TABLE fb_comment
	ADD FOREIGN KEY (qa_no)
	REFERENCES fb_qa_board (qa_no) on delete cascade
;


ALTER TABLE fb_comment
	ADD FOREIGN KEY (board_no)
	REFERENCES fb_board (board_no) on delete cascade
;


ALTER TABLE fb_comment
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_photo_board
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_qa_board
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_board
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_photo_board
	ADD FOREIGN KEY (boardcategory_no)
	REFERENCES fb_boardcategory (boardcategory_no) on delete cascade
;


ALTER TABLE fb_board
	ADD FOREIGN KEY (boardcategory_no)
	REFERENCES fb_boardcategory (boardcategory_no) on delete cascade
;


ALTER TABLE fb_qa_board
	ADD FOREIGN KEY (boardcategory_no)
	REFERENCES fb_boardcategory (boardcategory_no) on delete cascade
;

/*각종 실행~*/
select * from fb_boardcategory;
select * from FB_MEMBER;
select * from FB_COMMENT;

select * from fb_board;
select * from fb_photo_board;
select * from fb_qa_board;


<<<<<<< HEAD
insert into fb_board values(0,6,1,'ssfsdf','csdfdf',0,sysdate,'wr');
insert into fb_photo_board values(0,6,2,'ssfsdf','csdfdf',sysdate,'wr.text','wr');
insert into fb_qa_board values(0,6,3,'ssfsdf','csdfdf',0,sysdate,'wr','wr');
=======

insert into fb_boardcategory values 
(1, '자유게시판');
insert into fb_boardcategory values 
(2, '포토후기');
insert into fb_boardcategory values 
(3, 'QA게시판');

insert into fb_member values(0,'가짜','가짜','가짜1!','서울','1','1@daum.net',0);
insert into fb_board values(0,0,1,'ssfsdf','csdfdf',0,sysdate,'wr');
insert into fb_photo_board values(0,0,2,'ssfsdf','csdfdf',sysdate,'wr.text','wr');
insert into fb_qa_board values(0,0,3,'ssfsdf','csdfdf',0,sysdate,'wr','wr');
insert into fb_comment values(0,1,0,0,'123','123',sysdate,0);
>>>>>>> refs/remotes/origin/yeonsung

select * from fb_board where board_no>=1 order by board_no desc;
