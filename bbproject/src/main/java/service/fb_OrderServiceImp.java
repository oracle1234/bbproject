package service;

import java.util.HashMap;
import java.util.List;

import dao.fb_OrderDAO;
import dto.fb_OrderDTO;

public class fb_OrderServiceImp implements fb_OrderService{
	
	private fb_OrderDAO dao;
	
	public fb_OrderServiceImp() {

	}
	
	public void setDao(fb_OrderDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<fb_OrderDTO> orderlistProcess(int member_no) {
		
		return dao.list(member_no);
	}

	@Override
	public List<fb_OrderDTO> myOrderSearchProcess(int member_no, String start, String end) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_no", member_no);
		map.put("start", start);
		map.put("end", end);
		return dao.myOrderSearch(map);
	}

/*	@Override
	public List<fb_OrderDTO> orderdelProcess(HashMap<String, Object> map) {
		return dao.orderdelete(map);
	}*/


}
