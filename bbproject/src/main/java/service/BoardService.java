package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.BoardDTO;
import dto.CommentDTO;
import dto.PageDTO;

public interface BoardService {
	
	public int countProcess();
	public List<BoardDTO> listProcess(PageDTO pv);
	public void insertProcess(BoardDTO bdto);
	public BoardDTO contentProcess(int num);
	public void reStepProcess(CommentDTO cdto);
	public BoardDTO updateSelectProcess(int num);
	public void updateProcess(BoardDTO bdto);
	public void deleteProcess(int num);
}











