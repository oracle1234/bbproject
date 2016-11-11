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
	
	@RequestMapping("/recipe.do")
	public String recipePage(){
		return "recipe";
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
	
}
