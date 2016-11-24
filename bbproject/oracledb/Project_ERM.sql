
/* Drop Tables */
DROP TABLE fb_lately_product CASCADE CONSTRAINTS;
DROP TABLE fb_coupon_book CASCADE CONSTRAINTS;
DROP TABLE fb_coupon CASCADE CONSTRAINTS;
DROP TABLE fb_request CASCADE CONSTRAINTS;
DROP TABLE fb_basket CASCADE CONSTRAINTS;
DROP TABLE fb_member CASCADE CONSTRAINTS;
DROP TABLE fb_review CASCADE CONSTRAINTS;
DROP TABLE fb_foods CASCADE CONSTRAINTS;
DROP TABLE fb_category CASCADE CONSTRAINTS;
DROP TABLE fb_delivery_cost CASCADE CONSTRAINTS;
DROP TABLE fb_comment CASCADE CONSTRAINTS;
DROP TABLE fb_qa_board CASCADE CONSTRAINTS;
DROP TABLE fb_photo_board CASCADE CONSTRAINTS;
DROP TABLE fb_board CASCADE CONSTRAINTS;
DROP TABLE fb_tr_order CASCADE CONSTRAINTS;
DROP TABLE fb_tr_complete CASCADE CONSTRAINTS;
DROP TABLE fb_theme_recipe CASCADE CONSTRAINTS;
DROP TABLE fb_theme CASCADE CONSTRAINTS;
DROP TABLE fb_boardcategory CASCADE CONSTRAINTS;

<<<<<<< HEAD


=======
>>>>>>> branch 'yeonsung' of https://github.com/oracle1234/bbproject.git
/* Drop Sequences */
DROP SEQUENCE SEQ_coupon_no;
DROP SEQUENCE SEQ_couponbook_no;
DROP SEQUENCE SEQ_member_no;
DROP SEQUENCE SEQ_category_no;
DROP SEQUENCE SEQ_fb_delivery_no;
DROP SEQUENCE SEQ_foods_no;
DROP SEQUENCE SEQ_recipe_no;
DROP SEQUENCE SEQ_comment_no;
DROP SEQUENCE SEQ_qa_no;
DROP SEQUENCE SEQ_board_no;
DROP SEQUENCE SEQ_photo_no;
DROP SEQUENCE SEQ_theme_no;
DROP SEQUENCE SEQ_order_no;
DROP SEQUENCE SEQ_complete_no;
DROP SEQUENCE SEQ_review_no;
DROP SEQUENCE SEQ_boardcategory_no;

/* Create Sequences */
CREATE SEQUENCE SEQ_coupon_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_couponbook_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_member_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_category_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_fb_delivery_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_foods_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_recipe_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_comment_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_qa_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_board_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_photo_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_theme_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_order_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_complete_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_review_no INCREMENT BY 1 START WITH 1 nocache nocycle;
<<<<<<< HEAD


=======
CREATE SEQUENCE SEQ_boardcategory_no INCREMENT BY 1 START WITH 1 nocache nocycle;
>>>>>>> branch 'yeonsung' of https://github.com/oracle1234/bbproject.git

/* Create Tables */

CREATE TABLE fb_lately_product
(
	member_no number NOT NULL,
	foods_no number NOT NULL,
	lately_no number NOT NULL
);

CREATE TABLE fb_coupon
(
	coupon_no number NOT NULL,
	coupon_name varchar2(50) NOT NULL,
	coupon_discount number NOT NULL,
	PRIMARY KEY (coupon_no)
);


CREATE TABLE fb_coupon_book
(
	couponbook_no number NOT NULL,
	member_no number NOT NULL,
	coupon_no number NOT NULL,
	coupon_state varchar2(10) not null,
	PRIMARY KEY (couponbook_no)
);


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


CREATE TABLE fb_request
(
	member_no number NOT NULL,
	price number NOT NULL,
	amount number NOT NULL,
	picture number NOT NULL,
	day date NOT NULL,
	delivery_condition varchar2(50) NOT NULL,
	foods_no number NOT NULL
);


CREATE TABLE fb_category
(
	category_no number NOT NULL,
	category_name varchar2(50) NOT NULL,
	PRIMARY KEY (category_no)
);


CREATE TABLE fb_boardcategory
(
	boardcategory_no number NOT NULL,
	boardcategory_name varchar2(50) NOT NULL,
	PRIMARY KEY (boardcategory_no)
);


CREATE TABLE fb_basket
(
	member_no number NOT NULL,
	foods_no number NOT NULL,
	amount number NOT NULL
);


CREATE TABLE fb_delivery_cost
(
	fb_delivery_no number NOT NULL,
	fb_delivery_cost number NOT NULL,
	PRIMARY KEY (fb_delivery_no)
);


CREATE TABLE fb_foods
(
	foods_no number NOT NULL,
	foods_name varchar2(50) NOT NULL,
	price number NOT NULL,
	weight varchar2(50) NOT NULL,
	way varchar2(50) NOT NULL,
	shelfLife varchar2(50) NOT NULL,
	foods_explaination varchar2(2000) NOT NULL,
	foods_material varchar2(2000) NOT NULL,
	picture varchar2(500) NOT NULL,
	category_no number NOT NULL,
	fb_delivery_no number NOT NULL,
	PRIMARY KEY (foods_no)
);

--reivew테이블 member_no 추가
alter table FB_REVIEW add member_no number
ALTER TABLE fb_review modify member_no NOT NULL

CREATE TABLE fb_review
(
	review_no number NOT NULL,
	review_writer varchar2(50),
	review_content varchar2(100) NOT NULL,
	review_date date,
	foods_no number NOT NULL,
	member_no number NOT NULL,
	PRIMARY KEY (review_no)
);

--review_content 컬럼 크기변경
alter table fb_review MODIFY (review_content varchar2(100));


CREATE TABLE fb_comment
(
	comment_no number NOT NULL,
	board_no number NOT NULL,
	photo_no number NOT NULL,
	qa_no number NOT NULL,
	comment_content varchar2(2000) NOT NULL,
	comment_writer varchar2(50) NOT NULL,
	comment_date date,
	PRIMARY KEY (comment_no)
);


create table fb_boardcategory
(
boardcategory_no number not null,
boardcategory_name varchar2(20) not null,
primary key (boardcategory_no)
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
	boardcategory_no number not null,
	member_no number NOT NULL,
	board_no number NOT NULL,
	board_readcount number NOT NULL,
	board_writer varchar2(100),
	board_content varchar2(2000) NOT NULL,
	board_reg_date date NOT NULL,
	board_subject varchar2(200) NOT NULL,
	PRIMARY KEY (board_no)
);
<<<<<<< HEAD

=======

>>>>>>> branch 'yeonsung' of https://github.com/oracle1234/bbproject.git

CREATE TABLE fb_theme_recipe
(
	recipe_no number NOT NULL,
	theme_no number NOT NULL,
	recipe_name varchar2(500) NOT NULL,
	recipe_material varchar2(500) NOT NULL,
	recipe_explaination varchar2(500) NOT NULL,
	picture varchar2(500) NOT NULL,
	portion varchar2(50) NOT NULL,
	time varchar2(50) NOT NULL,
	difficulty varchar2(10) NOT NULL,
	PRIMARY KEY (recipe_no)
);


CREATE TABLE fb_theme
(
	theme_no number NOT NULL,
	theme_name varchar2(500) NOT NULL,
	PRIMARY KEY (theme_no)
);


CREATE TABLE fb_tr_order
(
	order_no number NOT NULL,
	recipe_no number NOT NULL,
	order_pic varchar2(50),
	-- 설명
	order_text varchar2(100),
	PRIMARY KEY (order_no)
);


CREATE TABLE fb_tr_complete
(
	recipe_no number NOT NULL,
<<<<<<< HEAD
	complete_pic varchar2(50),


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


CREATE TABLE fb_theme_recipe
(
	recipe_no number NOT NULL,
	theme_no number NOT NULL,
	recipe_name varchar2(500) NOT NULL,
	recipe_material varchar2(500) NOT NULL,
	recipe_explaination varchar2(500) NOT NULL,
	picture varchar2(500) NOT NULL,
	portion varchar2(50) NOT NULL,
	recipe_time varchar2(50) NOT NULL,
	difficulty varchar2(10) NOT NULL,
	PRIMARY KEY (recipe_no)
);


CREATE TABLE fb_theme
(
	theme_no number NOT NULL,
	theme_name varchar2(500) NOT NULL,
	PRIMARY KEY (theme_no)
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
=======
	complete_pic varchar2(50)
>>>>>>> branch 'yeonsung' of https://github.com/oracle1234/bbproject.git
);



/* Create Foreign Keys */

ALTER TABLE fb_coupon_book
	ADD FOREIGN KEY (coupon_no)
	REFERENCES fb_coupon (coupon_no)
;


ALTER TABLE fb_request
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no)
;


ALTER TABLE fb_coupon_book
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no)
;


ALTER TABLE fb_lately_product
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no)
;


ALTER TABLE fb_basket
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no)
;


ALTER TABLE fb_foods
	ADD FOREIGN KEY (category_no)
	REFERENCES fb_category (category_no)
;


ALTER TABLE fb_foods
	ADD FOREIGN KEY (fb_delivery_no)
	REFERENCES fb_delivery_cost (fb_delivery_no)
;


ALTER TABLE fb_lately_product
	ADD FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no)
;


ALTER TABLE fb_basket
	ADD FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no)
;

-- review 테이블 member_no 외부키 추가 (주훈 수정)
ALTER TABLE fb_review
	ADD FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no)
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no)
;


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


ALTER TABLE fb_tr_order
	ADD FOREIGN KEY (recipe_no)
	REFERENCES fb_theme_recipe (recipe_no)
;


ALTER TABLE fb_tr_complete
	ADD FOREIGN KEY (recipe_no)
	REFERENCES fb_theme_recipe (recipe_no)
;


ALTER TABLE fb_theme_recipe
	ADD FOREIGN KEY (theme_no)
	REFERENCES fb_theme (theme_no)
;

---------------------------------------------------나연 추가
alter table fb_qa_board
add foreign key (member_no)
references fb_member (member_no);
---------------------------------------------------나연 추가
alter table fb_board
add foreign key (member_no)
references fb_member (member_no);

alter table fb_photo_board
add foreign key (member_no)
references fb_member (member_no);

/* Comments */
COMMENT ON COLUMN fb_tr_order.order_text IS '설명';


