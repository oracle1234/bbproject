package dao;

import org.mybatis.spring.SqlSessionTemplate;

public class DaoImp implements DAO{
	private SqlSessionTemplate sqlSession;
	
	public DaoImp() {
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
}
