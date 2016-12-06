package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public myBoardDTO myboardlistProcess(HashMap<String, Integer> map) {
		return dao.myBoardList(map);
	}

	@Override
	public myBoardDTO myBoardSearchProcess(int member_no, int boardcategory_no, String board_subject) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_no", member_no);
		map.put("boardcategory_no", boardcategory_no);
		map.put("board_subject", board_subject);
		return dao.myboardtitleSearch(map);
	}

	@Override
	public myBoardDTO myContentSearchProcess(int member_no, int boardcategory_no, String board_content) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_no", member_no);
		map.put("boardcategory_no", boardcategory_no);
		map.put("board_content", board_content);
		return dao.myboardcontentSearch(map);
	}


}
