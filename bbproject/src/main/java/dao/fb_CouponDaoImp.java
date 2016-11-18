package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;


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

}
