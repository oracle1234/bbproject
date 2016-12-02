select * from fb_review order by review_no desc

insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);


select count(*) from fb_foods where category_no = 3

drop table fb_review;
select * from fb_foods

select * from fb_category
select * from fb_member


drop table fb_category;
drop table fb_member;
drop table fb_foods
drop table fb_basket
drop table fb_coupon
drop table fb_delivery_cost
drop table fb_review
drop table fb_lately_product

select * from fb_member

delete from fb_review where review_no = 169;


delete from fb_review where review_no = 172 and member_no = 1 and foods_no = 2

select * from fb_review 

update fb_review set review_content = '맛없어요' where review_no = 100 and member_no = 1;




update fb_review set review_content = '12345' where review_no = 99 and member_no = 1

select * from fb_basket
member_no, foods_no, amount
insert into fb_basket values (1, 1, 1)

select * from fb_foods where foods_no= 1 order by foods_no desc

select * from 

select * from fb_member

select *
		from FB_MEMBER a, FB_COUPON_BOOK b, FB_COUPON c
		where a.member_no = b.member_no(+) and b.coupon_no = c.coupon_no(+)
		and a.member_no = (select member_no from fb_member where id ='asdf' and pw = '1234')
		
select * from fb_coupon_book
insert into fb_coupon_book values(SEQ_couponbook_no.nextval, 1, 1, 'yes');
insert into fb_coupon_book values(SEQ_couponbook_no.nextval, 1, 2, 'no');
insert into fb_coupon_book values(SEQ_couponbook_no.nextval, 1, 3, 'yes');


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


