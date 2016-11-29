package dao;

import java.util.List;

import dto.Photo_BoardDTO;
import dto.CommentDTO;
import dto.PageDTO;

public interface Photo_BoardDAO {
	public int count();
	public List<Photo_BoardDTO> list(PageDTO pv);
	public void readCount(int num);
	public Photo_BoardDTO content(int num);
	public void reStepCount(CommentDTO cdto);
	public void save(Photo_BoardDTO pdto);
	public void save(CommentDTO cdto);
	public Photo_BoardDTO updateNum(int num);
	public void update(Photo_BoardDTO pdto);
	public void delete(int num);
	public String getFile(int num);
}
