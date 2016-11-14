package service;

import java.util.List;

import dto.fb_BasketDTO;

public interface fb_BasketService {
	
	public List<fb_BasketDTO> listProcess(int member_no);
}
