package service;

import java.util.List;

import dto.fb_CouponDTO;

public interface fb_CouponService {
	
	public List<fb_CouponDTO> couponlistProcess(int member_no);

	public List<fb_CouponDTO> adminCouponListProcess();
	
	public List<fb_CouponDTO> adminCouponInsProcess(fb_CouponDTO dto);
	
	public List<fb_CouponDTO> adminCouponDelProcess(fb_CouponDTO dto);

}
