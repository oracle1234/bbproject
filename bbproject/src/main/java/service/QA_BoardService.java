package service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.CommentDTO;
import dto.PageDTO;
import dto.QA_BoardDTO;

public interface QA_BoardService {
	
	public int countProcess(int boardcategory_no);
	public List<QA_BoardDTO> listProcess(PageDTO pv);
	public List<QA_BoardDTO> pageListProcess(HashMap<String, Object> map);
	public List<CommentDTO> commentPageProcess(HashMap<String, Object> map);
	public void insertProcess(QA_BoardDTO qdto);
	public QA_BoardDTO updateSelectProcess(int num);
	public void updateProcess(QA_BoardDTO qdto,HttpServletRequest request);
	public void deleteProcess(int num,HttpServletRequest request);
	public QA_BoardDTO contentProcess(int num);
	public int commentCountProcess(int qa_no);
	public void commentInsertProcess(HashMap<String, Object> map);
	public void commentUpdateProcess(HashMap<String, Object> map);
	public void commentDeleteProcess(HashMap<String, Object> map);
	public List<QA_BoardDTO> searchListProcess(HashMap<String, Object> Map);
}











