package dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class QA_BoardDTO {


	private int qa_no, qa_readcount, member_no, boardcategory_no;
	private String qa_writer, qa_content, qa_subject;
	private Date qa_reg_date;

	// board테이블의 파일첨부를 처리해주는 멤버변수
	private String qa_upload;

	// form 페이지에서 파일첨부를 받아 처리해주는 멤버변수
	private MultipartFile filename;

	public int getBoardcategory_no() {
		return boardcategory_no;
	}
	
	public void setBoardcategory_no(int boardcategory_no) {
		this.boardcategory_no = boardcategory_no;
	}
	
	public int getMember_no() {
		return member_no;
	}
	
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
	public int getQa_no() {
		return qa_no;
	}

	public void setQa_no(int qa_no) {
		this.qa_no = qa_no;
	}

	public int getQa_readcount() {
		return qa_readcount;
	}

	public void setQa_readcount(int qa_readcount) {
		this.qa_readcount = qa_readcount;
	}

	public String getQa_writer() {
		return qa_writer;
	}

	public void setQa_writer(String qa_writer) {
		this.qa_writer = qa_writer;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public String getQa_subject() {
		return qa_subject;
	}

	public void setQa_subject(String qa_subject) {
		this.qa_subject = qa_subject;
	}

	public Date getQa_reg_date() {
		return qa_reg_date;
	}

	public void setQa_reg_date(Date qa_reg_date) {
		this.qa_reg_date = qa_reg_date;
	}

	public String getQa_upload() {
		return qa_upload;
	}

	public void setQa_upload(String qa_upload) {
		this.qa_upload = qa_upload;
	}

	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}

}
