package dto;

public class EmailDTO {
	
	private String subject;
    private String content;
    private String receiver;
	
    public EmailDTO() {
    	// TODO Auto-generated constructor stub
    }
    
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	

}
