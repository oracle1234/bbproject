package service;

import java.util.List;

import dto.BoardDTO;
import dto.Photo_BoardDTO;
import dto.QA_BoardDTO;

public interface myBoardService {
	
	public List<BoardDTO> BoardListProcess(int member_no);
	public List<Photo_BoardDTO> PhotoListProcess(int member_no);
	public List<QA_BoardDTO> QaListProcess(int member_no);

}
