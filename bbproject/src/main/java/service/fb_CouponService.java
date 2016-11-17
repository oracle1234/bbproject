package service;

import java.util.List;

import dto.fb_CouponDTO;

public interface fb_CouponService {
	
	public List<fb_CouponDTO> couponlist(int member_no);

}
