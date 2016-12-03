package service;

import java.util.List;

import dto.fb_OrderDTO;

public interface fb_OrderService {
	
	public List<fb_OrderDTO> orderlistProcess(int member_no);
	public void orderdelProcess(String member_no, String foods_no, String day);

}
