package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.BoardDTO;
import dto.MemberDTO;
import dto.fb_BasketDTO;
import dto.fb_OrderDTO;
import dto.myBoardDTO;
import service.MemberService;
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
	private MemberService memberservice;

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
	
	public void setMemberservice(MemberService memberservice) {
		this.memberservice = memberservice;
	}
	
	@RequestMapping("/mypage.do")
	public String mypage(HttpServletRequest req) {
		
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
	/*	System.out.println(dto.getMember_no());
		System.out.println(dto.getcList().get(0).getCoupon_name());*/
		
		return "mypage";
	}

	@RequestMapping("/my_order.do")
	public ModelAndView orderlist(HttpServletRequest req){
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList", orderservice.orderlistProcess(dto.getMember_no()));
		mav.setViewName("my_order");
		return mav;
	}

	@RequestMapping("/my_cart.do")
	public ModelAndView listMethod(HttpServletRequest req) {
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject("member_no", dto.getMember_no());
		mav.addObject("aList", service.listProcess(dto.getMember_no()));
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
	public ModelAndView couponlist(HttpServletRequest req){
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList", couponservice.couponlistProcess(dto.getMember_no()));
		mav.setViewName("my_coupon");
		return mav;
	}

	@RequestMapping("/my_board.do")
	public ModelAndView BoardList(HttpServletRequest req, int boardcategory_no){
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject("member_no", dto.getMember_no());
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_no", dto.getMember_no());
		map.put("boardcategory_no", boardcategory_no);
		mav.addObject("aList", boardservice.myboardlistProcess(map));
		mav.setViewName("my_board");
		return mav;
	}
	
	@RequestMapping("/my_board_free.do")
	public @ResponseBody List<myBoardDTO> boardfreelist(HttpServletRequest req, int boardcategory_no){
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_no", dto.getMember_no());
		map.put("boardcategory_no", boardcategory_no);
		return boardservice.myboardlistProcess(map);
	}

	@RequestMapping("/my_board_photo.do")
	public @ResponseBody List<myBoardDTO> boardphotolist(HttpServletRequest req, int boardcategory_no){
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_no", dto.getMember_no());
		map.put("boardcategory_no", boardcategory_no);
		return boardservice.myboardlistProcess(map);
	}
	

	@RequestMapping("/my_board_qa.do")
	public @ResponseBody List<myBoardDTO> boardqalist(HttpServletRequest req, int boardcategory_no){
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_no", dto.getMember_no());
		map.put("boardcategory_no", boardcategory_no);
		return boardservice.myboardlistProcess(map);
	}
	
	@RequestMapping("/my_update.do")
	public String myupdate(){
		return "my_update";
	}
	
	@RequestMapping(value = "/myupdate.do", method = RequestMethod.POST)
	public String myupdateProcess(MemberDTO dto) {
		memberservice.updateProcess(dto);
		return "joinsucc";
	}
	
	@RequestMapping("/my_leave.do")
	public String myleave(){
		return "my_leave";
	}
	
	@RequestMapping(value = "/myleave.do", method = RequestMethod.POST)
	public String myleaveProcess(MemberDTO dto) {
		memberservice.leaveProcess(dto);
		return "joinsucc";
	}
	
}
