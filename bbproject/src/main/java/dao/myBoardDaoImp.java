package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;
import dto.Photo_BoardDTO;
import dto.QA_BoardDTO;
import dto.fb_OrderDTO;

public class myBoardDaoImp implements myBoardDAO{
	
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public myBoardDaoImp() {
	}

	@Override
	public List<BoardDTO> BoardList(int member_no) {
		return sqlSession.selectList("myboard.boardlist", member_no);
	}

	@Override
	public List<Photo_BoardDTO> PhotoList(int member_no) {
		return sqlSession.selectList("myboard.photolist", member_no);
	}

	@Override
	public List<QA_BoardDTO> QaList(int member_no) {
		return sqlSession.selectList("myboard.qalist", member_no);
	}
}
