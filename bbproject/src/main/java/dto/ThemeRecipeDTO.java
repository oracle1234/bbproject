package dto;

import org.springframework.web.multipart.MultipartFile;

public class ThemeRecipeDTO {

	// 레시피 번호
	private int recipe_no;
	// 테마 번호
	private int theme_no;
	// 레시피 이름
	private String recipe_name;
	// 레시피 재료
	private String recipe_material;
	// 레시피 설명
	private String recipe_explaination;
	// 인원
	private String portion;
	// 조리시간
	private String time;
	// 난이도
	private String difficulty;
	// 타이틀 사진
	private String picture;

	// 조리 순서
	private String[] order_pic;
	private MultipartFile[] order_file;
	private String[] order_text;

	// 완성사진
	private String[] complete_pic;
	private MultipartFile[] complete_file;

	public ThemeRecipeDTO() {
	}

	public int getRecipe_no() {
		return recipe_no;
	}

	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}

	public int getTheme_no() {
		return theme_no;
	}

	public void setTheme_no(int theme_no) {
		this.theme_no = theme_no;
	}

	public String getRecipe_name() {
		return recipe_name;
	}

	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}

	public String getRecipe_material() {
		return recipe_material;
	}

	public void setRecipe_material(String recipe_material) {
		this.recipe_material = recipe_material;
	}

	public String getRecipe_explaination() {
		return recipe_explaination;
	}

	public void setRecipe_explaination(String recipe_explaination) {
		this.recipe_explaination = recipe_explaination;
	}

	public String getPortion() {
		return portion;
	}

	public void setPortion(String portion) {
		this.portion = portion;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String[] getOrder_pic() {
		return order_pic;
	}

	public void setOrder_pic(String[] order_pic) {
		this.order_pic = order_pic;
	}

	public MultipartFile[] getOrder_file() {
		return order_file;
	}

	public void setOrder_file(MultipartFile[] order_file) {
		this.order_file = order_file;
	}

	public String[] getOrder_text() {
		return order_text;
	}

	public void setOrder_text(String[] order_text) {
		this.order_text = order_text;
	}

	public String[] getComplete_pic() {
		return complete_pic;
	}

	public void setComplete_pic(String[] complete_pic) {
		this.complete_pic = complete_pic;
	}

	public MultipartFile[] getComplete_file() {
		return complete_file;
	}

	public void setComplete_file(MultipartFile[] complete_file) {
		this.complete_file = complete_file;
	}

}
