package service;

import java.util.List;

import dao.BoardDAO;
import dao.fb_OrderDAO;
import dao.myBoardDAO;
import dto.BoardDTO;
import dto.Photo_BoardDTO;
import dto.QA_BoardDTO;
import dto.fb_OrderDTO;

public class myBoardServiceImp implements myBoardService{
	
	private myBoardDAO dao;
	
	public myBoardServiceImp() {
	}
	
	public void setDao(myBoardDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<BoardDTO> BoardListProcess(int member_no) {
		return dao.BoardList(member_no);
	}

	@Override
	public List<Photo_BoardDTO> PhotoListProcess(int member_no) {
		return dao.PhotoList(member_no);
	}

	@Override
	public List<QA_BoardDTO> QaListProcess(int member_no) {
		return dao.QaList(member_no);
	}
}
