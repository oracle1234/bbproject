테이블명:fb_member
select * from fb_member;

alter table fb_member drop (stamp);
select * from fb_request;
select * from fb_basket;
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
01044444444, 'jaemin',0, 0, 0);
insert into fb_member values 
<<<<<<< HEAD
(0, '관리자', 'admin', 'admin', '종각', '01044444444', 'admin.com', 0);
=======
(1, '관리자', 'admin', 'admin', '종각', 
01044444444, 'admin', 0, 0);

select *
	from fb_request
where member_no=1 and 
    day >= to_date('2016-11-11','yyyy-mm-dd')
    and day < to_date('2016-12-7','yyyy-mm-dd')+1;
    

	select *
	from fb_request
where member_no=1 and 
    day >= to_date('2016-11-11','YYYY-MM-DD')
    and day <= to_date('2016-12-5','YYYY-MM-DD')

	
	
>>>>>>> refs/remotes/origin/min
	split
	select id
	from fb_member
	where member_name='유재민' and mail='jaemin@paran.com,'
	
		select pw
	from fb_member
	where id='jaemin' and member_name='유재민' and mail='jaemin@paran.com,'
	
	
		update fb_member
	set
	pw='jamin123'
	where id='jaemin' and member_name='유재민' and mail='jaemin@paran.com,'
	
	replace(#{mail},',','')
	
	update fb_member
	set
	pw='12345', tel='수정', mail='수정', address='수정'
	where id='nayeon6222' and member_name='백나연'
	
	delete 
	from fb_member
	where member_no >2 and member_no <43
delete 
from fb_member
where member_no=4

테이블명:fb_category
select * from fb_category;
insert into fb_category values 
(1, '요리');
insert into fb_category values 
(2, '반찬');
insert into fb_category values 
(3, '국, 찌개');

테이블명:fb_boardcategory
delete from fb_boardcategory
select * from fb_boardcategory;
insert into fb_boardcategory values 
(1, '자유게시판');
insert into fb_boardcategory values 
(2, '포토후기');
insert into fb_boardcategory values 
(3, 'QA게시판');

테이블명:fb_boardcategory
select * from fb_boardcategory;

테이블명:fb_delivery_cost
select * from fb_delivery_cost;
insert into fb_delivery_cost values
(1,2500);

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
		
CREATE TABLE fb_category
(
	category_no number NOT NULL,
	category_name varchar2(50) NOT NULL,
	PRIMARY KEY (category_no)
);

CREATE TABLE fb_delivery_cost
(
	fb_delivery_no number NOT NULL,
	fb_delivery_cost number NOT NULL,
	PRIMARY KEY (fb_delivery_no)
);
select * from fb_foods

insert into fb_delivery_cost values (SEQ_fb_delivery_no.nextval, 3000);


insert into fb_foods values (SEQ_foods_no.nextval, '반찬test1', 3500, '300g', '제조일로부터 4일', '냉장', '온 가족이 좋아하는 달큰한 우엉조림은 여러 가지 피부질환에 탁월한 효과가 있을 뿐 아니라 풍부한 식이섬유로 비만, 당뇨, 대장암은 물론 성인병 예방과 다이어트에도 효과가 있습니다.', '돼지고기, 양파, 부추, 홍고추, 마늘, 올리브유, 청주, 생강, 소금, 후춧가루, 굴소스, 간장, 소금, 후춧가루, 참기름, 데리야끼소스', '데리야끼돼지고기안심볶음.jpg', 2, 1);
insert into fb_foods values (SEQ_foods_no.nextval, '반찬29', 3500, '300g', '냉장', '제조일로부터 4일', '맛있습니다', '재료들', '데리야끼돼지고기안심볶음.jpg', 2, 1);
insert into fb_foods values (SEQ_foods_no.nextval, '반찬30', 3500, '300g', '냉장', '제조일로부터 4일', '맛있습니다', '재료들', '데리야끼돼지고기안심볶음.jpg', 2, 1);
insert into fb_foods values (SEQ_foods_no.nextval, '국1', 3500, '300g', '냉장', '제조일로부터 4일', '맛있습니다', '재료들', '데리야끼돼지고기안심볶음.jpg', 1, 1);

select * from fb_review
insert into FB_REVIEW values (SEQ_review_no.nextval, 'ㅎㅎ', 'ㅁㅁㅁㅁㅁㅁㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁ ㅁ', sysdate, 1, 1);
insert into FB_REVIEW values (SEQ_review_no.nextval, 'ㅎㅎ', 'ㅁㅁㅁㅁㅁㅁㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁ ㅁ', sysdate, 1, 1);
insert into FB_REVIEW values (SEQ_review_no.nextval, 'ㅎㅎ', 'ㅁㅁㅁㅁㅁㅁㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁ ㅁ', sysdate, 1, 1);
insert into FB_REVIEW values (SEQ_review_no.nextval, 'ㅎㅎ', 'ㅁㅁㅁㅁㅁㅁㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁ ㅁ', sysdate, 1, 1);
insert into FB_REVIEW values (SEQ_review_no.nextval, 'ㅎㅎ', 'ㅁㅁㅁㅁㅁㅁㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁ ㅁ', sysdate, 1, 1);
insert into FB_REVIEW values (SEQ_review_no.nextval, 'ㅎㅎ', 'ㅁㅁㅁㅁㅁㅁㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ ㅁㅁㅁㅁㅁㅁㅁㅁㅁ ㅁ', sysdate, 1, 1);

select * from fb_member
insert into fb_member values (SEQ_member_no.nextval, '이주훈', 'pwljh', '1234', '개봉동', '010-3892-6638', 'pwljh@naver.com', 1, 1000);
insert into fb_member values (SEQ_member_no.nextval, '유재민', 'asdf', '1234', '역곡', '010-4355-2343', 'pwljh@naver.com', 1, 1000);


delete from fb_review where review_writer = 'ㅎㅎ';

update from fb_foods set foods_

select * from fb_foods

insert into fb_foods values ()

select * from
		fb_review r, fb_foods f
		where 
		r.foods_no(+) = 1
		order by r.review_no desc
		
		
select * from
		fb_review r, fb_foods f
		where r.foods_no = f.foods_no and
		r.foods_no(+) = #{foods_no}
		order by r.review_no desc
		
		
		select   * from fb_foods f
		left outer join  fb_review r
		on r.foods_no = f.foods_no and
		r.foods_no = 1

		
		select b.*, r.*
		from tbl_board b, tbl_reply r
		where b.bno = r.bno(+) and b.bno=2
		order by r.rno desc
		
		select r.*, f.* from
		fb_review r, fb_foods f
		where f.foods_no = r.foods_no(+) and
		f.foods_no = 5
		order by r.review_no desc
		
		
		select * from fb_review
		where foods_no=2
		
		insert into fb_review
		
		select r.*, f.* from
		fb_review r, fb_foods f
		where f.foods_no = r.foods_no(+) and
		f.foods_no = 1
		order by r.review_no desc
		
		
		select count(*) from fb_review where foods_no = '1'

		
		
		select b.* from(
		select rownum as rm, a.* from(
		select * from fb_review where foods_no = 1 order by review_no desc )a)b
		where b.rm>=1 and b.rm <=10
		
		select * from fb_review where foods_no = 1
		
		
주문내역
select * from fb_request
insert into fb_request values
(1, 3000, 3, 1, sysdate, '배송전', 1);
insert into fb_request values
(1, 3000, 2, 1, sysdate, '배송완료', 2);
insert into fb_request values
(1, 3000, 3, 1, sysdate, '입금완료', 3);
insert into fb_request values
(1, 3000, 3, 1, sysdate, '입금완료', 3);

to_date('2016-12-05','yyyy-mm-dd')+1;


delete
from fb_request
where foods_no =3;
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

select * from fb_member

delete from fb_qa_board
select * from fb_qa_board
insert into fb_qa_board values
(3, 2, seq_qa_no.nextval, 0, '백나연', '이게 뭡니까', sysdate, '1','질문잇어요');
insert into fb_qa_board values
(3, 2, seq_qa_no.nextval, 0,  '백나연', '이게 뭡니까2', sysdate, '2','질문잇어요2');
insert into fb_qa_board values
(3, 2, seq_qa_no.nextval, 0, '백나연', '이게 뭡니까3', sysdate, '3','질문잇어요3');

delete from fb_photo_board
select * from fb_photo_board
insert into fb_photo_board values
(2, 2, seq_photo_no.nextval, 0, '백나연', '떡볶이 입니다.', sysdate, '1', '포토후기');
insert into fb_photo_board values
(2, 2, seq_photo_no.nextval, 0, '백나연', '떡볶이 입니다2.', sysdate, '2', '포토후기2');
insert into fb_photo_board values
(2, 2, seq_photo_no.nextval, 0, '백나연', '떡볶이 입니다3.', sysdate, '3', '포토후기3');

delete from fb_board where member_no=1

select * from fb_member

select * from fb_board
insert into fb_board values
(1, 1, seq_board_no.nextval, 0, '백나연', '자유게시판입니다.', sysdate, '자유');
insert into fb_board values
(1, 1, seq_board_no.nextval, 0, '백나연', '자유게시판입니다2.', sysdate, '자유2');
insert into fb_board values
(1, 1, seq_board_no.nextval, 0, '백나연', '자유게시판입니다3.', sysdate, '자유3');

CREATE TABLE fb_photo_board
(
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
	board_no number NOT NULL,
	board_readcount number NOT NULL,
	board_writer varchar2(100),
	board_content varchar2(2000) NOT NULL,
	board_reg_date date NOT NULL,
	board_subject varchar2(200) NOT NULL,
	PRIMARY KEY (board_no)
);

CREATE TABLE fb_qa_board
(

	qa_no number NOT NULL,
	qa_readcount number NOT NULL,
	qa_writer varchar2(100) NOT NULL,
	qa_content varchar2(2000) NOT NULL,
	qa_reg_date date NOT NULL,
	qa_upload varchar2(500) NOT NULL,
	qa_subject varchar2(200) NOT NULL,
	PRIMARY KEY (qa_no)
);

select p.*, q.*, b.*
from fb_photo_board p, fb_board b, fb_qa_board q
where p.member_no=1
and p.member_no=b.member_no and p.member_no=q.member_no;

select *
from fb_photo_board
<<<<<<< HEAD
where member_no=1


=======
where member_no=1

select * from fb_boardcategory

create table fb_boardcategory
(
boardcategory_no number not null,
boardcategory_name varchar2(20) not null,
primary key (boardcategory_no)
);
insert into fb_boardcategory values
(1, '자유게시판');
insert into fb_boardcategory values
(2, '질문과 답변');
insert into fb_boardcategory values
(3, '포토후기');

alter table 

 SET fb_board          fb_photo_board          fb_qa_board  

>>>>>>> refs/remotes/origin/nayeonsadfds

select boardcategory_no as tt, a.*
from fb_photo_board a
where member_no=2 and photo_subject like '%2%'

select board_no, board_readcount, member_no as bmno, boardcategory_no as bcno, board_writer, board_subject, board_content, board_reg_date 
		from fb_board
		where member_no=2  and board_subject like '%2%'
		
		delete from fb_member where id = 'aa'
		
		select *
		from FB_MEMBER a, FB_COUPON_BOOK b, FB_COUPON c
		where a.member_no = b.member_no(+) and b.coupon_no = c.coupon_no(+)
		and a.member_no = (select member_no from fb_member where id = 'aa' and pw = '1234')

		
select b.* from (
		select rownum as rm, a.* from (
		select * from fb_board where board_no>=1 order by board_no desc)a)b 
		where b.rm>=1 and b.rm <=3		
		
		
		
		
		
		
		
		
		