package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
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
import service.QA_BoardService;

@Controller
public class BoardController {
	private BoardService service;
	private QA_BoardService qa_service;
	
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
	public ModelAndView board_viewMethod(int currentPage, int num) {
		ModelAndView mav = new ModelAndView();
		BoardDTO dto = service.contentProcess(num);
		mav.addObject("dto", dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("board_view");
		return mav;
	}// end board_viewMethod()

	@RequestMapping(value = "/board_write.do", method = RequestMethod.GET)
	public ModelAndView board_writeMethod(PageDTO pv, CommentDTO cdto) {
		ModelAndView mav = new ModelAndView();
		if (cdto.getComment_ref() != 0) {
			mav.addObject("currentPage", pv.getCurrentPage());
			mav.addObject("dto", cdto);
		}
		mav.setViewName("board_write");
		return mav;

	}// end board_writeMethod()
	
	@RequestMapping(value = "/board_write.do", method = RequestMethod.POST)
	public String board_writeProMethod(BoardDTO bdto, CommentDTO cdto, HttpServletRequest request) {

		
		// 답변글이면
		if (cdto.getComment_ref() != 0) {
			service.reStepProcess(cdto);
		} else {
			System.out.println(bdto.getBoard_no());
			System.out.println(bdto.getBoard_writer());
			System.out.println(bdto.getBoard_subject());
			System.out.println(bdto.getBoard_reg_date());
			service.insertProcess(bdto);
		}
		
		return "/board/board_list";
	}// end writeProMethod

	@RequestMapping(value = "/board_update.do", method = RequestMethod.GET)
	public ModelAndView board_updateMethod(int num, int currentPage) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", service.updateSelectProcess(num));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("board_update");
		return mav;

	}// end board_updateMethod()

	@RequestMapping(value = "/board_update.do", method = RequestMethod.POST)
	public ModelAndView board_updateProMethod(BoardDTO dto, int currentPage, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.updateProcess(dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("board_list");
		return mav;

	}// end board_updateProMethod()

	@RequestMapping("/board_delete.do")
	public ModelAndView board_deleteMethod(int num, int currentPage, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.deleteProcess(num);

		PageDTO pv = new PageDTO(service.countProcess());
		if (pv.getTotalPage() < currentPage)
			mav.addObject("currentPage", pv.getTotalPage());
		mav.setViewName("board_list");
		return mav;

	}// end deleteMethod()

	//[QA게시판]
	@RequestMapping("/qa_list.do")
	public ModelAndView qa_listMethod(PageDTO pv2){

		ModelAndView mav = new ModelAndView();

		int totalRecord = qa_service.countProcess();
		if (totalRecord >= 1) {
			if (pv2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv2.getCurrentPage();

			pdto = new PageDTO(currentPage, totalRecord);

			mav.addObject("pv2", pdto);
			mav.addObject("aList2", qa_service.listProcess(pdto));
		}
		mav.setViewName("qa_list");
		return mav;
	}// end qa_listMethod()
	
	@RequestMapping("/qa_view.do")
	public ModelAndView qa_viewMethod(int currentPage, int num) {
		ModelAndView mav = new ModelAndView();
		QA_BoardDTO dto = qa_service.contentProcess(num);
		mav.addObject("dto", dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("qa_view");
		return mav;
	}// end qa_viewMethod()

	@RequestMapping(value = "/qa_write.do", method = RequestMethod.GET)
	public ModelAndView qa_writeMethod(PageDTO pv2, CommentDTO dto) {
		ModelAndView mav = new ModelAndView();
		if (dto.getComment_ref() != 0) {
			mav.addObject("currentPage", pv2.getCurrentPage());
			mav.addObject("dto", dto);
		}
		mav.setViewName("qa_write");
		return mav;

	}// end qa_writeMethod()
	
	@RequestMapping(value = "/qa_write.do", method = RequestMethod.POST)
	public String qa_writeProMethod(QA_BoardDTO dto, HttpServletRequest request) {

		MultipartFile file = dto.getFilename();
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
			dto.setUpload(random + "_" + fileName);
		}
		
		// 답변글이면
		if (cdto.getComment_ref() != 0) {
			qa_service.reStepProcess(cdto);
		} else {
			qa_service.insertProcess(cdto);
		}
		
		return "/qa/qa_list";
	}// end writeProMethod

	@RequestMapping("/contentdownload.do")
	public ModelAndView downMethod(int num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("qa_no", num);
		mav.setViewName("download");
		return mav;
		
	}//end downMethod()


	@RequestMapping(value = "/qa_update.do", method = RequestMethod.GET)
	public ModelAndView qa_updateMethod(int num, int currentPage) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", service.updateSelectProcess(num));
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
	public ModelAndView qa_deleteMethod(int num, int currentPage, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		qa_service.deleteProcess(num, request);
		PageDTO pv2 = new PageDTO(qa_service.countProcess());
		if (pv2.getTotalPage() < currentPage){
			mav.addObject("currentPage", pv2.getTotalPage());
		}
			mav.setViewName("board_list");
			return mav;

	}// end qa_deleteMethod()		
}

