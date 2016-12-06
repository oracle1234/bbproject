
/* Drop Triggers */

DROP TRIGGER TRI_fb_coupon_coupon_no;
DROP TRIGGER TRI_fb_foods_foods_no;
DROP TRIGGER TRI_fb_member_member_no;
DROP TRIGGER TRI_fb_coupon_book_couponbook_no;
DROP TRIGGER TRI_fb_delivery_cost_fb_delivery_no;
DROP TRIGGER TRI_fb_review_review_no;
DROP TRIGGER TRI_fb_theme_theme_no;
DROP TRIGGER TRI_fb_theme_recipe_recipe_no;
DROP TRIGGER TRI_fb_comment_comment_no;
DROP TRIGGER TRI_fb_board_board_no;
DROP TRIGGER TRI_fb_photo_board_photo_no;
DROP TRIGGER TRI_fb_qa_board_qa_no;



/* Drop Tables */

DROP TABLE fb_coupon_book CASCADE CONSTRAINTS;
DROP TABLE fb_coupon CASCADE CONSTRAINTS;
DROP TABLE fb_basket CASCADE CONSTRAINTS;
DROP TABLE fb_lately_product CASCADE CONSTRAINTS;
DROP TABLE fb_request CASCADE CONSTRAINTS;
DROP TABLE fb_review CASCADE CONSTRAINTS;
DROP TABLE fb_foods CASCADE CONSTRAINTS;
DROP TABLE fb_category CASCADE CONSTRAINTS;
DROP TABLE fb_tr_complete CASCADE CONSTRAINTS;
DROP TABLE fb_tr_order CASCADE CONSTRAINTS;
DROP TABLE fb_theme_recipe CASCADE CONSTRAINTS;
DROP TABLE fb_theme CASCADE CONSTRAINTS;
DROP TABLE fb_comment CASCADE CONSTRAINTS;
DROP TABLE fb_photo_board CASCADE CONSTRAINTS;
DROP TABLE fb_qa_board CASCADE CONSTRAINTS;
DROP TABLE fb_board CASCADE CONSTRAINTS;
DROP TABLE fb_member CASCADE CONSTRAINTS;
DROP TABLE fb_boardcategory CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_coupon_no;
DROP SEQUENCE SEQ_foods_no;
DROP SEQUENCE SEQ_member_no;
DROP SEQUENCE SEQ_couponbook_no;
DROP SEQUENCE SEQ_fb_delivery_no;
DROP SEQUENCE SEQ_review_no;
DROP SEQUENCE SEQ_theme_no;
DROP SEQUENCE SEQ_recipe_no;
DROP SEQUENCE SEQ_comment_no;
DROP SEQUENCE SEQ_board_no;
DROP SEQUENCE SEQ_photo_no;
DROP SEQUENCE SEQ_qa_no;




/* Create Sequences */

CREATE SEQUENCE SEQ_coupon_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_foods_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_member_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_couponbook_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_fb_delivery_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_review_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_theme_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_recipe_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_comment_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_board_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_photo_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_qa_no INCREMENT BY 1 START WITH 1;

/* Create Tables */
CREATE TABLE fb_coupon_book
(
	couponbook_no number NOT NULL,
	coupon_no number NOT NULL,
	member_no number NOT NULL,
	coupon_state number NOT NULL,
	PRIMARY KEY (couponbook_no)
);


CREATE TABLE fb_coupon
(
	coupon_no number NOT NULL,
	coupon_name varchar2(50) NOT NULL,
	coupon_discount number NOT NULL,
	PRIMARY KEY (coupon_no)
);


CREATE TABLE fb_basket
(
	amount number NOT NULL,
	member_no number NOT NULL,
	foods_no number NOT NULL
);


CREATE TABLE fb_lately_product
(
	member_no number NOT NULL,
	foods_no number NOT NULL,
	lately_no number NOT NULL
);


CREATE TABLE fb_category
(
	category_no number NOT NULL,
	category_name varchar2(50) NOT NULL,
	PRIMARY KEY (category_no)
);


CREATE TABLE fb_review
(
	review_no number NOT NULL,
	review_writer varchar2(50) NOT NULL,
	review_content varchar2(60) NOT NULL,
	review_date date NOT NULL,
	foods_no number NOT NULL,
	PRIMARY KEY (review_no)
);


CREATE TABLE fb_theme
(
	theme_no number NOT NULL,
	theme_name varchar2(500) NOT NULL,
	PRIMARY KEY (theme_no)
);


CREATE TABLE fb_photo_board
(
	photo_no number NOT NULL,
	member_no number NOT NULL,
	boardcategory_no number NOT NULL,
	photo_subject varchar2(200) NOT NULL,
	photo_content varchar2(2000) NOT NULL,
	photo_reg_date date NOT NULL,
	photo_upload varchar2(500) NOT NULL,
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


CREATE TABLE fb_tr_order
(
	recipe_no number NOT NULL,
	order_pic varchar2(500) NOT NULL,
	order_text varchar2(500) NOT NULL
);


CREATE TABLE fb_tr_complete
(
	recipe_no number NOT NULL,
	complete_pic varchar2(500) NOT NULL
);


CREATE TABLE fb_request
(
	member_no number NOT NULL,
	foods_no number NOT NULL,
	price number NOT NULL,
	amount number NOT NULL,
	day date NOT NULL,
	delivery_condition varchar2(50) NOT NULL,
	picture varchar2(500) NOT NULL
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


CREATE TABLE fb_foods
(
	foods_no number NOT NULL,
	category_no number NOT NULL,
	foods_name varchar2(50) NOT NULL,
	price number NOT NULL,
	weight varchar2(50) NOT NULL,
	way varchar2(50) NOT NULL,
	shelfLife varchar2(50) NOT NULL,
	foods_explaination varchar2(2000) NOT NULL,
	foods_material varchar2(2000) NOT NULL,
	picture varchar2(500) NOT NULL,
	PRIMARY KEY (foods_no)
);


CREATE TABLE fb_boardcategory
(
	boardcategory_no number NOT NULL,
	boardcategory_name varchar2(50) NOT NULL,
	PRIMARY KEY (boardcategory_no)
);


CREATE TABLE fb_theme_recipe
(
	recipe_no number NOT NULL,
	theme_no number NOT NULL,
	receipe_name varchar2(500) NOT NULL,
	recipe_material varchar2(500) NOT NULL,
	receipe_explaination varchar2(500) NOT NULL,
	picture varchar2(500) NOT NULL,
	portion varchar2(50) NOT NULL,
	time varchar2(50) NOT NULL,
	difficulty varchar2(10) NOT NULL,
	PRIMARY KEY (recipe_no)
);



/* Create Foreign Keys */

ALTER TABLE fb_coupon_book
	ADD FOREIGN KEY (coupon_no)
	REFERENCES fb_coupon (coupon_no) on delete cascade
;


ALTER TABLE fb_foods
	ADD FOREIGN KEY (category_no)
	REFERENCES fb_category (category_no) on delete cascade
;


ALTER TABLE fb_theme_recipe
	ADD FOREIGN KEY (theme_no)
	REFERENCES fb_theme (theme_no) on delete cascade
;


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


ALTER TABLE fb_photo_board
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_comment
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_request
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_coupon_book
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_lately_product
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;


ALTER TABLE fb_basket
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


ALTER TABLE fb_request
	ADD FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no) on delete cascade
;


ALTER TABLE fb_basket
	ADD FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no) on delete cascade
;


ALTER TABLE fb_review
	ADD FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no) on delete cascade
;


ALTER TABLE fb_lately_product
	ADD FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no) on delete cascade
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


ALTER TABLE fb_tr_complete
	ADD FOREIGN KEY (recipe_no)
	REFERENCES fb_theme_recipe (recipe_no) on delete cascade
;


ALTER TABLE fb_tr_order
	ADD FOREIGN KEY (recipe_no)
	REFERENCES fb_theme_recipe (recipe_no) on delete cascade
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_fb_coupon_coupon_no BEFORE INSERT ON fb_coupon
FOR EACH ROW
BEGIN
	SELECT SEQ_fb_coupon_coupon_no.nextval
	INTO :new.coupon_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_fb_foods_foods_no BEFORE INSERT ON fb_foods
FOR EACH ROW
BEGIN
	SELECT SEQ_fb_foods_foods_no.nextval
	INTO :new.foods_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_fb_member_member_no BEFORE INSERT ON fb_member
FOR EACH ROW
BEGIN
	SELECT SEQ_fb_member_member_no.nextval
	INTO :new.member_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_fb_coupon_book_couponbook_no BEFORE INSERT ON fb_coupon_book
FOR EACH ROW
BEGIN
	SELECT SEQ_fb_coupon_book_couponbook_no.nextval
	INTO :new.couponbook_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_fb_delivery_cost_fb_delivery_no BEFORE INSERT ON fb_delivery_cost
FOR EACH ROW
BEGIN
	SELECT SEQ_fb_delivery_cost_fb_delivery_no.nextval
	INTO :new.fb_delivery_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_fb_review_review_no BEFORE INSERT ON fb_review
FOR EACH ROW
BEGIN
	SELECT SEQ_fb_review_review_no.nextval
	INTO :new.review_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_fb_theme_theme_no BEFORE INSERT ON fb_theme
FOR EACH ROW
BEGIN
	SELECT SEQ_fb_theme_theme_no.nextval
	INTO :new.theme_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_fb_theme_recipe_recipe_no BEFORE INSERT ON fb_theme_recipe
FOR EACH ROW
BEGIN
	SELECT SEQ_fb_theme_recipe_recipe_no.nextval
	INTO :new.recipe_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_fb_comment_comment_no BEFORE INSERT ON fb_comment
FOR EACH ROW
BEGIN
	SELECT SEQ_fb_comment_comment_no.nextval
	INTO :new.comment_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_fb_board_board_no BEFORE INSERT ON fb_board
FOR EACH ROW
BEGIN
	SELECT SEQ_fb_board_board_no.nextval
	INTO :new.board_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_fb_photo_board_photo_no BEFORE INSERT ON fb_photo_board
FOR EACH ROW
BEGIN
	SELECT SEQ_fb_photo_board_photo_no.nextval
	INTO :new.photo_no
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_fb_qa_board_qa_no BEFORE INSERT ON fb_qa_board
FOR EACH ROW
BEGIN
	SELECT SEQ_fb_qa_board_qa_no.nextval
	INTO :new.qa_no
	FROM dual;
END;

/


select * from FB_COMMENT;
select * from qa_board;
select * from FB_MEMBER;
select * from fb_board;
