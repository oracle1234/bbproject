package dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import dto.fb_BasketDTO;

public interface fb_BasketDAO {

	public List<fb_BasketDTO> list(int num);
	public void delete(int foods_no);
	public void amountUpdate(fb_BasketDTO bdto);
	
}
