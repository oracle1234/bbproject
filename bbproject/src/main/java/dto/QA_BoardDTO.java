package dto;

import java.util.Date;

public class QA_BoardDTO {

	private int qa_no, qa_readcount;
	private String qa_writer, qa_content, qa_upload, qa_subject;
	private Date qa_reg_date;

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

	public String getQa_upload() {
		return qa_upload;
	}

	public void setQa_upload(String qa_upload) {
		this.qa_upload = qa_upload;
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

}
