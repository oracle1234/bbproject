package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.Photo_BoardDTO;
import dto.CommentDTO;
import dto.PageDTO;

public class Photo_BoardDaoImp implements Photo_BoardDAO {
	private SqlSessionTemplate sqlSession;

	public Photo_BoardDaoImp() {

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int count() {

		return sqlSession.selectOne("board.photo_count");
	}

	@Override
	public List<Photo_BoardDTO> list(PageDTO pv) {

		return sqlSession.selectList("board.photo_list", pv);
	}

	@Override
	public void readCount(int num) {
		sqlSession.update("board.photo_readCount", num);

	}

	@Override
	public Photo_BoardDTO content(int num) {

		return sqlSession.selectOne("board.photo_content", num);
	}

	@Override
	public void reStepCount(CommentDTO cdto) {
		sqlSession.update("board.reStepCount", cdto);

	}

	@Override
	public void save(CommentDTO cdto) {
		sqlSession.insert("board.bc_save", cdto);

	}
	
	@Override
	public void save(Photo_BoardDTO bdto) {
		sqlSession.insert("board.b_save", bdto);
	}

	@Override
	public Photo_BoardDTO updateNum(int num) {

		return sqlSession.selectOne("board.photo_content", num);
	}

	@Override
	public void update(Photo_BoardDTO bdto) {
		sqlSession.update("board.photo_update", bdto);

	}

	@Override
	public void delete(int num) {
		sqlSession.delete("board.photo_delete", num);

	}

	@Override
	public String getFile(int num) {
		
		return sqlSession.selectOne("board.photo_uploadFile", num);
	}

}
