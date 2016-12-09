package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.CommentDTO;
import dto.PageDTO;
import dto.QA_BoardDTO;

public class QA_BoardDaoImp implements QA_BoardDAO {
	private SqlSessionTemplate sqlSession;

	public QA_BoardDaoImp() {

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int count(int boardcategory_no) {

		return sqlSession.selectOne("board.qa_count", boardcategory_no);
	}

	@Override
	public List<QA_BoardDTO> list(PageDTO pv) {

		return sqlSession.selectList("board.qa_pageList", pv);
	}

	@Override
	public List<QA_BoardDTO> pageList(HashMap<String, Object> map) {

		return sqlSession.selectList("board.qa_pageList", map);
	}

	@Override
	public int commentCount(int qa_no) {

		return sqlSession.selectOne("board.qa_commentCount", qa_no);
	}

	@Override
	public void readCount(int num) {

		sqlSession.update("board.qa_readCount", num);

	}

	@Override
	public QA_BoardDTO content(int num) {

		return sqlSession.selectOne("board.qa_list", num);
	}

	@Override
	public void reStepCount(CommentDTO cdto) {

		sqlSession.update("board.qa_reStepCount", cdto);

	}

	@Override
	public void save(QA_BoardDTO qdto) {

		sqlSession.insert("board.qa_save", qdto);
	}

	@Override
	public QA_BoardDTO updateNum(int num) {

		return sqlSession.selectOne("board.qa_list", num);
	}

	@Override
	public void update(QA_BoardDTO qdto) {

		sqlSession.update("board.qa_update", qdto);

	}

	@Override
	public void delete(int num) {

		sqlSession.delete("board.qa_delete", num);

	}

	@Override
	public String getFile(int num) {

		return sqlSession.selectOne("board.qa_uploadFile", num);

	}

	@Override
	public List<CommentDTO> commentPageList(HashMap<String, Object> map) {

		return sqlSession.selectList("board.qa_commentPageList", map);
	}

	@Override
	public void commentSaveList(HashMap<String, Object> map) {

		sqlSession.selectList("board.qa_commentSave", map);

	}

	@Override
	public void commentUpdateList(HashMap<String, Object> map) {

		sqlSession.selectList("board.qa_commentUpdate", map);

	}

	@Override
	public void commentDeleteList(HashMap<String, Object> map) {
		sqlSession.delete("board.qa_commentDelete", map);

	}

	@Override
	public List<QA_BoardDTO> searchList(HashMap<String, Object> map) {
		
		return sqlSession.selectList("board.qa_search", map);
	}

}
