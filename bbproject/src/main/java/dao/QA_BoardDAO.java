package dao;

import java.util.HashMap;
import java.util.List;

import dto.CommentDTO;
import dto.PageDTO;
import dto.QA_BoardDTO;

public interface QA_BoardDAO {
	public int count(int boardcategory_no);
	public List<QA_BoardDTO> list(PageDTO pv);
	public List<QA_BoardDTO> pageList(HashMap<String, Object> map);
	public int commentCount(int qa_no);
	public List<CommentDTO> commentPageList(HashMap<String, Object> map);
	public void readCount(int num);
	public QA_BoardDTO content(int num);
	public void reStepCount(CommentDTO cdto);
	public void save(QA_BoardDTO qdto);
	public void save(CommentDTO cdto);
	public QA_BoardDTO updateNum(int num);
	public void update(QA_BoardDTO qdto);
	public void delete(int num);
	public String getFile(int num);
}
