package service;

import java.util.HashMap;
import java.util.List;

import dto.fb_BasketDTO;
import dto.myBoardDTO;

public interface myBoardService {
	
	public List<myBoardDTO> myboardlistProcess(HashMap<String, Integer> map);


}
