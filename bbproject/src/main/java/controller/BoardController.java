package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.BoardDTO;
import dto.QA_BoardDTO;
import dto.Photo_BoardDTO;
import dto.CommentDTO;
import dto.Comment_PageDTO;
import dto.MemberDTO;
import dto.PageDTO;
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
	private Comment_PageDTO cpdto;
	//private CommentDTO cdto;

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
	public ModelAndView board_listMethod(BoardDTO bdto, PageDTO pv) {

		ModelAndView mav = new ModelAndView();

		int totalRecord = service.countProcess(bdto.getBoardcategory_no());
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();

			pdto = new PageDTO(currentPage, totalRecord);
			mav.addObject("pv", pdto);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", pdto.getStartRow());
			map.put("endRow", pdto.getEndRow());
			mav.addObject("aList", service.pageListProcess(map));
		}
		mav.setViewName("board_list");
		return mav;
	}// end board_listMethod()

	@RequestMapping(value = "/board_view.do", method = RequestMethod.GET)
	public ModelAndView board_viewMethod(int currentPage, BoardDTO bdto, Comment_PageDTO cpdto2) {
		ModelAndView mav = new ModelAndView();

		int totalRecord = service.commentCountProcess(bdto.getBoard_no());

		if (totalRecord >= 1) {
			if (cpdto2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = cpdto2.getCurrentPage();

			cpdto = new Comment_PageDTO(currentPage, totalRecord);
			mav.addObject("pv", cpdto);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", cpdto.getStartRow());
			map.put("endRow", cpdto.getEndRow());
			map.put("board_no", bdto.getBoard_no());
			mav.addObject("aList", service.commentPageProcess(map));
		}

		BoardDTO dto = service.contentProcess(bdto.getBoard_no());
		mav.addObject("dto", dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("board_view");
		return mav;
	}// end board_viewMethod()

	@RequestMapping(value = "/board_view.do", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> board_viewProMethod(BoardDTO bdto, Comment_PageDTO cpdto2) {
		int totalRecord = service.commentCountProcess(bdto.getBoard_no());
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (totalRecord >= 1) {
			if (cpdto2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = cpdto2.getCurrentPage();

			cpdto = new Comment_PageDTO(currentPage, totalRecord);
			map.put("startRow", cpdto.getStartRow());
			map.put("endRow", cpdto.getEndRow());
			map.put("board_no", bdto.getBoard_no());
		}

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", service.commentPageProcess(map));
		resultMap.put("page", cpdto);
		return resultMap;
	}// end board_viewProMethod();

	@RequestMapping("/commentInsert.do")
	public @ResponseBody HashMap<String, Object> commentInsertProcess(BoardDTO bdto, CommentDTO cdto, MemberDTO mdto,
			Comment_PageDTO cpdto2) {

		HashMap<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("comment_content", cdto.getComment_content());
		insertMap.put("board_no", bdto.getBoard_no());
		insertMap.put("member_no", mdto.getMember_no());
		insertMap.put("comment_writer", "백나연");

		service.commentInsertProcess(insertMap);

		int totalRecord = service.commentCountProcess(bdto.getBoard_no());

		HashMap<String, Object> pageMap = new HashMap<String, Object>();

		if (totalRecord >= 1) {
			if (cpdto2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = cpdto2.getCurrentPage();

			cpdto = new Comment_PageDTO(currentPage, totalRecord);

			pageMap.put("startRow", cpdto.getStartRow());
			pageMap.put("endRow", cpdto.getEndRow());
			pageMap.put("board_no", bdto.getBoard_no());
		}
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", service.commentPageProcess(pageMap));
		resultMap.put("page", cpdto);

		return resultMap;
	}// end commentInsertProcess()

	@RequestMapping("/commentDelete.do")
	public @ResponseBody HashMap<String, Object> commentDeleteProcess(BoardDTO bdto, CommentDTO cdto, MemberDTO mdto,
			Comment_PageDTO cpdto2) {

		HashMap<String, Object> deleteMap = new HashMap<String, Object>();
		deleteMap.put("comment_no", cdto.getComment_no());
		deleteMap.put("member_no", mdto.getMember_no());

		service.commentDeleteProcess(deleteMap);

		int totalRecord = service.commentCountProcess(bdto.getBoard_no());
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		
		if (totalRecord >= 1) {
			if (cpdto2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = cpdto2.getCurrentPage();

			cpdto = new Comment_PageDTO(currentPage, totalRecord);

			pageMap.put("startRow", cpdto.getStartRow());
			pageMap.put("endRow", cpdto.getEndRow());
			pageMap.put("board_no", bdto.getBoard_no());
		}
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", service.commentPageProcess(pageMap));
		resultMap.put("page", cpdto);

		return resultMap;
	}// end commentDeleteProcess()

	@RequestMapping(value = "/commentUpdate.do", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> commentUpdateProcess(BoardDTO bdto, CommentDTO cdto, MemberDTO mdto,
			Comment_PageDTO cpdto2) {

		HashMap<String, Object> updateMap = new HashMap<String, Object>();
		updateMap.put("comment_content", cdto.getComment_content());
		updateMap.put("comment_no", cdto.getComment_no());
		updateMap.put("member_no", mdto.getMember_no());
		System.out.println(cdto.getComment_content());
		System.out.println(cdto.getComment_no());
		System.out.println(mdto.getMember_no());

		service.commentUpdateProcess(updateMap);

		int totalRecord = service.commentCountProcess(bdto.getBoard_no());

		HashMap<String, Object> pageMap = new HashMap<String, Object>();

		if (totalRecord >= 1) {
			if (cpdto2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = cpdto2.getCurrentPage();

			cpdto = new Comment_PageDTO(currentPage, totalRecord);

			pageMap.put("startRow", cpdto.getStartRow());
			pageMap.put("endRow", cpdto.getEndRow());
			pageMap.put("board_no", bdto.getBoard_no());
		}
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", service.commentPageProcess(pageMap));
		resultMap.put("page", cpdto);

		return resultMap;
	}// end commentUpdateProcess()

	@RequestMapping(value = "/commentUpdate.do", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> commentUpdateProProcess(BoardDTO bdto, CommentDTO cdto, MemberDTO mdto,
			Comment_PageDTO cpdto2) {

		HashMap<String, Object> updateMap = new HashMap<String, Object>();
		updateMap.put("comment_content", cdto.getComment_content());
		updateMap.put("comment_no", cdto.getComment_no());
		updateMap.put("member_no", mdto.getMember_no());
		

		service.commentUpdateProcess(updateMap);

		int totalRecord = service.commentCountProcess(bdto.getBoard_no());

		HashMap<String, Object> pageMap = new HashMap<String, Object>();

		if (totalRecord >= 1) {
			if (cpdto2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = cpdto2.getCurrentPage();

			cpdto = new Comment_PageDTO(currentPage, totalRecord);

			pageMap.put("startRow", cpdto.getStartRow());
			pageMap.put("endRow", cpdto.getEndRow());
			pageMap.put("board_no", bdto.getBoard_no());
		}
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", service.commentPageProcess(pageMap));
		resultMap.put("page", cpdto);

		return resultMap;
	}// end commentUpdateProProcess()

	@RequestMapping(value = "/board_write.do", method = RequestMethod.GET)
	public ModelAndView board_writeMethod(PageDTO pv, CommentDTO cdto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board_write");
		return mav;
	}// end board_writeMethod()

	@RequestMapping(value = "/board_write.do", method = RequestMethod.POST)
	public String board_writeProMethod(BoardDTO bdto, CommentDTO cdto) {
		service.insertProcess(bdto);
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
		PageDTO pv = new PageDTO(service.countProcess(bdto.getBoardcategory_no()));
		if (pv.getTotalPage() < currentPage) {
			mav.addObject("currentPage", pv.getTotalPage());
		} else {
			mav.addObject("currentPage", currentPage);
		}
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
		qa_service.insertProcess(qdto);
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
		mav.addObject("dto", qa_service.updateSelectProcess(qdto.getQa_no()));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("qa_update");
		return mav;

	}// end qa_updateMethod()

	@RequestMapping(value = "/qa_update.do", method = RequestMethod.POST)
	public ModelAndView qa_updateProMethod(QA_BoardDTO dto, int currentPage, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		qa_service.updateProcess(dto, request);
		mav.addObject("pv", pdto);
		mav.addObject("aList", qa_service.listProcess(pdto));
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
		} else {
			mav.addObject("currentPage", currentPage);
		}
		mav.addObject("pv", pdto);
		mav.addObject("aList", qa_service.listProcess(pdto));
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
			// mav.addObject("aList", service.listProcess(pdto));
		}

		mav.setViewName("photo_list");
		return mav;
	}

	/*
	 * @RequestMapping("/photo_view.do") public ModelAndView
	 * photo_viewMethod(int currentPage, Photo_BoardDTO pdto) { ModelAndView mav
	 * = new ModelAndView(); Photo_BoardDTO dto =
	 * photo_service.contentProcess(pdto.getPhoto_no()); mav.addObject("dto",
	 * pdto); mav.addObject("currentPage", currentPage);
	 * mav.setViewName("photo_view"); return mav; }
	 */

	@RequestMapping(value = "/photo_write.do", method = RequestMethod.GET)
	public ModelAndView photo_writeMethod(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("photo_write");
		return mav;

	}

}