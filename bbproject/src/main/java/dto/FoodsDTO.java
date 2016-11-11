package dto;

public class FoodsDTO {
	
	private int foods_no, price, category_no, fb_delivery_no;
	private String foods_name, weight, way, shelfLife, foods_explaination, foods_material, picture;
	
	public FoodsDTO() {
		// TODO Auto-generated constructor stub
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

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public int getFb_delivery_no() {
		return fb_delivery_no;
	}

	public void setFb_delivery_no(int fb_delivery_no) {
		this.fb_delivery_no = fb_delivery_no;
	}

	public String getFoods_name() {
		return foods_name;
	}

	public void setFoods_name(String foods_name) {
		this.foods_name = foods_name;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getWay() {
		return way;
	}

	public void setWay(String way) {
		this.way = way;
	}

	public String getShelfLife() {
		return shelfLife;
	}

	public void setShelfLife(String shelfLife) {
		this.shelfLife = shelfLife;
	}

	public String getFoods_explaination() {
		return foods_explaination;
	}

	public void setFoods_explaination(String foods_explaination) {
		this.foods_explaination = foods_explaination;
	}

	public String getFoods_material() {
		return foods_material;
	}

	public void setFoods_material(String foods_material) {
		this.foods_material = foods_material;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	
	
}
