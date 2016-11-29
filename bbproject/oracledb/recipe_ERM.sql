
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

insert into fb_theme_recipe values(SEQ_recipe_no.nextval, 1, '영양식', '소고기', '소고기 영양식이다', 'sim.txt', '3인분', '10분', 'g');
insert into fb_tr_order values(SEQ_order_no.nextval, SEQ_recipe_no.currval, #{arr1})

select * 
from fb_theme_recipe a, fb_tr_order b, fb_tr_complete c
where a.recipe_no = b.recipe_no and a.recipe_no = c.recipe_no
order by a.recipe_no desc;

delete from fb_theme_recipe where recipe_no = 2

select * 
from fb_theme_recipe a, fb_tr_order b, fb_tr_complete c
where a.recipe_no = b.recipe_no and a.recipe_no = c.recipe_no
and a.recipe_no = 1
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
