package dao;

import java.util.List;

import dto.MemberDTO;
import dto.fb_CouponDTO;

public interface fb_CouponDAO {
	
	public List<fb_CouponDTO> list(int num);

	public List<fb_CouponDTO> adminCouponList();
	
	public void adminCouponIns(fb_CouponDTO dto);
	
	public void adminCouponDel(fb_CouponDTO dto);

	public MemberDTO adminCouponIdChk(String id);

	public void adminCouponMemIns(fb_CouponDTO dto);

}
