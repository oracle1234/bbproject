select * from fb_review order by review_no desc

insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);

select * from fb_coupon
select * from fb_coupon_book


select count(*) from fb_foods where category_no = 3

drop table fb_review;
select * from fb_foods

select * from fb_category
select * from fb_member

drop table fb_foods

drop table fb_member;
drop table fb_request
drop table fb_category;
drop table fb_foods
drop table fb_lately_product
drop table fb_basket
drop table fb_review
drop table fb_coupon;
drop table fb_coupon_book;
drop table fb_delivery_cost

select * from fb_member

delete from fb_review where review_no = 169;


delete from fb_review where review_no = 172 and member_no = 1 and foods_no = 2

select * from fb_review 



select * from fb_basket
insert into fb_basket values (1, 1, 1)

select * from fb_foods where foods_no= 1 order by foods_no desc

select * from 

select * from fb_member

select *
		from FB_MEMBER a, FB_COUPON_BOOK b, FB_COUPON c
		where a.member_no = b.member_no(+) and b.coupon_no = c.coupon_no(+)
		and a.member_no = (select member_no from fb_member where id ='asdf' and pw = '1234')
		
select * from fb_coupon_book
insert into fb_coupon_book values(SEQ_couponbook_no.nextval, 1, 1);
insert into fb_coupon_book values(SEQ_couponbook_no.nextval, 1, 2);
insert into fb_coupon_book values(SEQ_couponbook_no.nextval, 1, 3);
insert into fb_coupon_book values(SEQ_couponbook_no.nextval, 1, 4);

insert into fb_coupon values(SEQ_coupon_no.nextval, '회원가입쿠폰', 2000);
insert into fb_coupon values(SEQ_coupon_no.nextval, '축하쿠폰', 3000);
insert into fb_coupon values(SEQ_coupon_no.nextval, '쿠폰', 2000);
insert into fb_coupon values(SEQ_coupon_no.nextval, '대박쿠폰', 5000);

select * from fb_coupon
select * from fb_coupon_book
delete from fb_coupon where coupon_no = 2

insert into 

insert into fb_coupon values
insert into fb_coupon values (SEQ_coupon_no.nextval, '쿠폰(-10000원)', 10000)



update fb_coupon set coupon_name = '회원가입 축하쿠폰 (-2000원)' where coupon_no = 1

select * from fb_member

update fb_member set address = '서울 어딘가/00빌라 21355호/534433' where member_no = 3

select * from fb_basket

FB_MEMBER a, FB_COUPON_BOOK b, FB_COUPON

select * from fb_member
select * from FB_COUPON_BOOK
select * from FB_COUPON
select * from fb_review



select * from fb_foods order by foods_no desc;

insert into fb_foods
		values(SEQ_foods_no.nextval, #{foods_name}, #{price}, #{weight}, #{way}, #{shelfLife},
		#{foods_explaination}, #{foods_material}, #{picture}, #{category_no})
		
alter table fb_foods drop column fb_delivery_no;

ALTER TABLE fb_foods
	ADD FOREIGN KEY (fb_delivery_no)
	REFERENCES fb_delivery_cost (fb_delivery_no)
;

ALTER TABLE fb_tr_order
	ADD CONSTRAINT fk_order_recipe_no FOREIGN KEY (recipe_no)
	REFERENCES fb_theme_recipe (recipe_no) on delete cascade
;

fb_foods

select *
from fb_basket
where member_no = 4

select * from fb_member

select a.amount, c.foods_no, c.foods_name, c.price
from fb_basket a, fb_member b, fb_foods c 
where a.member_no = b.member_no
and a.foods_no = c.foods_no
and a.member_no = 4 and a.foods_no = 7

update fb_member set point = 2000 where member_no = 1;

update fb_member set pw = '1' where id='qwer';
select * from fb_member

select * from fb_category
insert into fb_category values (SEQ_category_no.nextval, '국/찌개');
insert into fb_category values (SEQ_category_no.nextval, '반찬');
insert into fb_category values (SEQ_category_no.nextval, '김치');

select * from fb_foods

insert into fb_lately_product values('')
select * from fb_lately_product


ALTER TABLE fb_lately_product
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no)
	ADD FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no)
;

ALTER TABLE fb_foods
	ADD FOREIGN KEY (category_no)
	REFERENCES fb_category (category_no)
;

select * from fb_member

CREATE TABLE fb_lately_product
(
	lately_no number NOT NULL,
	member_no number NOT NULL,
	foods_no number NOT NULL
);


select a.amount, c.foods_no, c.foods_name, c.price
		from fb_basket a, fb_member b, fb_foods c 
		where a.member_no = b.member_no
		and a.foods_no = c.foods_no
		and a.member_no = 1 and a.foods_no = 2
		
		
select * from fb_member
delete from fb_basket where foods_no = 2

select count(*) from fb_basket
where member_no = 1 and foods_no = 2

update fb_member set point = point + 400 where member_no=1;
select * from fb_member


update fb_member set point = point + 500 where member_no= 1;

select * from fb_request


select * from fb_member

insert into fb_request values(1, 3000, 3, 3, sysdate, '주문완료', 1);

alter table fb_request add column foods_no varchar2(20);
alter table fb_request add column foods_name varchar2(30);

alter table fb_request 

drop table fb_reqeust

select * from fb_coupon_book

delete from fb_coupon_book where member_no = 1 and coupon_no = 1;

select b.*, c.*
		from FB_MEMBER a, FB_COUPON_BOOK b, FB_COUPON c
		where a.member_no = b.member_no and b.coupon_no = c.coupon_no
		and a.member_no = (select member_no from fb_member where member_no = 1)

		
select * from fb_coupon_book

select * from fb_coupon

select * from fb_request

drop table fb_request

insert into fb_category values()

----------------------------------------------테이블 변경사항 저장---------------------------------------------------------
CREATE TABLE fb_request
(
	member_no number NOT NULL,
	foods_no number NOT NULL,
	price number NOT NULL,
	amount number NOT NULL,
	day date NOT NULL,
	delivery_condition varchar2(50) NOT NULL,
	foods_name varchar2(100) NOT NULL
);

--foods_no 외래키 추가
ALTER TABLE fb_request
	ADD FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no)
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no)
;

--stats 컬럼 삭제
CREATE TABLE fb_coupon_book
(
	couponbook_no number NOT NULL,
	member_no number NOT NULL,
	coupon_no number NOT NULL,
	PRIMARY KEY (couponbook_no)
);

ALTER TABLE fb_coupon_book
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no)
	ADD FOREIGN KEY (coupon_no)
	REFERENCES fb_coupon (coupon_no)
;


--delivery_no 컬럼 삭제
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
	PRIMARY KEY (foods_no)
);

ALTER TABLE fb_foods
	ADD FOREIGN KEY (category_no)
	REFERENCES fb_category (category_no)
;

--member_no 컬럼추가, review_content 컬럼 크기변경
CREATE TABLE fb_review
(
	member_no number NOT NULL,
	review_no number NOT NULL,
	review_writer varchar2(50),
	review_content varchar2(100) NOT NULL,
	review_date date,
	foods_no number NOT NULL,
	PRIMARY KEY (review_no)
);


ALTER TABLE fb_review
	ADD CONSTRAINT fk_review_foods_no FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no) on delete cascade
	ADD CONSTRAINT fk_review_member_no FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;

--테이블 순서변경
CREATE TABLE fb_lately_product
(
	lately_no number NOT NULL,
	member_no number NOT NULL,
	foods_no number NOT NULL
	PRIMARY KEY (lately_no)
);

--외래키 변경
ALTER TABLE fb_lately_product
	ADD FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no)
	ADD FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no)
;

CREATE SEQUENCE SEQ_lately_no INCREMENT BY 1 START WITH 1 nocache nocycle;

----------------------------------------------테이블 변경사항 저장---------------------------------------------------------

