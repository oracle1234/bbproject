package service;

import java.util.HashMap;
import java.util.List;

import dto.fb_OrderDTO;

public interface fb_OrderService {
	
	public List<fb_OrderDTO> orderlistProcess(int member_no);
	//public List<fb_OrderDTO> orderdelProcess(HashMap<String, Object> map);
	public List<fb_OrderDTO> myOrderSearchProcess(int member_no, String start, String end);
}
