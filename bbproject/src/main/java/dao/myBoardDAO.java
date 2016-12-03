package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.myBoardDTO;

public interface myBoardDAO {
	
	public List<myBoardDTO> myBoardList(HashMap<String, Integer> map);
/*	public List<myBoardDTO> searchMethod(Map map){
		return this.searchMapper.select(map);
	}*/

}