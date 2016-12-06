package service;

import java.util.HashMap;
import java.util.List;

import dto.fb_BasketDTO;
import dto.myBoardDTO;

public interface myBoardService {
	
	public myBoardDTO myboardlistProcess(HashMap<String, Integer> map);
	public myBoardDTO myBoardSearchProcess(int member_no, int boardcategory_no, String board_subject);
	public myBoardDTO myContentSearchProcess(int member_no, int boardcategory_no, String board_content);


}