select * from fb_review order by review_no desc

insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);
insert into fb_review values (SEQ_review_no.nextval, 'adfasdfsdaf', 'ㅎㅎㅎㅎㅎㅎㅎ', sysdate, 1, 1);



delete from fb_review where review_no = 169;


delete from fb_review where review_no = 172 and member_no = 1 and foods_no = 2

select * from fb_review 

update fb_review set review_content = '맛없어요' where review_no = 100 and member_no = 1;




update fb_review set review_content = '12345' where review_no = 99 and member_no = 1

select * from fb_basket
member_no, foods_no, amount
insert into fb_basket values (1, 1, 1)

select * from fb_foods where foods_no= 1 order by foods_no desc