package dto;

import java.sql.Date;

public class fb_OrderDTO {
	
	private Date day;
	private int  foods_no, price, amount;
	private String delivery_condition;
	private int member_no;
	
	public fb_OrderDTO() {

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
