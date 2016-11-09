package dao;

import org.apache.ibatis.session.SqlSessionFactory;

public class DaoImp implements DAO{
	private SqlSessionFactory sqlSession;
	
	public DaoImp() {
	}

	public void setSqlSession(SqlSessionFactory sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
}
