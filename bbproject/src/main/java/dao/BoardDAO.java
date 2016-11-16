package dao;

import java.util.List;

import dto.BoardDTO;
import dto.CommentDTO;
import dto.PageDTO;

public interface BoardDAO {
	public int count();
	public List<BoardDTO> list(PageDTO pv);
	public void readCount(int num);
	public BoardDTO content(int num);
	public void reStepCount(CommentDTO dto);
	public void save(BoardDTO dto);
	public void save(CommentDTO cdto);
	public BoardDTO updateNum(int num);
	public void update(BoardDTO dto);
	public void delete(int num);
}
