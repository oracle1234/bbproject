package service;

import java.util.List;

import dao.fb_CouponDAO;
import dto.MemberDTO;
import dto.fb_CouponDTO;

public class fb_CouponServiceImp implements fb_CouponService{
	
	private fb_CouponDAO dao;
	
	public fb_CouponServiceImp() {

	}
	
	public void setDao(fb_CouponDAO dao) {
		this.dao = dao;
	}


	@Override
	public List<fb_CouponDTO> couponlistProcess(int member_no) {
		return dao.list(member_no);
	}

	@Override
	public List<fb_CouponDTO> adminCouponListProcess() {
		return dao.adminCouponList();
	}

	@Override
	public List<fb_CouponDTO> adminCouponInsProcess(fb_CouponDTO dto) {
		dao.adminCouponIns(dto);
		return dao.adminCouponList(); 
	}

	@Override
	public List<fb_CouponDTO> adminCouponDelProcess(fb_CouponDTO dto) {
		dao.adminCouponDel(dto);
		return dao.adminCouponList(); 
	}

	@Override
	public MemberDTO adminCouponIdChkProcess(String id) {
		return dao.adminCouponIdChk(id);
	}

	@Override
	public List<fb_CouponDTO> adminCouponMemProcess(fb_CouponDTO dto) {
		dao.adminCouponMemIns(dto);
		return dao.adminCouponList();
	}
}
