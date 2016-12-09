package controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.PageDTO;
import service.BoardService;
import service.Photo_BoardService;

@Controller
public class MainController {
	BoardService boardService;
	private Photo_BoardService photo_service;
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	public void setPhoto_service(Photo_BoardService photo_service) {
		this.photo_service = photo_service;
	}

	public MainController() {
		
	}
	
	@RequestMapping("/main.do")
	public ModelAndView main(){
		ModelAndView mav = new ModelAndView();
		
		int totalRecord = boardService.countProcess(1);
		if (totalRecord >= 1) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", 1);
			map.put("endRow", 5);
			mav.addObject("boardList", boardService.pageListProcess(map));
		}
		
		
		int photototalRecord = photo_service.countProcess(1);
		if (photototalRecord >= 1) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", 1);
			map.put("endRow", 14);
			mav.addObject("photoList", photo_service.pageListProcess(map));
		}
		
		mav.setViewName("main");
		return mav;
	}
	

	
}
