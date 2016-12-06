package dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.BoardDTO;
import dto.CommentDTO;
import dto.PageDTO;

public interface BoardDAO {
	public int count(int boardcategory_no);
	public List<BoardDTO> list(PageDTO pv);
	public List<BoardDTO> pageList(HashMap<String, Object> map);
	public int commentCount(int board_no);
	public List<CommentDTO> commentPageList(HashMap<String, Object> map);
	public void readCount(int num);
	public BoardDTO content(int num);
	public void save(BoardDTO bdto);
	public BoardDTO updateNum(int num);
	public void update(BoardDTO bdto);
	public void delete(int num);
	public void commentSaveList(HashMap<String, Object> map);
	public void commentUpdateList(HashMap<String, Object> map);
	public void commentDeleteList(HashMap<String, Object> map);
	public List<BoardDTO> searchList(HashMap<String, Object> map);
}
