package dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Photo_BoardDTO {

	private int photo_no, photo_readcount;
	private String photo_writer, photo_content, photo_subject;
	private Date photo_reg_date;

	private String upload;

	private MultipartFile filename;

	public int getPhoto_no() {
		return photo_no;
	}

	public void setPhoto_no(int photo_no) {
		this.photo_no = photo_no;
	}

	public int getPhoto_readcount() {
		return photo_readcount;
	}

	public void setPhoto_readcount(int photo_readcount) {
		this.photo_readcount = photo_readcount;
	}

	public String getPhoto_writer() {
		return photo_writer;
	}

	public void setPhoto_writer(String photo_writer) {
		this.photo_writer = photo_writer;
	}

	public String getPhoto_content() {
		return photo_content;
	}

	public void setPhoto_content(String photo_content) {
		this.photo_content = photo_content;
	}

	public String getPhoto_subject() {
		return photo_subject;
	}

	public void setPhoto_subject(String photo_subject) {
		this.photo_subject = photo_subject;
	}

	public Date getPhoto_reg_date() {
		return photo_reg_date;
	}

	public void setPhoto_reg_date(Date photo_reg_date) {
		this.photo_reg_date = photo_reg_date;
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

}
