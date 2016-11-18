package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;
import dto.CommentDTO;
import dto.PageDTO;

public class BoardDaoImp implements BoardDAO {
	private SqlSessionTemplate sqlSession;

	public BoardDaoImp() {

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int count() {

		return sqlSession.selectOne("board.count");
	}

	@Override
	public List<BoardDTO> list(PageDTO pv) {

		return sqlSession.selectList("board.list", pv);
	}

	@Override
	public void readCount(int num) {
		sqlSession.update("board.readCount", num);

	}

	@Override
	public BoardDTO content(int num) {

		return sqlSession.selectOne("board.content", num);
	}

	@Override
	public void reStepCount(CommentDTO cdto) {
		sqlSession.update("board.reStepCount", cdto);

	}

	@Override
	public void save(CommentDTO cdto) {
		sqlSession.insert("board.c_save", cdto);

	}
	
	@Override
	public void save(BoardDTO bdto) {
		sqlSession.insert("board.b_save", bdto);
	}

	@Override
	public BoardDTO updateNum(int num) {

		return sqlSession.selectOne("board.content", num);
	}

	@Override
	public void update(BoardDTO bdto) {
		sqlSession.update("board.update", bdto);

	}

	@Override
	public void delete(int num) {
		sqlSession.delete("board.delete", num);

	}

}
