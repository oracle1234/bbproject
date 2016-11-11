package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.fb_BoardDTO;
import dto.fb_CommentDTO;
import dto.fb_PageDTO;

public class fb_BoardDaoImp implements fb_BoardDAO {
	private SqlSessionTemplate sqlSession;

	public fb_BoardDaoImp() {

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int count() {

		return sqlSession.selectOne("board.count");
	}

	@Override
	public List<fb_BoardDTO> list(fb_PageDTO pv) {

		return sqlSession.selectList("board.list", pv);
	}

	@Override
	public void readCount(int num) {
		sqlSession.update("board.readCount", num);

	}

	@Override
	public fb_BoardDTO content(int num) {

		return sqlSession.selectOne("board.content", num);
	}

	@Override
	public void reStepCount(fb_CommentDTO dto) {
		sqlSession.update("board.reStepCount", dto);

	}

	@Override
	public void save(fb_CommentDTO dto) {
		sqlSession.insert("board.save", dto);

	}

	@Override
	public fb_BoardDTO updateNum(int num) {

		return sqlSession.selectOne("board.content", num);
	}

	@Override
	public void update(fb_BoardDTO dto) {
		sqlSession.update("board.update", dto);

	}

	@Override
	public void delete(int num) {
		sqlSession.delete("board.delete", num);

	}

	@Override
	public String getFile(int num) {

		return sqlSession.selectOne("board.uploadFile", num);

	}

}
