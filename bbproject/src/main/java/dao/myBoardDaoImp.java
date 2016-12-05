package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		int value = map.get("boardcategory_no"); 
		if(value == 1)
			return sqlSession.selectList("myboard.all", map);
		else if (value == 2)
		return sqlSession.selectList("myboard.all2", map);
		else if (value == 3)
		return sqlSession.selectList("myboard.all3", map);
		return sqlSession.selectList("myboard.all", map);
	}

	@Override
	public myBoardDTO myboardtitleSearch(HashMap<String, Object> map) {
		Object value = map.get("boardcategory_no");
		if(value == "1")
		return sqlSession.selectOne("myboard.titlesearch1", map);
		else if(value == "2")
			return sqlSession.selectOne("myboard.titlesearch2", map);
		else if(value == "3")
			return sqlSession.selectOne("myboard.titlesearch3", map);
		return sqlSession.selectOne("myboard.titlesearch1", map);
	}

	@Override
	public myBoardDTO myboardcontentSearch(HashMap<String, Object> map) {
		Object value = map.get("boardcategory_no");
		if(value == "1")
		return sqlSession.selectOne("myboard.contentsearch1", map);
		else if(value == "2")
			return sqlSession.selectOne("myboard.contentsearch2", map);
		else if(value == "3")
			return sqlSession.selectOne("myboard.contentsearch3", map);
		return sqlSession.selectOne("myboard.contentsearch1", map);
	}


}
