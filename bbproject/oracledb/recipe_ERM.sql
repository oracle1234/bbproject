
/* Drop Tables */

DROP TABLE fb_theme CASCADE CONSTRAINTS;
DROP TABLE fb_theme_recipe CASCADE CONSTRAINTS;
DROP TABLE fb_tr_order CASCADE CONSTRAINTS;
DROP TABLE fb_tr_complete CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_theme_no;
DROP SEQUENCE SEQ_recipe_no;
DROP SEQUENCE SEQ_order_no;
DROP SEQUENCE SEQ_complete_no;




/* Create Sequences */

CREATE SEQUENCE SEQ_theme_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_recipe_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_order_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_complete_no INCREMENT BY 1 START WITH 1 nocache nocycle;



/* Create Tables */


CREATE TABLE fb_theme
(
	theme_no number NOT NULL,
	theme_name varchar2(500) NOT NULL,
	PRIMARY KEY (theme_no)
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


CREATE TABLE fb_tr_order
(
	recipe_no number NOT NULL,
	order_pic varchar2(500),
	order_text varchar2(500)
);


CREATE TABLE fb_tr_complete
(
	recipe_no number NOT NULL,
	complete_pic varchar2(500)
);


/* Create Foreign Keys */


ALTER TABLE fb_tr_order
	ADD CONSTRAINT fk_order_recipe_no FOREIGN KEY (recipe_no)
	REFERENCES fb_theme_recipe (recipe_no) on delete cascade
;



ALTER TABLE fb_tr_complete
	ADD CONSTRAINT fk_complete_recipe_no FOREIGN KEY (recipe_no)
	REFERENCES fb_theme_recipe (recipe_no) on delete cascade
;


ALTER TABLE fb_theme_recipe
	ADD CONSTRAINT fk_theme_no FOREIGN KEY (theme_no)
	REFERENCES fb_theme (theme_no) on delete cascade
;


insert into fb_theme values(1, '영양식');
insert into fb_theme values(2, '간식');
insert into fb_theme values(3, '도시락');
insert into fb_theme values(4, '다이어트');
insert into fb_theme values(5, '야식');

select * from fb_theme;
select * from fb_theme_recipe;
select * from fb_tr_order;
select * from fb_tr_complete;

delete from fb_theme_recipe;
delete from fb_tr_order;
delete from fb_tr_complete;

select theme_name
		from fb_theme
		where theme_no = 1

insert into fb_theme_recipe values(SEQ_recipe_no.nextval, 1, '영양식', '소고기', '소고기 영양식이다', '0dcf7960-9c34-462e-885b-569d7a2483e6_Tulips.jpg', '3인분', '10분', 'g');
insert into fb_tr_order values(SEQ_order_no.nextval, SEQ_recipe_no.currval, #{arr1})

select * 
from fb_theme_recipe a, fb_tr_order b, fb_tr_complete c
where a.recipe_no = b.recipe_no and a.recipe_no = c.recipe_no
order by a.recipe_no desc;

delete from fb_theme_recipe where recipe_no = 2

select * 
from fb_theme_recipe a, fb_tr_order b, fb_tr_complete c
where a.recipe_no = b.recipe_no and a.recipe_no = c.recipe_no
and a.recipe_no = 36
order by a.recipe_no desc;

select *
		from fb_theme_recipe a, fb_tr_order b, fb_tr_complete c
		where a.recipe_no =
		b.recipe_no and a.recipe_no = c.recipe_no
			and a.theme_no = 3
		order by a.recipe_no desc
		

		
select *
		from fb_member
		where id = 'ss' and pw = 'sdf'		
		
		
		select count(*)
		from fb_member
		where id='sdf'
		
		
		
		
		
		
		
		
/* 최근본상품 */
DROP TABLE fb_lately_product CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_lately_no;

CREATE SEQUENCE SEQ_lately_no INCREMENT BY 1 START WITH 1 nocache nocycle;

CREATE TABLE fb_lately_product
(
	lately_no number NOT NULL,
	member_no number NOT NULL,
	foods_no number NOT NULL,
	PRIMARY KEY (lately_no)
);

ALTER TABLE fb_lately_product
	ADD CONSTRAINT fk_lately_foods_no FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no) on delete cascade
;


ALTER TABLE fb_lately_product
	ADD CONSTRAINT fk_lately_member_no FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;

insert into fb_lately_product values(SEQ_lately_no.nextval, 4, 5);
insert into fb_lately_product values(SEQ_lately_no.nextval, 4, 6);
insert into fb_lately_product values(SEQ_lately_no.nextval, 4, 7);

insert into fb_lately_product values(SEQ_lately_no.nextval, 1, 3);

select * from fb_foods;

delete from fb_lately_product;
SELECT * from fb_lately_product where member_no = 4;

select * 
from fb_lately_product a, fb_member b, fb_foods c
where a.member_no = b.member_no and a.foods_no = c.foods_no
and a.member_no = 4
order by a.lately_no desc;

select count(*) from fb_theme_recipe
where theme_no = 2



	select e.* from (
		select rownum as rm, d.*
		from(
		select a.*, b.recipe_no as bno, b.order_pic, b.order_text, c.recipe_no as cno, c.complete_pic from
		fb_theme_recipe a, fb_tr_order b, fb_tr_complete c
		where a.recipe_no =	b.recipe_no and a.recipe_no = c.recipe_no and a.theme_no = 1
		order by a.recipe_no desc)d)e
		where e.rm >= 1 and e.rm <= 5;



select rownum as rm, d.recipe_name
from(select a.*, b.*,c.* b.recipe_no as brecino , b.df.
from fb_theme_recipe a, fb_tr_order b, fb_tr_complete c
where a.recipe_no = b.recipe_no and a.recipe_no = c.recipe_no  and a.theme_no = 1)d


alter table FB_THEME_RECIPE modify (recipe_name var)

ALTER TABLE table_name
ADD recipe_name 

ALTER TABLE table_name
DROP COLUMN column_name

alter table FB_THEME_RECIPE rename column receipe_name to recipe_name;
alter table FB_THEME_RECIPE rename column receipe_explaination to recipe_explaination;
alter table FB_THEME_RECIPE rename column receipe_time to recipe_time;
alter table FB_THEME_RECIPE rename column receipe_name to recipe_name;


	select c.* from (
			select rownum as rm, b.*
			from(
			select * from
			fb_theme_recipe
			order by recipe_no desc)b)c
			where c.rm >= 1 and c.rm <= 5

			where theme_no = 3


select *
		from fb_theme_recipe a, fb_tr_order b, fb_tr_complete c
		where a.recipe_no =	b.recipe_no(+) and a.recipe_no = c.recipe_no(+)
		and a.recipe_no = 39
		
		
		select c.* from (
			select rownum as rm, b.*
			from(
			select * from
			fb_theme_recipe
					/*where theme_no = 1 and recipe_name like '%'||'소'||'%'*/
					where recipe_name like '%'||'소'||'%'
			order by recipe_no desc)b)c
			where c.rm >= 1 and c.rm <= 5
		
insert into fb_lately_product(lately_no, member_no, foods_no) 
values(SEQ_lately_no.nextval, 4, (select foods_no from FB_LATELY_PRODUCT where foods_no != 10)) 
where foods_no != 10

select count(*)
		from fb_lately_product
		where member_no = 4 and foods_no = 7
		
alter table fb_tr_order
modify ORDER_TEXT varchar2(1000);

select * from fb_member


select *
	from fb_request
	where member_no=2 and 
    day >= to_date('2016-12-5','yyyy-mm-dd')
    and day <= to_date('2016-12-7','yyyy-mm-dd')
    
    
    
    
		
