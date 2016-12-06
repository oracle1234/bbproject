package dto;

public class RecipePageDTO {
	private int theme_no;

	private int currentRow; // 현재페이지
	private int totalRow; // 총 레코드수
	private int blockCount = 5 ; // 한 페이지에 보여줄 레코드수
	private int startRow; // 시작 레코드 번호
	private int endRow; // 끝 레코드번호

	public RecipePageDTO() {

	}

	public RecipePageDTO(int currentRow, int totalRow) {
		this.currentRow = currentRow;
		this.totalRow = totalRow;

		// 시작레코드
		startRow = (currentRow - 1) * blockCount + 1;

		// 끝레코드
		endRow = startRow + blockCount - 1;

	}

	public int getTheme_no() {
		return theme_no;
	}

	public void setTheme_no(int theme_no) {
		this.theme_no = theme_no;
	}

	public int getCurrentRow() {
		return currentRow;
	}

	public void setCurrentRow(int currentRow) {
		this.currentRow = currentRow;
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

}
