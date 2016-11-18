package dao;

import java.util.List;

import dto.BoardDTO;
import dto.Photo_BoardDTO;
import dto.QA_BoardDTO;

public interface myBoardDAO {
	
	public List<BoardDTO> BoardList(int num);
	public List<Photo_BoardDTO> PhotoList(int num);
	public List<QA_BoardDTO> QaList(int num);
}
