package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.CommentDTO;
import dto.PageDTO;
import dto.QA_BoardDTO;

public interface QA_BoardService {
	
	public int countProcess();
	public List<QA_BoardDTO> listProcess(PageDTO pv);
	public void insertProcess(QA_BoardDTO qdto);
	public QA_BoardDTO contentProcess(int num);
	public QA_BoardDTO updateSelectProcess(int num);
	public void updateProcess(QA_BoardDTO qdto,HttpServletRequest request);
	public void deleteProcess(int num,HttpServletRequest request);
}











