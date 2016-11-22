package dao;

import java.util.HashMap;
import java.util.List;

import dto.myBoardDTO;

public interface myBoardDAO {
	
	public List<myBoardDTO> myBoardList(HashMap<String, Integer> map);

}