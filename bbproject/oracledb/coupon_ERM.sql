DROP TABLE fb_coupon_book CASCADE CONSTRAINTS;
DROP TABLE fb_coupon CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_coupon_no;
DROP SEQUENCE SEQ_couponbook_no;

CREATE SEQUENCE SEQ_coupon_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_couponbook_no INCREMENT BY 1 START WITH 1 nocache nocycle;


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
	coupon_state number CHECK (coupon_state = 0 OR coupon_state = 1) not null,
	PRIMARY KEY (couponbook_no)
);


ALTER TABLE fb_coupon_book
	ADD CONSTRAINT fk_cb_cupon_no FOREIGN KEY (coupon_no)
	REFERENCES fb_coupon (coupon_no) on delete cascade
;


ALTER TABLE fb_coupon_book
	ADD CONSTRAINT fk_cb_member_no FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;

/* sql TEST */
insert into fb_coupon
values(SEQ_coupon_no.nextval, '10쿠폰', 10);
insert into FB_COUPON
values(SEQ_coupon_no.nextval, '30%쿠폰!', 30);
select * from fb_coupon order by coupon_no asc;

insert into fb_coupon_book
values(SEQ_couponbook_no.nextval, 4, 1, 0);
insert into fb_coupon_book
values(SEQ_couponbook_no.nextval, 4, 2, 0);
insert into fb_coupon_book
values(SEQ_couponbook_no.nextval, 4, 2, 1);
select * from FB_COUPON_BOOK;

update FB_COUPON set coupon_discount = coupon_discount+10
where coupon_no = 2

delete from FB_COUPON_BOOK

select *
from FB_MEMBER a, FB_COUPON_BOOK b, FB_COUPON c
where a.member_no = b.member_no(+) and b.coupon_no = c.coupon_no(+)
and a.member_no = (select member_no from fb_member where id = 'jaemin' and pw = 'woals132$');


select *
		from fb_member
		where id = #{id} and pw = #{pw}
		
select *
from FB_COUPON_BOOK
where member_no = 2
		
select * from fb_member
insert into fb_member values (SEQ_member_no.nextval, '관리자', 'admin', '1', '서울,구로,개봉', '010,3892,6638', 'pwljh@naver.com', 1000);
insert into fb_coupon_book values (SEQ_couponbook_no.nextval, '2', '1');

select * from fb_coupon_book

select * from fb_coupon

insert into fb_member values ('2', '이주훈', 'pwljh', '1', '서울시 /구로구 /개봉3동', '010-3842-4053', 'pwljh@naver.com', 0)
	
		
select * from fb_member
