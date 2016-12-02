package dao;

import java.sql.Date;
import java.util.List;

import dto.fb_OrderDTO;

public interface fb_OrderDAO {
	
	public List<fb_OrderDTO> list(int num);
	//public fb_OrderDTO delete(int member_no, int foods_no, Date day);
	//List<fb_OrderDTO> delete(String member_no, String foods_no, String day);


}
