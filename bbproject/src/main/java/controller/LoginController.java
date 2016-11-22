package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	
	
	public LoginController() {
	
	}

	@RequestMapping("/login.do")
	public ModelAndView loginForm(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("view/login");
		return mav;
	}
	
	@RequestMapping(value="/loginpro.do", method = RequestMethod.POST)
	public ModelAndView loginPro(String id, String pass){
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("admin");
		
		mav.setViewName("mypage");
		return mav;
	}

}
