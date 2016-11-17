package service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
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
	public int countProcess() {

		return bdao.count();
	}

	@Override
	public List<BoardDTO> listProcess(PageDTO pv) {

		return bdao.list(pv);
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
	public void reStepProcess(CommentDTO cdto) {
		bdao.reStepCount(cdto);
		cdto.setComment_re_step(cdto.getComment_re_step() + 1);
		cdto.setComment_re_level(cdto.getComment_re_level() + 1);
		bdao.save(cdto);
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
}
