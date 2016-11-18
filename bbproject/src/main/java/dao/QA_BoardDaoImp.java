package dao;

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
	public int count() {

		return sqlSession.selectOne("board.qa_count");
	}

	@Override
	public List<QA_BoardDTO> list(PageDTO pv) {

		return sqlSession.selectList("board.qa_list", pv);
	}

	@Override
	public void readCount(int num) {
		sqlSession.update("board.qa_readCount", num);

	}

	@Override
	public QA_BoardDTO content(int num) {

		return sqlSession.selectOne("board.qa_content", num);
	}

	@Override
	public void reStepCount(CommentDTO dto) {
		sqlSession.update("board.qa_reStepCount", dto);

	}

	@Override
	public void save(CommentDTO cdto) {
		sqlSession.insert("board.qac_save", cdto);

	}
	
	@Override
	public void save(QA_BoardDTO qdto) {
		sqlSession.insert("board.qa_save",qdto);
	}

	@Override
	public QA_BoardDTO updateNum(int num) {
		return sqlSession.selectOne("board.qa_content", num);
	}

	@Override
	public void update(QA_BoardDTO dto) {
		sqlSession.update("board.qa_update", dto);

	}

	@Override
	public void delete(int num) {
		sqlSession.delete("board.qa_delete", num);

	}

	@Override
	public String getFile(int num) {

		return sqlSession.selectOne("board.uploadFile", num);

	}

}
