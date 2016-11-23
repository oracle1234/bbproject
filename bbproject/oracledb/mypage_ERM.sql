ALTER TABLE fb_coupon_book
	ADD CONSTRAINT fk_member_no FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;

ALTER TABLE fb_coupon_book
	ADD CONSTRAINT fk_coupon_no FOREIGN KEY (coupon_no)
	REFERENCES fb_coupon (coupon_no) on delete cascade
;

ALTER TABLE fb_basket
	ADD CONSTRAINT fk_member_no2 FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;

ALTER TABLE fb_basket
	ADD CONSTRAINT fk_foods_no FOREIGN KEY (foods_no)
	REFERENCES fb_foods (foods_no) on delete cascade
;

ALTER TABLE fb_request
	ADD CONSTRAINT fk_member_no3 FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;

ALTER TABLE fb_board
	ADD CONSTRAINT fk_member_no4 FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;

ALTER TABLE fb_board
	ADD CONSTRAINT fk_boardcategory_no FOREIGN KEY (boardcategory_no)
	REFERENCES fb_boardcategory (boardcategory_no) on delete cascade
;

ALTER TABLE fb_qa_board
	ADD CONSTRAINT fk_member_no5 FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;

ALTER TABLE fb_qa_board
	ADD CONSTRAINT fk_boardcategory_no2 FOREIGN KEY (boardcategory_no)
	REFERENCES fb_boardcategory (boardcategory_no) on delete cascade
;

ALTER TABLE fb_photo_board
	ADD CONSTRAINT fk_member_no6 FOREIGN KEY (member_no)
	REFERENCES fb_member (member_no) on delete cascade
;

ALTER TABLE fb_photo_board
	ADD CONSTRAINT fk_boardcategory_no3 FOREIGN KEY (boardcategory_no)
	REFERENCES fb_boardcategory (boardcategory_no) on delete cascade
;

ALTER TABLE fb_foods
	ADD CONSTRAINT fk_category_no FOREIGN KEY (category_no)
	REFERENCES fb_category (category_no) on delete cascade
;

ALTER TABLE fb_foods
	ADD CONSTRAINT fk_category_no FOREIGN KEY (fb_delivery)
	REFERENCES fb_category (category_no) on delete cascade
;