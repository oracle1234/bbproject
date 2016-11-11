package dto;

import java.util.Date;

public class ReviewDTO {

	private int fc_no;
	private String fc_writer, fc_content;
	private Date fc_date;
	
	//외래키없음
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}


	public int getFc_no() {
		return fc_no;
	}


	public void setFc_no(int fc_no) {
		this.fc_no = fc_no;
	}


	public String getFc_writer() {
		return fc_writer;
	}


	public void setFc_writer(String fc_writer) {
		this.fc_writer = fc_writer;
	}


	public String getFc_content() {
		return fc_content;
	}


	public void setFc_content(String fc_content) {
		this.fc_content = fc_content;
	}


	public Date getFc_date() {
		return fc_date;
	}


	public void setFc_date(Date fc_date) {
		this.fc_date = fc_date;
	}
	
	
	

}
