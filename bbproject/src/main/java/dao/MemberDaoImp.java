package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.MemberDTO;


public class MemberDaoImp implements MemberDAO {
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public MemberDaoImp() {
	}

	@Override
	public void insertMethod(MemberDTO dto) {
		sqlSession.insert("member.ins", dto);
		
	}

	@Override
	public int idcheck(String id) {
		return sqlSession.selectOne("member.ck", id);
	}

}
