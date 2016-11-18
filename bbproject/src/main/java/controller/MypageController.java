package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.Photo_BoardDTO;
import dto.fb_BasketDTO;
import service.fb_BasketService;
import service.fb_CouponService;
import service.fb_OrderService;
import service.myBoardService;

@Controller
public class MypageController {

	private fb_BasketService service;
	private fb_OrderService orderservice;
	private fb_CouponService couponservice;
	private myBoardService boardservice;

	public MypageController() {

	}

	public void setService(fb_BasketService service) {
		this.service = service;
	}

	public void setOrderservice(fb_OrderService orderservice) {
		this.orderservice = orderservice;
	}

	public void setCouponservice(fb_CouponService couponservice) {
		this.couponservice = couponservice;
	}
	
	public void setBoardservice(myBoardService boardservice) {
		this.boardservice = boardservice;
	}
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "mypage";
	}

	@RequestMapping("/my_order.do")
	public ModelAndView orderlist(int member_no){
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList", orderservice.orderlistProcess(member_no));
		mav.setViewName("my_order");
		return mav;
	}

	@RequestMapping("/my_cart.do")
	public ModelAndView listMethod(int member_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("member_no", member_no);
		mav.addObject("aList", service.listProcess(member_no));
		mav.setViewName("my_cart");
		return mav;
	}// end listMethod()
	
	@RequestMapping("/my_cart_amountupdate.do")
	public @ResponseBody List<fb_BasketDTO> amountUpdate(fb_BasketDTO bdto){
		return service.amountUpdateProcess(bdto);
	}
	
	@RequestMapping("/my_cart_delete.do")
	public @ResponseBody List<fb_BasketDTO> delete(fb_BasketDTO bdto){
		return service.deleteProcess(bdto);
	}
	
	@RequestMapping("/my_coupon.do")
	public ModelAndView couponlist(int member_no){
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList", couponservice.couponlistProcess(member_no));
		mav.setViewName("my_coupon");
		return mav;
	}

	@RequestMapping("/my_board.do")
	public ModelAndView BoardList(int member_no){
		ModelAndView mav = new ModelAndView();
		mav.addObject("member_no", member_no);
		mav.addObject("aList", boardservice.BoardListProcess(member_no));
		return mav;
	}
	
	@RequestMapping("/my_board_photo.do")
	public ModelAndView PhotoList(int member_no){
		ModelAndView mav = new ModelAndView();
		mav.addObject("member_no", member_no);
		mav.addObject("aList", boardservice.PhotoListProcess(member_no));
		return mav;
	}
	
	@RequestMapping("/my_board_qa.do")
	public ModelAndView QaList(int member_no){
		ModelAndView mav = new ModelAndView();
		mav.addObject("member_no", member_no);
		mav.addObject("aList", boardservice.QaListProcess(member_no));
		return mav;
	}

}
