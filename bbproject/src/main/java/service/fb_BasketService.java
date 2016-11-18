package service;

import java.util.List;

import dto.fb_BasketDTO;

public interface fb_BasketService {
	
	public List<fb_BasketDTO> listProcess(int member_no);
	public List<fb_BasketDTO> amountUpdateProcess(fb_BasketDTO bdto);
	public List<fb_BasketDTO> deleteProcess(fb_BasketDTO bdto);
}
