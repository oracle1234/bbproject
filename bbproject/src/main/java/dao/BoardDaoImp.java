package dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public int count(int boardcategory_no) {

		return sqlSession.selectOne("board.count", boardcategory_no);
	}

	@Override
	public List<BoardDTO> list(PageDTO pv) {

		return sqlSession.selectList("board.pageList", pv);
	}

	@Override
	public List<BoardDTO> pageList(HashMap<String, Object> map) {

		return sqlSession.selectList("board.pageList", map);
	}

	@Override
	public void readCount(int num) {
		sqlSession.update("board.readCount", num);

	}

	@Override
	public BoardDTO content(int num) {

		return sqlSession.selectOne("board.list", num);
	}

	@Override
	public void save(BoardDTO bdto) {
		
		sqlSession.insert("board.save", bdto);
	}

	@Override
	public BoardDTO updateNum(int num) {

		return sqlSession.selectOne("board.list", num);
	}

	@Override
	public void update(BoardDTO bdto) {
		sqlSession.update("board.update", bdto);

	}

	@Override
	public void delete(int num) {
		sqlSession.delete("board.delete", num);
	}

	@Override
	public int commentCount(int board_no) {

		return sqlSession.selectOne("board.commentCount", board_no);
	}

	@Override
	public List<CommentDTO> commentPageList(HashMap<String, Object> map) {

		return sqlSession.selectList("board.commentPageList", map);
	}

	@Override
	public void commentSaveList(HashMap<String, Object> map) {

		sqlSession.selectList("board.commentSave", map);
	}

	@Override
	public void commentUpdateList(HashMap<String, Object> map) {

		sqlSession.selectList("board.commentUpdate", map);
	}

	@Override
	public void commentDeleteList(HashMap<String, Object> map) {

		sqlSession.selectList("board.commentDelete", map);
	}

	@Override
	public List<BoardDTO> searchList(HashMap<String,Object> map) {
		
		return sqlSession.selectList("board.search", map);
	}

}
