package controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import dto.BoardDTO;
import dto.PageDTO;
import dto.main_BoardDTO;
import service.BoardService;



@Controller
public class MainController {
	
	BoardService boardService;
	
	int currentPage;
	private PageDTO pdto;
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	public MainController() {
		
	}
	@RequestMapping(value = "/main_list.do", method = RequestMethod.GET)
	public ModelAndView main_listMethod(main_BoardDTO mbdto){
		ModelAndView mav = new ModelAndView();
		
		int totalRecord = boardService.countProcess(1);
		System.out.println("갯수"+totalRecord);
		if (totalRecord >= 1) {
			System.out.println("오냐");
			if (mbdto.getCurrentPage() == 0){
				currentPage = 1;
			System.out.println("오냐1");
			}
			else{
				currentPage = mbdto.getCurrentPage();

			System.out.println("오냐2");
			}
			pdto = main_BoardDTO(currentPage, totalRecord);
			System.out.println("오냐3");
			mav.addObject("pv", pdto);
			System.out.println("오냐4");
			System.out.println("start=="+pdto.getStartRow());
			System.out.println("endRow=="+pdto.getEndRow());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", pdto.getStartRow());
			map.put("endRow", pdto.getEndRow());
			System.out.println("오냐5");
			mav.addObject("list", boardService.pageListProcess(map));
			System.out.println("오냐6");
		}
		
		mav.setViewName("main");
		return mav;
		
	}
	
	private PageDTO main_BoardDTO(int currentPage2, int totalRecord) {
		// TODO Auto-generated method stub
		return null;
	}
	@RequestMapping("/main.do")
	public String main(){
		return "main";
	}
	
	
	
}
