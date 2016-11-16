package dao;

import java.util.List;

import dto.fb_BasketDTO;

public interface fb_BasketDAO {

	public List<fb_BasketDTO> list(int num);
	public void amountUpdate(fb_BasketDTO bdto);
	public void delete(int foods_no);
}
