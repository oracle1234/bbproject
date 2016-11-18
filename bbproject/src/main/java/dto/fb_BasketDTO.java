package dto;

public class fb_BasketDTO {
	
	private int amount, price, point, foods_no;
	private String foods_name; 
	private int member_no;
	
	public fb_BasketDTO() {
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getFoods_no() {
		return foods_no;
	}

	public void setFoods_no(int foods_no) {
		this.foods_no = foods_no;
	}

	public String getFoods_name() {
		return foods_name;
	}

	public void setFoods_name(String foods_name) {
		this.foods_name = foods_name;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
	
	
}//end class
