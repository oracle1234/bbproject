select * from fb_review order by review_no desc

insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);


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
insert into fb_coupon_book values(SEQ_couponbook_no.nextval, 1, 1);
insert into fb_coupon_book values(SEQ_couponbook_no.nextval, 1, 4);
insert into fb_coupon_book values(SEQ_couponbook_no.nextval, 1, 3);


select * from fb_coupon
delete from fb_coupon where coupon_no = 2


insert into fb_coupon values
insert into fb_coupon values (SEQ_coupon_no.nextval, '축하쿠폰(-3000원)', 3000)



update fb_coupon set coupon_name = '회원가입 축하쿠폰 (-2000원)' where coupon_no = 1

select * from fb_member

update fb_member set address = '서울시 구로구 개봉로 11길 10-17 / 이화빌라 101호' where member_no = 1

select * from fb_basket


select * from fb_foods
