package service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.CommentDTO;
import dto.PageDTO;
import dto.Photo_BoardDTO;

public interface Photo_BoardService {
	
	public int countProcess(int boardcategory_no);
	public List<Photo_BoardDTO> listProcess(PageDTO pv);
	public List<Photo_BoardDTO> pageListProcess(HashMap<String, Object> map);
	public void insertProcess(Photo_BoardDTO pdto);
	public Photo_BoardDTO contentProcess(int num);
	public Photo_BoardDTO updateSelectProcess(int num);
	public void updateProcess(Photo_BoardDTO pdto, HttpServletRequest request);
	public void deleteProcess(int num, HttpServletRequest request);	
}
