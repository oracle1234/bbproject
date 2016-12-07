package dao;

import java.util.HashMap;
import java.util.List;

import dto.fb_BasketDTO;

public interface fb_BasketDAO {

	public List<fb_BasketDTO> list(int num);
	public void delete(HashMap<String, Object> map);
	public void amountUpdate(fb_BasketDTO bdto);
	
}
