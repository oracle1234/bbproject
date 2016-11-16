package dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardDTO {
	private int board_no, board_readcount;
	private String board_writer, board_subject, board_content;
	private String board_passwd, board_ip;
	private Date board_reg_date;

	// board테이블의 파일첨부를 처리해주는 멤버변수
	private String upload;

	// form 페이지에서 파일첨부를 받아 처리해주는 멤버변수
	private MultipartFile filename;

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getBoard_readcount() {
		return board_readcount;
	}

	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}

	public String getBoard_writer() {
		return board_writer;
	}

	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}

	public String getBoard_subject() {
		return board_subject;
	}

	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Date getBoard_reg_date() {
		return board_reg_date;
	}

	public void setBoard_reg_date(Date board_reg_date) {
		this.board_reg_date = board_reg_date;
	}

	public String getUpload() {
		return upload;
	}

	public void setUpload(String upload) {
		this.upload = upload;
	}

	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}

	public String getBoard_passwd() {
		return board_passwd;
	}

	public void setBoard_passwd(String board_passwd) {
		this.board_passwd = board_passwd;
	}

	public String getBoard_ip() {
		return board_ip;
	}

	public void setBoard_ip(String board_ip) {
		this.board_ip = board_ip;
	}

}// end class
