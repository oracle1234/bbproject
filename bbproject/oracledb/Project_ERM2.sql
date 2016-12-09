
/* Drop Tables */

DROP TABLE fb_tr_order CASCADE CONSTRAINTS;
DROP TABLE fb_tr_complete CASCADE CONSTRAINTS;
DROP TABLE fb_theme_recipe CASCADE CONSTRAINTS;
DROP TABLE fb_lately_product CASCADE CONSTRAINTS;
DROP TABLE fb_comment CASCADE CONSTRAINTS;
DROP TABLE fb_board CASCADE CONSTRAINTS;
DROP TABLE fb_photo_board CASCADE CONSTRAINTS;
DROP TABLE fb_basket CASCADE CONSTRAINTS;
DROP TABLE fb_review CASCADE CONSTRAINTS;
DROP TABLE fb_request CASCADE CONSTRAINTS;
DROP TABLE fb_foods CASCADE CONSTRAINTS;
DROP TABLE fb_category CASCADE CONSTRAINTS;
DROP TABLE fb_qa_board CASCADE CONSTRAINTS;
DROP TABLE fb_boardcategory CASCADE CONSTRAINTS;
DROP TABLE fb_theme CASCADE CONSTRAINTS;
DROP TABLE fb_coupon_book CASCADE CONSTRAINTS;
DROP TABLE fb_coupon CASCADE CONSTRAINTS;
DROP TABLE fb_member CASCADE CONSTRAINTS;


/* Drop Sequences */

DROP SEQUENCE SEQ_coupon_no;
DROP SEQUENCE SEQ_couponbook_no;
DROP SEQUENCE SEQ_member_no;
DROP SEQUENCE SEQ_category_no;
DROP SEQUENCE SEQ_foods_no;
DROP SEQUENCE SEQ_recipe_no;
DROP SEQUENCE SEQ_comment_no;
DROP SEQUENCE SEQ_qa_no;
DROP SEQUENCE SEQ_board_no;
DROP SEQUENCE SEQ_photo_no;
DROP SEQUENCE SEQ_theme_no;
DROP SEQUENCE SEQ_review_no;
DROP SEQUENCE SEQ_boardcategory_no;
DROP SEQUENCE SEQ_lately_no;


/* Create Sequences */

CREATE SEQUENCE SEQ_coupon_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_couponbook_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_member_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_category_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_foods_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_recipe_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_comment_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_qa_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_board_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_photo_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_theme_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_review_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_boardcategory_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_lately_no INCREMENT BY 1 START WITH 1 nocache nocycle;


/* Create Tables */

CREATE TABLE fb_tr_order
(
	recipe_no number NOT NULL,
	order_pic varchar2(2000) NOT NULL,
	order_text varchar2(2000) NOT NULL
);


CREATE TABLE fb_tr_complete
(
	recipe_no number NOT NULL,
	complete_pic varchar2(2000) NOT NULL
);


CREATE TABLE fb_theme_recipe
(
	recipe_no number NOT NULL,
	theme_no number NOT NULL,
	recipe_name varchar2(2000) NOT NULL,
	recipe_material varchar2(2000) NOT NULL,
	recipe_explaination varchar2(2000) NOT NULL,
	picture varchar2(2000) NOT NULL,
	portion varchar2(2000) NOT NULL,
	recipe_time varchar2(2000) NOT NULL,
	difficulty varchar2(2000) NOT NULL,
	PRIMARY KEY (recipe_no)
);


CREATE TABLE fb_lately_product
(
	lately_no number NOT NULL,
	member_no number NOT NULL,
	foods_no number NOT NULL,
	PRIMARY KEY (lately_no)
);


CREATE TABLE fb_board
(
	board_no number NOT NULL,
	member_no number NOT NULL,
	boardcategory_no number NOT NULL,
	board_subject varchar2(2000) NOT NULL,
	board_content varchar2(2000) NOT NULL,
	board_readcount number NOT NULL,
	board_reg_date date NOT NULL,
	board_writer varchar2(2000) NOT NULL,
	PRIMARY KEY (board_no)
);


CREATE TABLE fb_photo_board
(
	photo_no number NOT NULL,
	member_no number NOT NULL,
	boardcategory_no number NOT NULL,
	photo_subject varchar2(2000) NOT NULL,
	photo_content varchar2(2000) NOT NULL,
	photo_reg_date date NOT NULL,
	photo_upload varchar2(2000) NOT NULL,
	photo_writer varchar2(2000) NOT NULL,
	PRIMARY KEY (photo_no)
);


CREATE TABLE fb_comment
(
	comment_no number NOT NULL,
	board_no number NOT NULL,
	qa_no number NOT NULL,
	photo_no number NOT NULL,
	comment_content varchar2(2000) NOT NULL,
	comment_writer varchar2(2000) NOT NULL,
	comment_date date NOT NULL,
	member_no number NOT NULL,
	PRIMARY KEY (comment_no)
);


CREATE TABLE fb_basket
(
	member_no number NOT NULL,
	foods_no number NOT NULL,
	amount number NOT NULL
);


CREATE TABLE fb_category
(
	category_no number NOT NULL,
	category_name varchar2(2000) NOT NULL,
	PRIMARY KEY (category_no)
);


CREATE TABLE fb_boardcategory
(
	boardcategory_no number NOT NULL,
	boardcategory_name varchar2(2000) NOT NULL,
	PRIMARY KEY (boardcategory_no)
);


CREATE TABLE fb_qa_board
(
	qa_no number NOT NULL,
	member_no number NOT NULL,
	boardcategory_no number NOT NULL,
	qa_subject varchar2(2000) NOT NULL,
	qa_content varchar2(2000) NOT NULL,
	qa_readcount number NOT NULL,
	qa_reg_date date NOT NULL,
	qa_upload varchar2(2000),
	qa_writer varchar2(2000) NOT NULL,
	PRIMARY KEY (qa_no)
);


CREATE TABLE fb_theme
(
	theme_no number NOT NULL,
	theme_name varchar2(2000) NOT NULL,
	PRIMARY KEY (theme_no)
);


CREATE TABLE fb_coupon
(
	coupon_no number NOT NULL,
	coupon_name varchar2(2000) NOT NULL,
	coupon_discount number NOT NULL,
	PRIMARY KEY (coupon_no)
);


CREATE TABLE fb_coupon_book
(
	couponbook_no number NOT NULL,
	member_no number NOT NULL,
	coupon_no number NOT NULL,
	PRIMARY KEY (couponbook_no)
);


CREATE TABLE fb_foods
(
	foods_no number NOT NULL,
	foods_name varchar2(2000) NOT NULL,
	price number NOT NULL,
	weight varchar2(2000) NOT NULL,
	way varchar2(2000) NOT NULL,
	shelfLife varchar2(2000) NOT NULL,
	foods_explaination varchar2(2000) NOT NULL,
	foods_material varchar2(2000) NOT NULL,
	picture varchar2(2000) NOT NULL,
	category_no number NOT NULL,
	PRIMARY KEY (foods_no)
);


CREATE TABLE fb_request
(
	member_no number NOT NULL,
	price number NOT NULL,
	amount number NOT NULL,
	day date NOT NULL,
	delivery_condition varchar2(2000) NOT NULL,
	foods_no number NOT NULL,
	foods_name varchar2(2000) NOT NULL
);


CREATE TABLE fb_member
(
	member_no number NOT NULL,
	member_name varchar2(2000) NOT NULL,
	id varchar2(2000) NOT NULL UNIQUE,
	pw varchar2(2000) NOT NULL UNIQUE,
	address varchar2(2000) NOT NULL,
	tel varchar2(2000) NOT NULL UNIQUE,
	mail varchar2(2000) NOT NULL UNIQUE,
	point number,
	PRIMARY KEY (member_no)
);


CREATE TABLE fb_review
(
	member_no number NOT NULL,
	review_no number NOT NULL,
	review_writer varchar2(2000) NOT NULL,
	review_content varchar2(2000) NOT NULL,
	review_date date NOT NULL,
	foods_no number NOT NULL,
	PRIMARY KEY (review_no)
);



/* Create Foreign Keys */

ALTER TABLE fb_tr_complete
	ADD CONSTRAINT fk_trc_recipe_no FOREIGN KEY (recipe_no)
	REFERENCES fb_theme_recipe (recipe_no) on delete cascade
;


ALTER TABLE fb_tr_order
	ADD CONSTRAINT fk_tro_recipe_no FOREIGN KEY (recipe_no)
	REFERENCES fb_theme_recipe (recipe_no) on delete cascade
;


ALTER TABLE fb_comment
	ADD CONSTRAINT fk_comment_board_no FOREIGN KEY (board_no)
	REFERENCES fb_board (board_no) on delete cascade
;


ALTER TABLE fb_comment
	ADD CONSTRAINT fk_comment_photo_no FOREIGN KEY (photo_no)
	REFERENCES fb_photo_board (photo_no) on delete cascade
;


ALTER TABLE fb_foods
	ADD CONSTRAINT fk_foods_category_no FOREIGN KEY (category_no)
	REFERENCES fb_category (category_no) on delete cascade
;


ALTER TABLE fb_board
	ADD CONSTRAINT fk_board_boardcategory_no FOREIGN KEY (boardcategory_no)
	REFERENCES fb_boardcategory (boardcategory_no) on delete cascade
;


ALTER TABLE fb_photo_board
	ADD CONSTRAINT fk_pboard_boardcategory_no FOREIGN KEY (boardcategory_no)
	REFERENCES fb_boardcategory (boardcategory_no) on delete cascade
;


ALTER TABLE fb_qa_board
	ADD CONSTRAINT fk_qboard_boardcategory_no FOREIGN KEY (boardcategory_no)
	REFERENCES fb_boardcategory (boardcategory_no) on delete cascade
;


ALTER TABLE fb_comment
	ADD CONSTRAINT fk_comment_qa_no FOREIGN KEY (qa_no)
	REFERENCES fb_qa_board (qa_no) on delete cascade
;


ALTER TABLE fb_theme_recipe
	ADD CONSTRAINT fk_tr_theme_no FOREIGN KEY (theme_no)
	REFERENCES fb_theme (theme_no) on delete cascade
;


ALTER TABLE fb_coupon_book
	ADD CONSTRAINT fk_cb_coupon_no FOREIGN KEY (coupon_no)
	REFERENCES fb_coupon (coupon_no) on delete cascade
;


ALTER TABLE fb_lately_product
	ADD CONSTRAINT fk_lp_foods_no FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no) on delete cascade
;


ALTER TABLE fb_review
	ADD CONSTRAINT fk_review_foods_no FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no) on delete cascade
;


ALTER TABLE fb_request
	ADD CONSTRAINT fk_request_foods_no FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no) on delete cascade
;


ALTER TABLE fb_basket
	ADD CONSTRAINT fk_basket_foods_no FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no) on delete cascade
;


ALTER TABLE fb_board
	ADD CONSTRAINT fk_board_member_no FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_comment
	ADD CONSTRAINT fk_comment_member_no FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_basket
	ADD CONSTRAINT fk_basket_member_no FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_coupon_book
	ADD CONSTRAINT fk_cb_member_no FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_lately_product
	ADD CONSTRAINT fk_lp_member_no FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_photo_board
	ADD CONSTRAINT fk_pboard_member_no FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_qa_board
	ADD CONSTRAINT fk_qboard_member_no FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_review
	ADD CONSTRAINT fk_review_member_no FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_request
	ADD CONSTRAINT fk_request_member_no FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;

select * from FB_COMMENT;
select * from fb_board;
