package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.myBoardDTO;

public interface myBoardDAO {
	
	public List<myBoardDTO> myBoardList(HashMap<String, Integer> map);
	public myBoardDTO myboardtitleSearch(HashMap<String, Object> map);
	public myBoardDTO myboardcontentSearch(HashMap<String, Object> map);

}