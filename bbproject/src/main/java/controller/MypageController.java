package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dto.fb_BoardDTO;
import dto.fb_CommentDTO;
import dto.fb_PageDTO;
import service.fb_BasketService;
import service.fb_BoardService;

@Controller
public class MypageController {

	private fb_BasketService service;

	public MypageController() {

	}

	public void setService(fb_BasketService service) {
		this.service = service;
	}

	@RequestMapping("/mypage.do")
	public String mypage() {
		return "mypage";
	}

	@RequestMapping("/my_order.do")
	public String myorder() {
		return "my_order";
	}

	@RequestMapping("/my_cart.do")
	public ModelAndView listMethod(int member_no) {
		// num=1;
		System.out.println("test" + member_no);

		ModelAndView mav = new ModelAndView();
		mav.addObject("aList", service.listProcess(member_no));

		mav.setViewName("my_cart");
		return mav;
	}// end listMethod()

	@RequestMapping("/my_coupon.do")
	public String mycoupon() {
		return "my_coupon";
	}

	@RequestMapping("/my_board.do")
	public String myboard() {
		return "my_board";
	}

}
