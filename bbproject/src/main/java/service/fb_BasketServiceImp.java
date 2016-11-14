package service;

import java.util.List;

import dao.fb_BasketDAO;
import dto.fb_BasketDTO;

public class fb_BasketServiceImp implements fb_BasketService{
	
	private fb_BasketDAO dao;
	
	public fb_BasketServiceImp() {
	
	}
	
	public void setDao(fb_BasketDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<fb_BasketDTO> listProcess(int num) {
		return dao.list(num);
	}//end listProcess()


}//end class
