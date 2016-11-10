package controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import service.Service;


@Controller
public class MainController {
	Service service;
	
	public MainController() {

	}

	public void setService(Service service) {
		this.service = service;
	}
	

	@RequestMapping("/index.do")
	public String process(){
		return "index";
	}
	
	@RequestMapping("/mypage.do")
	public String mypage(){
		return "mypage";
	}
	
}
