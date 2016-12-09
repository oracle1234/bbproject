package controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	// <게시판 리스트보기>
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

	// <게시판 글 상세보기(눌렀을 때)>
	@RequestMapping(value = "/board_view.do", method = RequestMethod.GET)
	public ModelAndView board_viewMethod(int currentPage, BoardDTO bdto, Comment_PageDTO cpdto2, String keyWord,
			HttpServletRequest req) {
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
		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");

		mav.addObject(mdto.getMember_no());
		mav.addObject("dto", dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("board_view");
		return mav;
	}// end board_viewMethod()

	// <게시판 글 상세보기(업데이트, 삭제 등 이후에)>
	@RequestMapping(value = "/board_view.do", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> board_viewProMethod(BoardDTO bdto, Comment_PageDTO cpdto2,
			HttpServletRequest req) {

		int totalRecord = service.commentCountProcess(bdto.getBoard_no());

		HashMap<String, Object> map = new HashMap<String, Object>();

		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");

		if (totalRecord >= 1) {
			if (cpdto2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = cpdto2.getCurrentPage();

			cpdto = new Comment_PageDTO(currentPage, totalRecord);
			map.put("startRow", cpdto.getStartRow());
			map.put("endRow", cpdto.getEndRow());
			map.put("board_no", bdto.getBoard_no());
			map.put("Member_no", mdto.getMember_no());
		}

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", service.commentPageProcess(map));
		resultMap.put("page", cpdto);
		return resultMap;
	}// end board_viewProMethod();

	// <검색>
	@RequestMapping(value = "/board_search.do", method = RequestMethod.GET)
	public ModelAndView board_searchMethod(String keyField, String keyWord, BoardDTO bdto, PageDTO pv) {
		ModelAndView mav = new ModelAndView();

		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("keyfield", keyField);
		searchMap.put("keyword", keyWord);

		List<BoardDTO> list = service.searchListProcess(searchMap);

		mav.addObject("aList", list);

		HashMap<String, Object> pageMap = new HashMap<String, Object>();

		int totalRecord = list.size();
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();

			pdto = new PageDTO(currentPage, totalRecord);

			pageMap.put("startRow", pdto.getStartRow());
			pageMap.put("endRow", pdto.getEndRow());
		} else {
			pdto = new PageDTO();
		}

		mav.addObject("keyField", keyField);
		mav.addObject("keyWord", keyWord);
		mav.addObject("pv", pdto);
		mav.setViewName("board_list");
		return mav;

	}// end board_searchMethod()

	// <게시글 쓰기(눌렀을 때)>
	@RequestMapping(value = "/board_write.do", method = RequestMethod.GET)
	public ModelAndView board_writeMethod(PageDTO pv, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");
		mav.addObject(mdto.getMember_no());
		mav.setViewName("board_write");
		return mav;
	}// end board_writeMethod()

	// <게시글 쓰기(쓰기)>
	@RequestMapping(value = "/board_write.do", method = RequestMethod.POST)
	public String board_writeProMethod(BoardDTO bdto, HttpServletRequest req) {
		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");
		bdto.setMember_no(mdto.getMember_no());
		service.insertProcess(bdto);
		return "redirect:/board_list.do";
	}// end writeProMethod

	// <게시글 수정(눌렀을 때)>
	@RequestMapping(value = "/board_update.do", method = RequestMethod.GET)
	public ModelAndView board_updateMethod(BoardDTO bdto, int currentPage) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", service.updateSelectProcess(bdto.getBoard_no()));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("board_update");
		return mav;
	}// end board_updateMethod()

	// <게시글 수정(수정 후)>
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

	// <게시글 삭제>
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

	// <댓글쓰기>
	@RequestMapping("/commentInsert.do")
	public @ResponseBody HashMap<String, Object> commentInsertProcess(BoardDTO bdto, CommentDTO cdto,
			Comment_PageDTO cpdto2, HttpServletRequest req) {

		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");
		cdto.setMember_no(mdto.getMember_no());

		HashMap<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("comment_content", cdto.getComment_content());
		insertMap.put("board_no", bdto.getBoard_no());
		insertMap.put("member_no", cdto.getMember_no());
		insertMap.put("comment_writer", cdto.getComment_writer());

		// System.out.println(cpdto2.getCurrentPage());

		service.commentInsertProcess(insertMap);

		int totalRecord = service.commentCountProcess(bdto.getBoard_no());

		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		if (totalRecord >= 1) {
			if (cpdto2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = cpdto2.getCurrentPage();

			cpdto = new Comment_PageDTO(currentPage, totalRecord);
			pageMap.put("startRow", cpdto.getStartRow());
			pageMap.put("endRow", cpdto.getEndRow());
			pageMap.put("board_no", bdto.getBoard_no());
			resultMap.put("page", cpdto);
			resultMap.put("list", service.commentPageProcess(pageMap));
		}
		return resultMap;
	}// end commentInsertProcess()

	// <댓글삭제>
	@RequestMapping("/commentDelete.do")
	public @ResponseBody HashMap<String, Object> commentDeleteProcess(BoardDTO bdto, CommentDTO cdto,
			Comment_PageDTO cpdto2, HttpServletRequest req) {

		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");
		cdto.setMember_no(mdto.getMember_no());

		HashMap<String, Object> deleteMap = new HashMap<String, Object>();
		deleteMap.put("comment_no", cdto.getComment_no());
		deleteMap.put("board_no", bdto.getBoard_no());
		deleteMap.put("member_no", cdto.getMember_no());

		service.commentDeleteProcess(deleteMap);

		int totalRecord = service.commentCountProcess(bdto.getBoard_no());
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if (totalRecord >= 1) {
			if (cpdto2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = cpdto2.getCurrentPage();

			cpdto = new Comment_PageDTO(currentPage, totalRecord);
			pageMap.put("startRow", cpdto.getStartRow());
			pageMap.put("endRow", cpdto.getEndRow());
			pageMap.put("board_no", bdto.getBoard_no());
			resultMap.put("list", service.commentPageProcess(pageMap));
			resultMap.put("page", cpdto);
		}
		return resultMap;
	}// end commentDeleteProcess()

	// <댓글수정 눌렀을 때>
	@RequestMapping(value = "/commentUpdate.do", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> commentUpdateProcess(BoardDTO bdto, CommentDTO cdto, MemberDTO mdto,
			Comment_PageDTO cpdto2) {

		HashMap<String, Object> updateMap = new HashMap<String, Object>();
		updateMap.put("comment_content", cdto.getComment_content());
		updateMap.put("comment_no", cdto.getComment_no());
		updateMap.put("member_no", mdto.getMember_no());

		service.commentUpdateProcess(updateMap);

		int totalRecord = service.commentCountProcess(bdto.getBoard_no());

		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if (totalRecord >= 1) {
			if (cpdto2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = cpdto2.getCurrentPage();

			cpdto = new Comment_PageDTO(currentPage, totalRecord);

			pageMap.put("startRow", cpdto.getStartRow());
			pageMap.put("endRow", cpdto.getEndRow());
			pageMap.put("board_no", bdto.getBoard_no());
			resultMap.put("list", service.commentPageProcess(pageMap));
			resultMap.put("page", cpdto);
		}

		return resultMap;
	}// end commentUpdateProcess()

	// <댓글수정 된 후>
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
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if (totalRecord >= 1) {
			if (cpdto2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = cpdto2.getCurrentPage();

			cpdto = new Comment_PageDTO(currentPage, totalRecord);

			pageMap.put("startRow", cpdto.getStartRow());
			pageMap.put("endRow", cpdto.getEndRow());
			pageMap.put("board_no", bdto.getBoard_no());
			resultMap.put("list", service.commentPageProcess(pageMap));
			resultMap.put("page", cpdto);
		}
		return resultMap;
	}// end commentUpdateProProcess()

	// [QA게시판]
	@RequestMapping("/qa_list.do")
	public ModelAndView qa_listMethod(QA_BoardDTO qdto, PageDTO pv) {

		ModelAndView mav = new ModelAndView();

		int totalRecord = qa_service.countProcess(qdto.getBoardcategory_no());
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
			mav.addObject("aList", qa_service.pageListProcess(map));
		}
		mav.setViewName("qa_list");
		return mav;
	}// end board_listMethod()

	@RequestMapping(value = "/qa_view.do", method = RequestMethod.GET)
	public ModelAndView qa_viewMethod(int currentPage, QA_BoardDTO qdto, Comment_PageDTO cpdto2,
			HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();

		int totalRecord = qa_service.commentCountProcess(qdto.getQa_no());
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
			map.put("qa_no", qdto.getQa_no());
			mav.addObject("aList", qa_service.commentPageProcess(map));
		}

		QA_BoardDTO dto = qa_service.contentProcess(qdto.getQa_no());
		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");
		mav.addObject(mdto.getMember_no());
		mav.addObject("dto", dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("qa_view");
		return mav;
	}// end qa_viewMethod()

	@RequestMapping(value = "/qa_view.do", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> qa_viewProMethod(QA_BoardDTO qdto, Comment_PageDTO cpdto2,
			HttpServletRequest req) {
		int totalRecord = qa_service.commentCountProcess(qdto.getQa_no());

		HashMap<String, Object> map = new HashMap<String, Object>();

		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");

		if (totalRecord >= 1) {
			if (cpdto2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = cpdto2.getCurrentPage();

			cpdto = new Comment_PageDTO(currentPage, totalRecord);
			map.put("startRow", cpdto.getStartRow());
			map.put("endRow", cpdto.getEndRow());
			map.put("qa_no", qdto.getQa_no());
			map.put("Member_no", mdto.getMember_no());
		}

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", qa_service.commentPageProcess(map));
		resultMap.put("page", cpdto);
		return resultMap;
	}// end board_viewProMethod();

	// <검색>
	@RequestMapping(value = "/qa_search.do", method = RequestMethod.GET)
	public ModelAndView qa_searchMethod(String keyField, String keyWord, QA_BoardDTO qdto, PageDTO pv) {
		ModelAndView mav = new ModelAndView();

		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("keyfield", keyField);
		searchMap.put("keyword", keyWord);

		List<QA_BoardDTO> list = qa_service.searchListProcess(searchMap);

		mav.addObject("aList", list);

		HashMap<String, Object> pageMap = new HashMap<String, Object>();

		// int totalRecord = service.countProcess(bdto.getBoardcategory_no());
		int totalRecord = list.size();
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();

			pdto = new PageDTO(currentPage, totalRecord);

			pageMap.put("startRow", pdto.getStartRow());
			pageMap.put("endRow", pdto.getEndRow());
		} else {
			pdto = new PageDTO();
		}

		// mav.addObject("list", service.pageListProcess(pageMap));
		mav.addObject("keyField", keyField);
		mav.addObject("keyWord", keyWord);
		mav.addObject("pv", pdto);
		mav.setViewName("qa_list");
		return mav;

	}// end board_searchMethod()

	@RequestMapping("/qa_commentInsert.do")
	public @ResponseBody HashMap<String, Object> qa_commentInsertProcess(QA_BoardDTO qdto, CommentDTO cdto,
			Comment_PageDTO cpdto2, HttpServletRequest req) {

		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");
		cdto.setMember_no(mdto.getMember_no());

		HashMap<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("comment_content", cdto.getComment_content());
		insertMap.put("qa_no", qdto.getQa_no());
		insertMap.put("member_no", mdto.getMember_no());
		insertMap.put("comment_writer", cdto.getComment_writer());

		qa_service.commentInsertProcess(insertMap);

		int totalRecord = qa_service.commentCountProcess(qdto.getQa_no());
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		if (totalRecord >= 1) {
			if (cpdto2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = cpdto2.getCurrentPage();

			cpdto = new Comment_PageDTO(currentPage, totalRecord);

			pageMap.put("startRow", cpdto.getStartRow());
			pageMap.put("endRow", cpdto.getEndRow());
			pageMap.put("qa_no", qdto.getQa_no());
		}
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", qa_service.commentPageProcess(pageMap));
		resultMap.put("page", cpdto);
		return resultMap;
	}// end qa_commentInsertProcess()

	@RequestMapping("/qa_commentDelete.do")
	public @ResponseBody HashMap<String, Object> qa_commentDeleteProcess(QA_BoardDTO qdto, CommentDTO cdto,
			MemberDTO mdto, Comment_PageDTO cpdto2) {

		HashMap<String, Object> deleteMap = new HashMap<String, Object>();
		deleteMap.put("comment_no", cdto.getComment_no());
		deleteMap.put("qa_no", qdto.getQa_no());
		deleteMap.put("member_no", mdto.getMember_no());
		
		qa_service.commentDeleteProcess(deleteMap);

		int totalRecord = qa_service.commentCountProcess(qdto.getQa_no());

		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if (totalRecord >= 1) {
			if (cpdto2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = cpdto2.getCurrentPage();

			cpdto = new Comment_PageDTO(currentPage, totalRecord);

			pageMap.put("startRow", cpdto.getStartRow());
			pageMap.put("endRow", cpdto.getEndRow());
			pageMap.put("qa_no", qdto.getQa_no());
			resultMap.put("list", qa_service.commentPageProcess(pageMap));
			resultMap.put("page", cpdto);
		}

		return resultMap;
	}// end qa_commentDeleteProcess()

	@RequestMapping(value = "/qa_commentUpdate.do", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> qa_commentUpdateProcess(QA_BoardDTO qdto, CommentDTO cdto,
			MemberDTO mdto, Comment_PageDTO cpdto2) {

		HashMap<String, Object> updateMap = new HashMap<String, Object>();
		updateMap.put("comment_content", cdto.getComment_content());
		updateMap.put("comment_no", cdto.getComment_no());
		updateMap.put("member_no", mdto.getMember_no());

		qa_service.commentUpdateProcess(updateMap);

		int totalRecord = qa_service.commentCountProcess(qdto.getQa_no());

		HashMap<String, Object> pageMap = new HashMap<String, Object>();

		if (totalRecord >= 1) {
			if (cpdto2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = cpdto2.getCurrentPage();

			cpdto = new Comment_PageDTO(currentPage, totalRecord);

			pageMap.put("startRow", cpdto.getStartRow());
			pageMap.put("endRow", cpdto.getEndRow());
			pageMap.put("qa_no", qdto.getQa_no());
		}
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", qa_service.commentPageProcess(pageMap));
		resultMap.put("page", cpdto);

		return resultMap;
	}// end commentUpdateProcess()

	@RequestMapping(value = "/qa_commentUpdate.do", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> qa_commentUpdateProProcess(QA_BoardDTO qdto, CommentDTO cdto,
			MemberDTO mdto, Comment_PageDTO cpdto2) {

		HashMap<String, Object> updateMap = new HashMap<String, Object>();
		updateMap.put("comment_content", cdto.getComment_content());
		updateMap.put("comment_no", cdto.getComment_no());
		updateMap.put("member_no", mdto.getMember_no());

		qa_service.commentUpdateProcess(updateMap);

		int totalRecord = qa_service.commentCountProcess(qdto.getQa_no());

		HashMap<String, Object> pageMap = new HashMap<String, Object>();

		if (totalRecord >= 1) {
			if (cpdto2.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = cpdto2.getCurrentPage();

			cpdto = new Comment_PageDTO(currentPage, totalRecord);

			pageMap.put("startRow", cpdto.getStartRow());
			pageMap.put("endRow", cpdto.getEndRow());
			pageMap.put("qa_no", qdto.getQa_no());
		}
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", qa_service.commentPageProcess(pageMap));
		resultMap.put("page", cpdto);

		return resultMap;
	}// end commentUpdateProProcess()

	@RequestMapping(value = "/qa_write.do", method = RequestMethod.GET)
	public ModelAndView qa_writeMethod(PageDTO pv, HttpServletRequest req) {
		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject(mdto.getMember_no());
		mav.setViewName("qa_write");
		return mav;

	}// end qa_writeMethod()

	@RequestMapping(value = "/qa_write.do", method = RequestMethod.POST)
	public String qa_writeProMethod(QA_BoardDTO qdto, HttpServletRequest req) {

		MultipartFile file = qdto.getFilename();
		if (!file.isEmpty()) {
			String fileName = file.getOriginalFilename();

			// 중복파일명을 처리하기 위해 난수 발생
			UUID random = UUID.randomUUID();
			String root = req.getSession().getServletContext().getRealPath("/");
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

		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");
		qdto.setMember_no(mdto.getMember_no());
		qa_service.insertProcess(qdto);

		return "redirect:/qa_list.do";
	}// end qa_writeProMethod

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
		PageDTO pv = new PageDTO(qa_service.countProcess(qdto.getBoardcategory_no()));
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
	public ModelAndView photo_listMethod(Photo_BoardDTO idto, PageDTO pv) {

		ModelAndView mav = new ModelAndView();

		int totalRecord = photo_service.countProcess(idto.getBoardcategory_no());
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
			mav.addObject("aList", photo_service.pageListProcess(map));
		}
		mav.setViewName("photo_list");
		return mav;
	}// end board_listMethod()

	@RequestMapping(value = "/photo_image.do", method = RequestMethod.GET)
	public void showImage(String filename, HttpServletResponse res, HttpServletRequest req)
			throws IOException, ServletException {

		String filepath = req.getSession().getServletContext().getRealPath(File.separator) + "/temp/" + filename;

		byte[] a = readFile(filepath);

		res.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		res.getOutputStream().write(a);
		res.getOutputStream().close();
	}

	private byte[] readFile(String filename) throws IOException {
		String path = filename;

		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(path));
		int length = bis.available();
		byte[] bytes = new byte[length];
		bis.read(bytes);
		bis.close();

		return bytes;
	}

	@RequestMapping(value = "/photo_write.do", method = RequestMethod.GET)
	public ModelAndView photo_writeMethod(PageDTO pv, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");
		mav.addObject(mdto.getMember_no());
		mav.setViewName("photo_write");
		return mav;

	}// end qa_writeMethod()

	@RequestMapping(value = "/photo_write.do", method = RequestMethod.POST)
	public String photo_writeProMethod(Photo_BoardDTO idto, HttpServletRequest req) {

		MultipartFile file = idto.getFilename();
		if (!file.isEmpty()) {
			String fileName = file.getOriginalFilename();

			// 중복파일명을 처리하기 위해 난수 발생
			UUID random = UUID.randomUUID();
			String root = req.getSession().getServletContext().getRealPath("/");
			// root+"temp/"
			String saveDirectory = root + "temp" + File.separator;
			File fe = new File(saveDirectory);
			if (!fe.exists())
				fe.mkdir();
			File ff = new File(saveDirectory, random + "_" + fileName);
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (FileNotFoundException e) {

				e.printStackTrace();
			} catch (IOException e) {

				e.printStackTrace();
			}
			idto.setPhoto_upload(random + "_" + fileName);
		}
		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");
		idto.setMember_no(mdto.getMember_no());
		photo_service.insertProcess(idto);
		return "redirect:/photo_list.do";
	}// end qa_writeProMethod
}