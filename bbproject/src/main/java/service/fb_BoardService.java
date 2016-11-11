package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.fb_BoardDTO;
import dto.fb_CommentDTO;
import dto.fb_PageDTO;

public interface fb_BoardService {
	
	public int countProcess();
	public List<fb_BoardDTO> listProcess(fb_PageDTO pv);
	public void insertProcess(fb_CommentDTO dto);
	public fb_BoardDTO contentProcess(int num);
	public void reStepProcess(fb_CommentDTO dto);
	public fb_BoardDTO updateSelectProcess(int num);
	public void updateProcess(fb_BoardDTO dto,HttpServletRequest request);
	public void deleteProcess(int num,HttpServletRequest request);
}











