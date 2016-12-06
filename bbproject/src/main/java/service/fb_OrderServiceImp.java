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

/*	@Override
	public List<fb_OrderDTO> orderdelProcess(HashMap<String, Object> map) {
		return dao.orderdelete(map);
	}*/


}
