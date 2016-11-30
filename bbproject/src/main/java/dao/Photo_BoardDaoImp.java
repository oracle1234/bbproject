package dao;

import java.util.HashMap;
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
	public int count(int boardcategory_no) {

		return sqlSession.selectOne("board.photo_count", boardcategory_no);
	}

	@Override
	public List<Photo_BoardDTO> list(PageDTO pv) {

		return sqlSession.selectList("board.photo_pageList", pv);
	}

	@Override
	public List<Photo_BoardDTO> pageList(HashMap<String, Object> map) {

		return sqlSession.selectList("board.photo_pageList", map);
	}

	@Override
	public Photo_BoardDTO content(int num) {

		return sqlSession.selectOne("board.photo_list", num);
	}

	@Override
	public void save(Photo_BoardDTO idto) {
		sqlSession.insert("board.photo_save", idto);
	}

	@Override
	public Photo_BoardDTO updateNum(int num) {

		return sqlSession.selectOne("board.photo_list", num);
	}

	@Override
	public void update(Photo_BoardDTO idto) {
		
		sqlSession.update("board.photo_update", idto);

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
