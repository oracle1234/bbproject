package service;

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
	public List<fb_OrderDTO> deleteProcess(String member_no, String foods_no, String day) {
		return dao.delete(member_no, foods_no, day);
	}

	@Override
	public List<fb_OrderDTO> deleteProcess(fb_OrderDTO odto) {
		// TODO Auto-generated method stub
		return null;
	}*/

}
