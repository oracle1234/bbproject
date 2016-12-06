package dto;

import java.util.List;

public class myBoardDTO {
	
	private List<BoardDTO> bdto;
	private List<Photo_BoardDTO> pdto;
	private List<QA_BoardDTO> qdto;
	
	public List<BoardDTO> getBdto() {
		return bdto;
	}
	public void setBdto(List<BoardDTO> bdto) {
		this.bdto = bdto;
	}
	public List<Photo_BoardDTO> getPdto() {
		return pdto;
	}
	public void setPdto(List<Photo_BoardDTO> pdto) {
		this.pdto = pdto;
	}
	public List<QA_BoardDTO> getQdto() {
		return qdto;
	}
	public void setQdto(List<QA_BoardDTO> qdto) {
		this.qdto = qdto;
	}
	
	

}// end class
