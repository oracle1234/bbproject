package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	
	public MainController() {
		
	}
	@RequestMapping("/main_list.do")
	public ModelAndView main_listMethod(){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("view/main/mainpage");
		return mav;
		
	}
	
	@RequestMapping("/main.do")
	public String main(){
		return "main";
	}
	
	
	
}
