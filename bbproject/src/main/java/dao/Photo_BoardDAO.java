package dao;

import java.util.HashMap;
import java.util.List;

import dto.Photo_BoardDTO;
import dto.CommentDTO;
import dto.PageDTO;

public interface Photo_BoardDAO {
	public int count(int boardcategory_no);
	public List<Photo_BoardDTO> list(PageDTO pv);
	public List<Photo_BoardDTO> pageList(HashMap<String, Object> map);
	public Photo_BoardDTO content(int num);
	public void save(Photo_BoardDTO pdto);
	public Photo_BoardDTO updateNum(int num);
	public void update(Photo_BoardDTO pdto);
	public void delete(int num);
	public String getFile(int num);
}
