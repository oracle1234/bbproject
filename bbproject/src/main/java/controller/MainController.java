package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dto.BoardDTO;
import dto.CommentDTO;
import dto.PageDTO;
import service.BoardService;

@Controller
public class MainController {
	private BoardService service;
	private int currentPage;
	private PageDTO pdto;

	public MainController() {

	}

	public void setService(BoardService service) {
		this.service = service;
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
	public ModelAndView board_writeMethod(PageDTO pv, CommentDTO dto) {
		ModelAndView mav = new ModelAndView();
		if (dto.getComment_ref() != 0) {
			mav.addObject("currentPage", pv.getCurrentPage());
			mav.addObject("dto", dto);
		}
		mav.setViewName("board_write");
		return mav;

	}// end board_writeMethod()

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
		service.updateProcess(dto, request);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("board_list");
		return mav;

	}// end board_updateProMethod()

	@RequestMapping("/board_delete.do")
	public ModelAndView board_deleteMethod(int num, int currentPage, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.deleteProcess(num, request);

		PageDTO pv = new PageDTO(service.countProcess());
		if (pv.getTotalPage() < currentPage)
			mav.addObject("currentPage", pv.getTotalPage());
		mav.setViewName("board_list");
		return mav;

	}// end deleteMethod()

	//[QA게시판]
	@RequestMapping("/qa_list.do")
	public ModelAndView qa_listMethod(PageDTO pv){

		ModelAndView mav = new ModelAndView();

		int totalRecord = service.countProcess();
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();

			pdto = new PageDTO(currentPage, totalRecord);

			mav.addObject("pv2", pdto);
			mav.addObject("aList2", service.listProcess(pdto));
		}
		mav.setViewName("qa_list");
		return mav;
	}// end board_listMethod()
	
	@RequestMapping("/qa_view.do")
	public ModelAndView qa_viewMethod(int currentPage, int num) {
		ModelAndView mav = new ModelAndView();
		BoardDTO dto = service.contentProcess(num);
		mav.addObject("dto", dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("qa_view");
		return mav;
	}// end board_viewMethod()

	@RequestMapping(value = "/qa_write.do", method = RequestMethod.GET)
	public ModelAndView qa_writeMethod(PageDTO pv, CommentDTO dto) {
		ModelAndView mav = new ModelAndView();
		if (dto.getComment_ref() != 0) {
			mav.addObject("currentPage", pv.getCurrentPage());
			mav.addObject("dto", dto);
		}
		mav.setViewName("qa_write");
		return mav;

	}// end board_writeMethod()

	@RequestMapping(value = "/qa_update.do", method = RequestMethod.GET)
	public ModelAndView qa_updateMethod(int num, int currentPage) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", service.updateSelectProcess(num));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("qa_update");
		return mav;

	}// end board_updateMethod()

	@RequestMapping(value = "/qa_update.do", method = RequestMethod.POST)
	public ModelAndView qa_updateProMethod(BoardDTO dto, int currentPage, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.updateProcess(dto, request);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("qa_list");
		return mav;

	}// end board_updateProMethod()

	@RequestMapping("/qa_delete.do")
	public ModelAndView qa_deleteMethod(int num, int currentPage, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.deleteProcess(num, request);

		PageDTO pv = new PageDTO(service.countProcess());
		if (pv.getTotalPage() < currentPage)
			mav.addObject("currentPage", pv.getTotalPage());
		mav.setViewName("board_list");
		return mav;

	}// end deleteMethod()

		
	}

