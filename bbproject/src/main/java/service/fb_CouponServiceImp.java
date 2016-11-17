package service;

import java.util.List;

import dao.fb_CouponDAO;
import dto.fb_CouponDTO;

public class fb_CouponServiceImp implements fb_CouponService{
	
	private fb_CouponDAO dao;
	
	public fb_CouponServiceImp() {

	}
	
	public void setDao(fb_CouponDAO dao) {
		this.dao = dao;
	}


	@Override
	public List<fb_CouponDTO> couponlist(int member_no) {
		return dao.list(member_no);
	}

}
