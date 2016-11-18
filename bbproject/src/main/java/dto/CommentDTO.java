package dto;

import java.util.Date;

public class CommentDTO {
	private int comment_no, board_no, photo_no, qa_no;
	private int comment_ref, comment_re_step, comment_re_level;
	private String comment_content, comment_writer;
	private Date comment_date;

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getPhoto_no() {
		return photo_no;
	}

	public void setPhoto_no(int photo_no) {
		this.photo_no = photo_no;
	}

	public int getQa_no() {
		return qa_no;
	}

	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
	}

	public int getComment_ref() {
		return comment_ref;
	}

	public void setComment_ref(int comment_ref) {
		this.comment_ref = comment_ref;
	}

	public int getComment_re_step() {
		return comment_re_step;
	}

	public void setComment_re_step(int comment_re_step) {
		this.comment_re_step = comment_re_step;
	}

	public int getComment_re_level() {
		return comment_re_level;
	}

	public void setComment_re_level(int comment_re_level) {
		this.comment_re_level = comment_re_level;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getComment_writer() {
		return comment_writer;
	}

	public void setComment_writer(String comment_writer) {
		this.comment_writer = comment_writer;
	}

	public Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}

}
