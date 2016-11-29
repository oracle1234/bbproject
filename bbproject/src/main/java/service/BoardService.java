package service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.BoardDTO;
import dto.CommentDTO;
import dto.PageDTO;

public interface BoardService {
	
	public int countProcess(int boardcategry_no);
	public List<BoardDTO> listProcess(PageDTO pv);
	public List<BoardDTO> pageListProcess(HashMap<String, Object> map);
	public List<CommentDTO> commentPageProcess(HashMap<String, Object> map);
	public void insertProcess(BoardDTO bdto);
	public BoardDTO updateSelectProcess(int num);
	public void updateProcess(BoardDTO bdto);
	public void deleteProcess(int num);
	public BoardDTO contentProcess(int num);
	public int commentCountProcess(int board_no);
	public void commentInsertProcess(HashMap<String, Object> map);
	public void commentUpdateProcess(HashMap<String, Object> map);
	public void commentDeleteProcess(HashMap<String, Object> map);
}











