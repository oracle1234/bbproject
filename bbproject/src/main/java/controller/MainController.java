package controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.BoardService;

@Controller
public class MainController {
	BoardService boardService;
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
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
		mav.setViewName("main");
		return mav;
	}
	

	
}
