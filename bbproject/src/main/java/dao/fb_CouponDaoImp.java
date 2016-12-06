package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.MemberDTO;
import dto.fb_CouponDTO;

public class fb_CouponDaoImp implements fb_CouponDAO{
	
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public fb_CouponDaoImp() {
	}

	@Override
	public List<fb_CouponDTO> list(int member_no) {
		return sqlSession.selectList("coupon.list", member_no);
	}

	@Override
	public List<fb_CouponDTO> adminCouponList() {
		return sqlSession.selectList("coupon.adminlist");
	}

	@Override
	public void adminCouponIns(fb_CouponDTO dto) {
		sqlSession.insert("coupon.admincouponins", dto);
		
	}

	@Override
	public void adminCouponDel(fb_CouponDTO dto) {
		sqlSession.delete("coupon.admincoupondel", dto);
	}

	@Override
	public MemberDTO adminCouponIdChk(String id) {
		return sqlSession.selectOne("coupon.admincouponidchk", id);
	}

	@Override
	public void adminCouponMemIns(fb_CouponDTO dto) {
		sqlSession.insert("coupon.admincouponmemins", dto);
	}

}
