package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.BoardDTO;
import dto.CommentDTO;
import dto.PageDTO;

public interface BoardService {
	
	public int countProcess();
	public List<BoardDTO> listProcess(PageDTO pv);
	public void insertProcess(CommentDTO dto);
	public BoardDTO contentProcess(int num);
	public void reStepProcess(CommentDTO dto);
	public BoardDTO updateSelectProcess(int num);
	public void updateProcess(BoardDTO dto,HttpServletRequest request);
	public void deleteProcess(int num,HttpServletRequest request);
}











