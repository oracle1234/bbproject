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

import dao.fb_BoardDAO;
import dto.fb_BoardDTO;
import dto.fb_CommentDTO;
import dto.fb_PageDTO;

public class fb_BoardServiceImp implements fb_BoardService {
	private fb_BoardDAO dao;

	public fb_BoardServiceImp() {

	}

	public void setDao(fb_BoardDAO dao) {
		this.dao = dao;
	}

	@Override
	public int countProcess() {

		return dao.count();
	}

	@Override
	public List<fb_BoardDTO> listProcess(fb_PageDTO pv) {

		return dao.list(pv);
	}

	@Override
	public void insertProcess(fb_CommentDTO dto) {
		dao.save(dto);

	}

	@Override
	public fb_BoardDTO contentProcess(int num) {
		dao.readCount(num);
		return dao.content(num);
	}

	@Override
	public void reStepProcess(fb_CommentDTO dto) {
		dao.reStepCount(dto);
		dto.setComment_re_step(dto.getComment_re_step() + 1);
		dto.setComment_re_level(dto.getComment_re_level() + 1);
		dao.save(dto);
	}

	@Override
	public fb_BoardDTO updateSelectProcess(int num) {

		return dao.updateNum(num);
	}

	@Override
	public void updateProcess(fb_BoardDTO dto, HttpServletRequest request) {
		String filename = dao.getFile(dto.getBoard_no());
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root + "temp" + File.separator;

		MultipartFile file = dto.getFilename();
		// 수정할 첨부파일이 있으면...
		if (!file.isEmpty()) {

			// 중복파일명을 처리하기 위해서 난수발생
			UUID random = UUID.randomUUID();

			// 기존 첨부파일이 있으면....
			if (filename != null) {
				File fe = new File(saveDirectory, filename);
				fe.delete();
			}

			String fileName = file.getOriginalFilename();
			dto.setUpload(random + "_" + fileName);

			File ff = new File(saveDirectory, random + "_" + fileName);

			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		dto.setBoard_ip(request.getRemoteAddr());
		dao.update(dto);
	}// end updateProcess()

	@Override
	public void deleteProcess(int num, HttpServletRequest request) {
		String upload = dao.getFile(num);
		if(upload != null){
			String root = request.getSession().getServletContext().getRealPath("/");
			String saveDirectory = root + "temp" + File.separator;
			File fe = new File(saveDirectory, upload);
			fe.delete();
		}
		
		dao.delete(num);
		
	}

}
