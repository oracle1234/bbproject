테이블명:fb_member
select * from fb_member;
insert into fb_member values 
(1, '백나연', 'nayeon', '111111', '서울시 강북구 수유동', 
01011111111, 'nayeon', 0, 0);
insert into fb_member values 
(2, '이주훈', 'joohoon', '222222', '구리', 
01022222222, 'joohoon', 0, 0);
insert into fb_member values 
(3, '김연성', 'yeonsung', '333333', '일산', 
01033333333, 'yeonsung', 0, 0);
insert into fb_member values 
(4, '유재민', 'jaemin', '444444', '종각', 
01044444444, 'jaemin', 0, 0);

테이블명:fb_category
select * from fb_category;
insert into fb_category values 
(1, '요리');
insert into fb_category values 
(2, '반찬');
insert into fb_category values 
(3, '국, 찌개');

테이블명:fb_delivery_cost
select * from fb_delivery_cost;
insert into fb_delivery_cost values
(1,2500)

테이블명:fb_foods
select * from fb_foods;
insert into fb_foods values
(1, '떡볶이', '3000', '100g', '냉장보관', '2016-11-16',
'맛있다','떡,고추장','img',001,001);
insert into fb_foods values
(2, '떡볶이2', '3000', '100g', '냉장보관', '2016-11-16',
'맛있다','떡,고추장','img',001,001);
insert into fb_foods values
(3, '떡볶이3', '3000', '100g', '냉장보관', '2016-11-16',
'맛있다','떡,고추장','img',001,001);

테이블명:fb_basket
select * from fb_basket;
insert into fb_basket values
(회원번호, 음식번호, 수량); 
insert into fb_basket values
(1, 3, 2);  
insert into fb_basket values
(1, 1, 1);
insert into fb_basket values
(1, 2, 7);
insert into fb_basket values
(2, 2, 1);


장바구니 조인 - 상품명, 상품가격, 수량, 적립금
select f.foods_name, f.price, b.amount, m.point
from fb_member m, fb_foods f, fb_basket b
where m.member_no=1
and m.member_no=b.member_no
and b.foods_no=f.foods_no;

장바구니 수량 변경
update fb_basket 
set amount=3
where foods_no=1;

장바구니 음식 삭제
delete from fb_basket
where foods_no=1;


--주훈오빠
select foods_no, price, amount
from fb_foods, fb_basket, fb_member
where fb_member=1
and a.fb_foods=b.fb_basket


select * from fb_foods where category_no = 1 order by foods_no desc

select *
		from fb_review r, fb_foods f
		where  r.foods_no = f.foods_no and r.foods_no = 1
		order by r.review_no desc
		
		select * from
		fb_foods f, fb_review r
		where f.foods_no = r.foods_no and
		r.foods_no = 1
		order by r.review_no desc
		
		
주문내역
select * from fb_request
insert into fb_request values
(1, 3000, 3, 1, sysdate, '배송전', 1);
insert into fb_request values
(1, 3000, 2, 1, sysdate, '배송완료', 2);
insert into fb_request values
(1, 3000, 3, 1, sysdate, '입금완료', 3);

주문조회 내역
select day, foods_no, price, delivery_condition, amount
from fb_request
where member_no=1;

쿠폰
select * from fb_coupon
insert into fb_coupon values
(1, '가입 선물', 2000);
insert into fb_coupon values
(2, '생일 선물', 3000);
insert into fb_coupon values
(3, '크리스마스 선물', 2500);

select * from FB_COUPON_BOOK
insert into FB_COUPON_BOOK values
(1, 1, 1, '미사용');
insert into FB_COUPON_BOOK values
(2, 1, 2, '미사용');
insert into FB_COUPON_BOOK values
(3, 1, 3, '사용');


select c.coupon_name, c.coupon_discount, b.coupon_state
from fb_coupon c, fb_coupon_book b
where member_no=1
and c.coupon_no = b.coupon_no;