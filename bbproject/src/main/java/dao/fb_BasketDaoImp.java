package dao;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.fb_BasketDTO;

public class fb_BasketDaoImp implements fb_BasketDAO{
	
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public fb_BasketDaoImp() {
		
	}
	
	@Override
	public List<fb_BasketDTO> list(int member_no) {
		return sqlSession.selectList("basket.list",member_no);
	}

	@Override
	public void amountUpdate(fb_BasketDTO bdto) {
		sqlSession.update("basket.amount", bdto);
		
	}

	@Override
	public void delete(int foods_no) {
		sqlSession.delete("basket.delete", foods_no);
		
	}


}//end class
