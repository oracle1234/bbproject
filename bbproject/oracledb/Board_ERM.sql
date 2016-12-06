
/* Drop Tables */
DROP TABLE fb_member CASCADE CONSTRAINTS;
DROP TABLE fb_comment CASCADE CONSTRAINTS;
DROP TABLE fb_qa_board CASCADE CONSTRAINTS;
DROP TABLE fb_photo_board CASCADE CONSTRAINTS;
DROP TABLE fb_board CASCADE CONSTRAINTS;

/* Drop Sequences */
DROP SEQUENCE SEQ_member_no;
DROP SEQUENCE SEQ_qa_no;
DROP SEQUENCE SEQ_board_no;
DROP SEQUENCE SEQ_photo_no;
DROP SEQUENCE SEQ_comment_no;

/* Create Sequences */
CREATE SEQUENCE SEQ_member_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_comment_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_qa_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_board_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_photo_no INCREMENT BY 1 START WITH 1 nocache nocycle;

/* Create Tables */
CREATE TABLE fb_member
(
	member_no number NOT NULL,
	member_name varchar2(500) NOT NULL,
	id varchar2(50) NOT NULL,
	pw varchar2(50) NOT NULL,
	address varchar2(50) NOT NULL,
	tel varchar2(50) NOT NULL,
	mail varchar2(50) NOT NULL,
	stamp number,
	point number,
	PRIMARY KEY (member_no)
);

CREATE TABLE fb_comment
(
	comment_no number NOT NULL,
	member_no number NOT NULL,
	board_no number NOT NULL,
	photo_no number NOT NULL,
	qa_no number NOT NULL,
	comment_content varchar2(2000) NOT NULL,
	comment_writer varchar2(50) NOT NULL,
	comment_date date NOT NULL,
	PRIMARY KEY (comment_no)
);

CREATE TABLE fb_qa_board
(
	boardcategory_no number not null,
	member_no number NOT NULL,
	qa_no number NOT NULL,
	qa_readcount number NOT NULL,
	qa_writer varchar2(100) NOT NULL,
	qa_content varchar2(2000) NOT NULL,
	qa_reg_date date NOT NULL,
	qa_upload varchar2(500) NOT NULL,
	qa_subject varchar2(200) NOT NULL,
	PRIMARY KEY (qa_no)
);


CREATE TABLE fb_photo_board
(
	boardcategory_no number not null,
	member_no number NOT NULL,
	photo_no number NOT NULL,
	photo_writer varchar2(100) NOT NULL,
	photo_content varchar2(2000) NOT NULL,
	photo_reg_date date NOT NULL,
	photo_upload varchar2(500) NOT NULL,
	photo_subject varchar2(200) NOT NULL,
	PRIMARY KEY (photo_no)
);


CREATE TABLE fb_board
(
	boardcategory_no number not null,
	member_no number NOT NULL,
	board_no number NOT NULL,
	board_readcount number NOT NULL,
	board_writer varchar2(100) NOT null,
	board_content varchar2(2000) NOT NULL,
	board_reg_date date NOT NULL,
	board_subject varchar2(200) NOT NULL,
	PRIMARY KEY (board_no)
);


CREATE TABLE fb_boardcategory
(
	boardcategory_no number NOT NULL,
	boardcategory_name varchar2(50) NOT NULL,
	PRIMARY KEY (boardcategory_no)
);


/* Create Foreign Keys */
ALTER TABLE fb_comment
	ADD CONSTRAINT fk_qa_no FOREIGN KEY (qa_no)
	REFERENCES fb_qa_board (qa_no) on delete cascade
;


ALTER TABLE fb_comment
	ADD CONSTRAINT fk_photo_no FOREIGN KEY (photo_no)
	REFERENCES fb_photo_board (photo_no) on delete cascade
;


ALTER TABLE fb_comment
	ADD CONSTRAINT fk_board_no FOREIGN KEY (board_no)
	REFERENCES fb_board (board_no) on delete cascade
;

alter table fb_board
add CONSTRAINT fk_fb_member_no foreign key (member_no)
references fb_member (member_no) on delete cascade;

alter table fb_photo_board
add CONSTRAINT fk_pb_member_no foreign key (member_no)
references fb_member (member_no) on delete cascade;

alter table fb_qa_board
add CONSTRAINT fk_qb_member_no foreign key (member_no)
references fb_member (member_no) on delete cascade;


/* Comments */
COMMENT ON COLUMN fb_tr_order.order_text IS '설명';

delete from fb_board;
delete from fb_qa_board;
delete from fb_photo_board;
delete from FB_COMMENT;
delete from fb_member;

select * from fb_board;
select * from fb_qa_board;
select * from fb_photo_board;
select * from FB_COMMENT;
select * from fb_member;

select SEQ_member_no.nextval from dual;
