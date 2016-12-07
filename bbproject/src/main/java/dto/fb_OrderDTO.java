package dto;

import java.sql.Date;

public class fb_OrderDTO {
	
	private Date day;
	private int  foods_no, price, amount;
	private String delivery_condition, picture, foods_name;
	private int member_no;
	
	public fb_OrderDTO() {

	}
	
	public void setFoods_name(String foods_name) {
		this.foods_name = foods_name;
	}
	
	public String getFoods_name() {
		return foods_name;
	}
	
	public String getPicture() {
		return picture;
	}
	
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	public int getMember_no() {
		return member_no;
	}
	
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getAmount() {
		return amount;
	}
	
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	public int getFoods_no() {
		return foods_no;
	}

	public void setFoods_no(int foods_no) {
		this.foods_no = foods_no;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDelivery_condition() {
		return delivery_condition;
	}

	public void setDelivery_condition(String delivery_condition) {
		this.delivery_condition = delivery_condition;
	}
	

}
