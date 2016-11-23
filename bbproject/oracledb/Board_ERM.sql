
/* Drop Tables */
DROP TABLE fb_member CASCADE CONSTRAINTS;
DROP TABLE fb_comment CASCADE CONSTRAINTS;
DROP TABLE fb_qa_board CASCADE CONSTRAINTS;
DROP TABLE fb_photo_board CASCADE CONSTRAINTS;
DROP TABLE fb_board CASCADE CONSTRAINTS;

/* Drop Sequences */
DROP SEQUENCE SEQ_member_no;
DROP SEQUENCE SEQ_comment_no;
DROP SEQUENCE SEQ_qa_no;
DROP SEQUENCE SEQ_board_no;
DROP SEQUENCE SEQ_photo_no;

/* Create Sequences */
CREATE SEQUENCE SEQ_member_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_comment_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_qa_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_board_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_photo_no INCREMENT BY 1 START WITH 1 nocache nocycle;

select * from fb_board;
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
	board_no number NOT NULL,
	photo_no number NOT NULL,
	qa_no number NOT NULL,
	comment_ref number NOT NULL,
	comment_re_step number NOT NULL,
	comment_re_level number NOT NULL,
	comment_content varchar2(2000) NOT NULL,
	comment_writer varchar2(50) NOT NULL,
	comment_date date,
	PRIMARY KEY (comment_no)
);

CREATE TABLE fb_qa_board
(
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
	member_no number NOT NULL,
	photo_no number NOT NULL,
	photo_readcount number NOT NULL,
	photo_writer varchar2(100) NOT NULL,
	photo_content varchar2(2000) NOT NULL,
	photo_reg_date date NOT NULL,
	photo_upload varchar2(500) NOT NULL,
	photo_subject varchar2(200) NOT NULL,
	PRIMARY KEY (photo_no)
);

CREATE TABLE fb_board
(
	member_no number NOT NULL,
	board_no number NOT NULL,
	board_readcount number NOT NULL,
	board_writer varchar2(100),
	board_content varchar2(2000) NOT NULL,
	board_reg_date date NOT NULL,
	board_subject varchar2(200) NOT NULL,
	PRIMARY KEY (board_no)
);

CREATE TABLE fb_tr_order
(
	order_no number NOT NULL,
	recipe_no number NOT NULL,
	order_pic varchar2(500),
	order_text varchar2(500),
	PRIMARY KEY (order_no)
);


CREATE TABLE fb_tr_complete
(
	complete_no number NOT NULL,
	recipe_no number NOT NULL,
	complete_pic varchar2(500),
	PRIMARY KEY (complete_no)
);



/* Create Foreign Keys */
ALTER TABLE fb_comment
	ADD FOREIGN KEY (qa_no)
	REFERENCES fb_qa_board (qa_no)
;


ALTER TABLE fb_comment
	ADD FOREIGN KEY (photo_no)
	REFERENCES fb_photo_board (photo_no)
;


ALTER TABLE fb_comment
	ADD FOREIGN KEY (board_no)
	REFERENCES fb_board (board_no)
;

alter table fb_board
add foreign key (member_no)
references fb_member (member_no);

alter table fb_photo_board
add foreign key (member_no)
references fb_member (member_no);

alter table fb_qa_board
add foreign key (member_no)
references fb_member (member_no);


/* Comments */
COMMENT ON COLUMN fb_tr_order.order_text IS '설명';

select * from fb_board;
select * from fb_qa_board;
select * from fb_qa_board;
