package dao;

import java.sql.Date;
import java.util.List;

import dto.fb_OrderDTO;

public interface fb_OrderDAO {
	
	public List<fb_OrderDTO> list(int num);
/*	public List<fb_OrderDTO> deleteProcess(fb_OrderDTO odto);*/

}
