package service;

import java.util.HashMap;
import java.util.List;


import dao.myBoardDAO;
import dto.BoardDTO;
import dto.Photo_BoardDTO;
import dto.QA_BoardDTO;
import dto.myBoardDTO;

public class myBoardServiceImp implements myBoardService{
	
	private myBoardDAO dao;
	
	public myBoardServiceImp() {
	}
	
	public void setDao(myBoardDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<myBoardDTO> myboardlistProcess(HashMap<String, Integer> map) {
		return dao.myBoardList(map);
	}
	

}
