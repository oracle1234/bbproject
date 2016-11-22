package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.BoardDTO;
import dto.CommentDTO;
import dto.PageDTO;
import dto.QA_BoardDTO;
import service.BoardService;
import service.Photo_BoardService;
import service.QA_BoardService;

@Controller
public class BoardController {
	private BoardService service;
	private QA_BoardService qa_service;
	private Photo_BoardService photo_service;

	private int currentPage;
	private PageDTO pdto;
	private CommentDTO cdto;

	public BoardController() {

	}

	public void setService(BoardService service) {
		this.service = service;
	}

	public void setQa_service(QA_BoardService qa_service) {
		this.qa_service = qa_service;
	}

	public void setPhoto_service(Photo_BoardService photo_service) {
		this.photo_service = photo_service;
	}

	// [자유게시판]
	@RequestMapping("/board_list.do")
	public ModelAndView board_listMethod(PageDTO pv) {

		ModelAndView mav = new ModelAndView();

		int totalRecord = service.countProcess();
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();

			pdto = new PageDTO(currentPage, totalRecord);

			mav.addObject("pv", pdto);
			mav.addObject("aList", service.listProcess(pdto));
		}

		mav.setViewName("board_list");
		return mav;
	}// end board_listMethod()

	@RequestMapping("/board_view.do")
	public ModelAndView board_viewMethod(int currentPage, BoardDTO bdto) {
		ModelAndView mav = new ModelAndView();
		BoardDTO dto = service.contentProcess(bdto.getBoard_no());
		mav.addObject("dto", dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("board_view");
		return mav;
	}// end board_viewMethod()

	@RequestMapping(value = "/board_write.do", method = RequestMethod.GET)
	public ModelAndView board_writeMethod(PageDTO pv, CommentDTO cdto) {
		ModelAndView mav = new ModelAndView();
		// 답변글이면
		if (cdto.getComment_ref() != 0) {
			mav.addObject("currentPage", pv.getCurrentPage());
			mav.addObject("dto", cdto);
		}
		mav.setViewName("board_write");
		return mav;

	}// end board_writeMethod()

	@RequestMapping(value = "/board_write.do", method = RequestMethod.POST)
	public String board_writeProMethod(BoardDTO bdto, CommentDTO cdto) {

		// 답변글이면
		if (cdto.getComment_ref() != 0) {
			service.reStepProcess(cdto);
		} else {
			service.insertProcess(bdto);
		}

		return "redirect:/board_list.do";
	}// end writeProMethod

	@RequestMapping(value = "/board_update.do", method = RequestMethod.GET)
	public ModelAndView board_updateMethod(BoardDTO bdto, int currentPage) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", service.updateSelectProcess(bdto.getBoard_no()));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("board_update");
		return mav;

	}// end board_updateMethod()

	@RequestMapping(value = "/board_update.do", method = RequestMethod.POST)
	public ModelAndView board_updateProMethod(BoardDTO bdto, int currentPage) {
		ModelAndView mav = new ModelAndView();
		service.updateProcess(bdto);
		mav.addObject("currentPage", currentPage);
		mav.addObject("pv", pdto);
		mav.addObject("aList", service.listProcess(pdto));
		mav.setViewName("board_list");
		return mav;

	}// end board_updateProMethod()

	@RequestMapping("/board_delete.do")
	public ModelAndView board_deleteMethod(BoardDTO bdto, int currentPage) {
		ModelAndView mav = new ModelAndView();
		service.deleteProcess(bdto.getBoard_no());

		PageDTO pv = new PageDTO(service.countProcess());
		if (pv.getTotalPage() < currentPage)
			mav.addObject("currentPage", pv.getTotalPage());
		else
			mav.addObject("currentPage", currentPage);
		mav.addObject("pv", pdto);
		mav.addObject("aList", service.listProcess(pdto));
		mav.setViewName("board_list");
		return mav;

	}// end deleteMethod()

	// [QA게시판]
	@RequestMapping("/qa_list.do")
	public ModelAndView qa_listMethod(PageDTO pv) {

		ModelAndView mav = new ModelAndView();

		int totalRecord = qa_service.countProcess();
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();

			pdto = new PageDTO(currentPage, totalRecord);

			mav.addObject("pv", pdto);
			mav.addObject("aList", qa_service.listProcess(pdto));
		}
		mav.setViewName("qa_list");
		return mav;
	}// end qa_listMethod()

	@RequestMapping("/qa_view.do")
	public ModelAndView qa_viewMethod(int currentPage, QA_BoardDTO qdto) {
		ModelAndView mav = new ModelAndView();
		QA_BoardDTO dto = qa_service.contentProcess(qdto.getQa_no());
		mav.addObject("dto", dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("qa_view");
		return mav;
	}// end qa_viewMethod()

	@RequestMapping(value = "/qa_write.do", method = RequestMethod.GET)
	public ModelAndView qa_writeMethod(PageDTO pv, CommentDTO cdto) {
		ModelAndView mav = new ModelAndView();
		if (cdto.getComment_ref() != 0) {
			mav.addObject("currentPage", pv.getCurrentPage());
			mav.addObject("dto", cdto);
		}
		mav.setViewName("qa_write");
		return mav;

	}// end qa_writeMethod()

	@RequestMapping(value = "/qa_write.do", method = RequestMethod.POST)
	public String qa_writeProMethod(QA_BoardDTO qdto, CommentDTO cdto, HttpServletRequest request) {

		MultipartFile file = qdto.getFilename();
		if (!file.isEmpty()) {
			String fileName = file.getOriginalFilename();

			// 중복파일명을 처리하기 위해 난수 발생
			UUID random = UUID.randomUUID();
			String root = request.getSession().getServletContext().getRealPath("/");
			// root+"temp/"
			String saveDirectory = root + "temp" + File.separator;
			File fe = new File(saveDirectory);
			if (!fe.exists())
				fe.mkdir();

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
			qdto.setQa_upload(random + "_" + fileName);
		}

		// 답변글이면
		if (cdto.getComment_ref() != 0) {
			qa_service.reStepProcess(cdto);
		} else {
			qa_service.insertProcess(qdto);
		}

		return "redirect:/qa_list.do";
	}// end writeProMethod

	@RequestMapping("/contentdownload.do")
	public ModelAndView downMethod(QA_BoardDTO qdto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("qa_no", qdto.getQa_no());
		mav.setViewName("download");
		return mav;

	}// end downMethod()

	@RequestMapping(value = "/qa_update.do", method = RequestMethod.GET)
	public ModelAndView qa_updateMethod(QA_BoardDTO qdto, int currentPage) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", service.updateSelectProcess(qdto.getQa_no()));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("qa_update");
		return mav;

	}// end qa_updateMethod()

	@RequestMapping(value = "/qa_update.do", method = RequestMethod.POST)
	public ModelAndView qa_updateProMethod(QA_BoardDTO dto, int currentPage, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		qa_service.updateProcess(dto, request);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("qa_list");
		return mav;

	}// end qa_updateProMethod()

	@RequestMapping("/qa_delete.do")
	public ModelAndView qa_deleteMethod(QA_BoardDTO qdto, int currentPage, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		qa_service.deleteProcess(qdto.getQa_no(), request);
		PageDTO pv = new PageDTO(qa_service.countProcess());
		if (pv.getTotalPage() < currentPage) {
			mav.addObject("currentPage", pv.getTotalPage());
		}
		mav.setViewName("qa_list");
		return mav;

	}// end qa_deleteMethod()

	// [Photo게시판]
	@RequestMapping("/photo_list.do")
	public ModelAndView photo_listMethod(PageDTO pv) {

		ModelAndView mav = new ModelAndView();

		int totalRecord = photo_service.countProcess();
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();

			pdto = new PageDTO(currentPage, totalRecord);

			mav.addObject("pv", pdto);
			mav.addObject("aList", service.listProcess(pdto));
		}

		mav.setViewName("photo_list");
		return mav;
	}

}
