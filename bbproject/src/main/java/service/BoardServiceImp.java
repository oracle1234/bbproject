package service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDAO;
import dto.BoardDTO;
import dto.CommentDTO;
import dto.PageDTO;

public class BoardServiceImp implements BoardService {
	private BoardDAO bdao;

	public BoardServiceImp() {

	}

	public void setDao(BoardDAO bdao) {
		this.bdao = bdao;
	}

	@Override
	public int countProcess(int boardcategory_no) {

		return bdao.count(boardcategory_no);
	}
	
	
	@Override
	public List<BoardDTO> listProcess(PageDTO pv) {
		
		return bdao.list(pv);
	}
	
	//
	@Override
	public List<BoardDTO> pageListProcess(HashMap<String, Object> map) {
		
		return bdao.pageList(map);
	}

	@Override
	public void insertProcess(BoardDTO bdto) {
		bdao.save(bdto);

	}

	@Override
	public BoardDTO contentProcess(int num) {
		bdao.readCount(num);
		return bdao.content(num);
	}

	@Override
	public BoardDTO updateSelectProcess(int num) {
		
		return bdao.updateNum(num);
	}

	@Override
	public void updateProcess(BoardDTO bdto) {

		bdao.update(bdto);
	}// end updateProcess()

	@Override
	public void deleteProcess(int num) {

		bdao.delete(num);

	}// end deleteProcess()

	
	/*@Override
	public List<CommentDTO> commentListProcess(int comment_no) {
		
		return null;
	}*/

	//
	@Override
	public List<CommentDTO> commentPageProcess(HashMap<String, Object> map) {
		
		return bdao.commentPageList(map);
	}

	//
	@Override
	public int commentCountProcess(int comment_no) {
		
		return bdao.commentCount(comment_no);
	}

	@Override
	public void commentInsertProcess(HashMap<String, Object> map) {
		
		bdao.commentSaveList(map);
	}

	@Override
	public void commentUpdateProcess(HashMap<String, Object> map) {
		
		bdao.commentUpdateList(map);
	}

	@Override
	public void commentDeleteProcess(HashMap<String, Object> map) {
		
		bdao.commentDeleteList(map);
	}

}
