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
(2, 2, 1);
insert into fb_basket values
(1, 1, 1);

select foods_no, price, amount
from fb_foods, fb_basket, fb_member
where fb_member=1
and a.fb_foods=b.fb_basket


select * from fb_foods where category_no = 1 order by foods_no desc


