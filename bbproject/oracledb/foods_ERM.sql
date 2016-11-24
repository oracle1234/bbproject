DROP TABLE fb_foods CASCADE CONSTRAINTS;
DROP TABLE fb_category CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_category_no;
DROP SEQUENCE SEQ_foods_no;

CREATE SEQUENCE SEQ_category_no INCREMENT BY 1 START WITH 1 nocache nocycle;
CREATE SEQUENCE SEQ_foods_no INCREMENT BY 1 START WITH 1 nocache nocycle;




CREATE TABLE fb_category
(
	category_no number NOT NULL,
	category_name varchar2(50) NOT NULL,
	PRIMARY KEY (category_no)
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



ALTER TABLE fb_foods
	ADD CONSTRAINT fk_category_no FOREIGN KEY (category_no)
	REFERENCES fb_category (category_no) on delete cascade
;

insert into fb_category values 
(1, '요리');
insert into fb_category values 
(2, '반찬');
insert into fb_category values 
(3, '국, 찌개');

select * from fb_category;

insert into fb_foods values(SEQ_foods_no.nextval, '이름', 3000, '300g', '그늘', '1일', '설명', '재료설명', 'sdf.png', 1, 0);

select * from fb_foods