package service;

import java.util.List;

import dto.fb_OrderDTO;

public interface fb_OrderService {
	
	public List<fb_OrderDTO> orderlist(int member_no);

}
