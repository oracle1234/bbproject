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

import dao.Photo_BoardDAO;
import dto.Photo_BoardDTO;
import dto.CommentDTO;
import dto.PageDTO;

public class Photo_BoardServiceImp implements Photo_BoardService {
	private Photo_BoardDAO pdao;

	public Photo_BoardServiceImp() {

	}

	public void setDao(Photo_BoardDAO pdao) {
		this.pdao = pdao;
	}

	@Override
	public int countProcess() {

		return pdao.count();
	}

	@Override
	public List<Photo_BoardDTO> listProcess(PageDTO pv) {

		return pdao.list(pv);
	}

	@Override
	public void insertProcess(Photo_BoardDTO pdto) {
		pdao.save(pdto);
	}

	@Override
	public Photo_BoardDTO contentProcess(int num) {
		pdao.readCount(num);
		return pdao.content(num);
	}

	@Override
	public void reStepProcess(CommentDTO dto) {
		pdao.reStepCount(dto);
		dto.setComment_re_step(dto.getComment_re_step() + 1);
		dto.setComment_re_level(dto.getComment_re_level() + 1);
		pdao.save(dto);
	}

	@Override
	public Photo_BoardDTO updateSelectProcess(int num) {

		return pdao.updateNum(num);
	}

	@Override
	public void updateProcess(Photo_BoardDTO pdto, HttpServletRequest request) {
		String filename = pdao.getFile(pdto.getPhoto_no());
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root + "temp" + File.separator;

		MultipartFile file = pdto.getFilename();
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
			pdto.setPhoto_upload(random + "_" + fileName);

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
		pdao.update(pdto);
	}// end updateProcess()

	@Override
	public void deleteProcess(int num, HttpServletRequest request) {
		String upload = pdao.getFile(num);
		if (upload != null) {
			String root = request.getSession().getServletContext().getRealPath("/");
			String saveDirectory = root + "temp" + File.separator;
			File fe = new File(saveDirectory, upload);
			fe.delete();
		}
		pdao.delete(num);
	}// end deleteProcess()
}
