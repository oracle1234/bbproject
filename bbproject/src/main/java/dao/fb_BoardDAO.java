package dao;

import java.util.List;

import dto.fb_BoardDTO;
import dto.fb_CommentDTO;
import dto.fb_PageDTO;

public interface fb_BoardDAO {
	public int count();
	public List<fb_BoardDTO> list(fb_PageDTO pv);
	public void readCount(int num);
	public fb_BoardDTO content(int num);
	public void reStepCount(fb_CommentDTO dto);
	public void save(fb_CommentDTO dto);
	public fb_BoardDTO updateNum(int num);
	public void update(fb_BoardDTO dto);
	public void delete(int num);
	public String getFile(int num);
}
