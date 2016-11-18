package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;
import dto.Photo_BoardDTO;
import dto.QA_BoardDTO;
import dto.myBoardDTO;

public class myBoardDaoImp implements myBoardDAO{
	
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public myBoardDaoImp() {
	}

	@Override
	public List<myBoardDTO> myBoardList(HashMap<String, Integer> map) {
		return sqlSession.selectList("myboard.all", map);
	}



}
