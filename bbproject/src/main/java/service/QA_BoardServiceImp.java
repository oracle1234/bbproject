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

import dao.QA_BoardDAO;
import dto.QA_BoardDTO;
import dto.CommentDTO;
import dto.PageDTO;

public class QA_BoardServiceImp implements QA_BoardService {
	private QA_BoardDAO qdao;

	public QA_BoardServiceImp() {

	}

	public void setDao(QA_BoardDAO qdao) {
		this.qdao = qdao;
	}

	@Override
	public int countProcess(int boardcategory_no) {

		return qdao.count(boardcategory_no);
	}

	@Override
	public List<QA_BoardDTO> listProcess(PageDTO pv) {

		return qdao.list(pv);
	}
	
	@Override
	public List<QA_BoardDTO> pageListProcess(HashMap<String, Object> map) {
		
		return qdao.pageList(map);
	}

	@Override
	public void insertProcess(QA_BoardDTO qdto) {
		qdao.save(qdto);
	}

	@Override
	public QA_BoardDTO contentProcess(int num) {
		qdao.readCount(num);
		return qdao.content(num);
	}

	@Override
	public QA_BoardDTO updateSelectProcess(int num) {

		return qdao.updateNum(num);
	}

	@Override
	public void updateProcess(QA_BoardDTO dto, HttpServletRequest request) {
		String filename = qdao.getFile(dto.getQa_no());
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
			dto.setQa_upload(random + "_" + fileName);
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
		qdao.update(dto);
	}// end updateProcess()

	@Override
	public void deleteProcess(int num, HttpServletRequest request) {
		String upload = qdao.getFile(num);
		if (upload != null) {
			String root = request.getSession().getServletContext().getRealPath("/");
			String saveDirectory = root + "temp" + File.separator;
			File fe = new File(saveDirectory, upload);
			fe.delete();
		}
		qdao.delete(num);
	}// end deleteProcess()

}
