package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.fb_BoardDTO;
import dto.fb_CommentDTO;
import dto.fb_PageDTO;
import service.fb_BoardService;


@Controller
public class MainController {
	private fb_BoardService service;
	private int currentPage;
	private fb_PageDTO pdto;

	public MainController() {

	}

	public void setService(fb_BoardService service) {
		this.service = service;
	}

	@RequestMapping("/index.do")
	public String process() {
		return "index";
	}

	@RequestMapping("/board_list.do")
	public ModelAndView board_listMethod(fb_PageDTO pv) {

		ModelAndView mav = new ModelAndView();

		int totalRecord = service.countProcess();
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = pv.getCurrentPage();

			pdto = new fb_PageDTO(currentPage, totalRecord);

			mav.addObject("pv", pdto);
			mav.addObject("aList", service.listProcess(pdto));
		}
		mav.setViewName("view/board/board_list");
		return mav;
	}// end board_listMethod()

	@RequestMapping("/board_view.do")
	public ModelAndView board_viewMethod(int currentPage, int num) {
		ModelAndView mav = new ModelAndView();
		fb_BoardDTO dto = service.contentProcess(num);
		mav.addObject("dto", dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("view/board/board_view");

		return mav;
	}// end board_viewMethod()

	@RequestMapping(value = "/board_write.do", method = RequestMethod.GET)
	public ModelAndView board_writeMethod(fb_PageDTO pv, fb_CommentDTO dto) {
		ModelAndView mav = new ModelAndView();
		if (dto.getComment_ref() != 0) {
			mav.addObject("currentPage", pv.getCurrentPage());
			mav.addObject("dto", dto);
		}
		mav.setViewName("view/board/board_write");
		return mav;

	}// end board_writeMethod()

	@RequestMapping(value = "/board_write.do", method = RequestMethod.POST)
	public String board_writeProMethod(fb_BoardDTO bdto, fb_CommentDTO cdto, HttpServletRequest request) {

		MultipartFile file = bdto.getFilename();
		if (!file.isEmpty()) {
			String fileName = file.getOriginalFilename();

			// 중복파일 피해야 하니 난수 발생
			UUID random = UUID.randomUUID();
			String root = request.getSession().getServletContext().getRealPath("/");
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
			bdto.setUpload(random + "_" + fileName);
		}
		bdto.setBoard_ip(request.getRemoteAddr());

		// 답변글이면
		if (cdto.getComment_ref() != 0) {
			service.reStepProcess(cdto);
		} else {
			service.insertProcess(cdto);
		}
		return "redirect:/board_list.do";

	}

	@RequestMapping("/contentdownload.do")
	public ModelAndView downMethod(int num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("num", num);
		mav.setViewName("download");
		return mav;
	}// end downMethod()

	@RequestMapping(value = "/board_update.do", method = RequestMethod.GET)
	public ModelAndView board_updateMethod(int num, int currentPage) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", service.updateSelectProcess(num));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("view/board/update");
		return mav;

	}// end board_updateMethod()

	@RequestMapping(value = "/board_update.do", method = RequestMethod.POST)
	public ModelAndView board_updateProMethod(fb_BoardDTO dto, int currentPage, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.updateProcess(dto, request);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/board_list.do");

		return mav;

	}

	@RequestMapping("/board_delete.do")
	public ModelAndView board_deleteMethod(int num, int currentPage, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.deleteProcess(num, request);

		fb_PageDTO pv = new fb_PageDTO(service.countProcess());
		if (pv.getTotalPage() < currentPage)
			mav.addObject("currentPage", pv.getTotalPage());
		mav.setViewName("redirect:/board_list.do");
		return mav;

	}//end deleteMethod()

	@RequestMapping("/mypage.do")
	public String mypage() {
		return "mypage";
	}

	@RequestMapping("/my_order.do")
	public String myorder(){
		return "my_order";
	}
	
	@RequestMapping("/my_cart.do")
	public String mycart(){
		return "my_cart";
	}
	
	@RequestMapping("/my_coupon.do")
	public String mycoupon(){
		return "my_coupon";
	}
	
	@RequestMapping("/my_board.do")
	public String myboard(){
		return "my_board";
	}

	@RequestMapping("/recipe.do")
	public String recipePage(){
		return "recipe";
	}

}
