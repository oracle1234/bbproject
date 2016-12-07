package service;

import java.util.HashMap;
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
	public List<fb_BasketDTO> listProcess(int member_no) {
		return dao.list(member_no);
	}//end listProcess()

	@Override
	public List<fb_BasketDTO> amountUpdateProcess(fb_BasketDTO bdto) {
		dao.amountUpdate(bdto);
		return dao.list(bdto.getMember_no());
	}

	@Override
	public List<fb_BasketDTO> deleteProcess(fb_BasketDTO bdto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("foods_no", bdto.getFoods_no());
		map.put("member_no", bdto.getMember_no());
		dao.delete(map);
		return dao.list(bdto.getMember_no());
	}

}//end class
