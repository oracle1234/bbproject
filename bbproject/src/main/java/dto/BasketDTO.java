package dto;

public class BasketDTO {
	
	private int amount, price;
	private String foods_name; 

	public BasketDTO() {
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

	public String getFoods_name() {
		return foods_name;
	}

	public void setFoods_name(String foods_name) {
		this.foods_name = foods_name;
	}
	
	
	
}//end class
