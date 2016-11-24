package dto;

public class LatelyDTO {

	private int lately_no;
	private int foods_no;
	private String foods_name;
	private String picture;

	public LatelyDTO() {
	}

	public int getLately_no() {
		return lately_no;
	}

	public void setLately_no(int lately_no) {
		this.lately_no = lately_no;
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

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

}
