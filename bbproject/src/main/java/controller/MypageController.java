package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.MemberDTO;
import dto.fb_BasketDTO;
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

	// 마이페이지 화면
	@RequestMapping("/mypage.do")
	public String mypage(HttpServletRequest req) {

		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		// System.out.println(dto.getMember_no());
		// System.out.println(dto.getcList().get(0).getCoupon_name());

		return "mypage";
	}

	// 주문내역 조회
	@RequestMapping("/my_order.do")
	public ModelAndView orderlist(HttpServletRequest req) {
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList", orderservice.orderlistProcess(dto.getMember_no()));
		mav.setViewName("my_order");
		return mav;

	}

	// 장바구니 확인
	@RequestMapping("/my_cart.do")
	public ModelAndView listMethod(HttpServletRequest req) {
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject("member_no", dto.getMember_no());
		mav.addObject("aList", service.listProcess(dto.getMember_no()));
		mav.setViewName("my_cart");
		return mav;
	}// end listMethod()

	// 장바구니 수량 변경
	@RequestMapping("/my_cart_amountupdate.do")
	public @ResponseBody List<fb_BasketDTO> amountUpdate(HttpServletRequest req, fb_BasketDTO bdto) {
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		bdto.setMember_no(dto.getMember_no());
		return service.amountUpdateProcess(bdto);
	}

	// 장바구니 상품 삭제
	@RequestMapping("/my_cart_delete.do")
	public @ResponseBody List<fb_BasketDTO> delete(HttpServletRequest req, fb_BasketDTO bdto) {
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		bdto.setMember_no(dto.getMember_no());
		return service.deleteProcess(bdto);
	}

	// 쿠폰, 적립금 확인
	@RequestMapping("/my_coupon.do")
	public ModelAndView couponlist(HttpServletRequest req) {
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList", couponservice.couponlistProcess(dto.getMember_no()));
		mav.setViewName("my_coupon");
		return mav;
	}

	// 내가 쓴글 확인
	@RequestMapping("/my_board.do")
	public ModelAndView BoardList(HttpServletRequest req, int boardcategory_no) {
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject("member_no", dto.getMember_no());
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_no", dto.getMember_no());
		map.put("boardcategory_no", boardcategory_no);
		mav.addObject("aList", boardservice.myboardlistProcess(map));
		mav.addObject("boardcategory_no", boardcategory_no);
		mav.setViewName("my_board");
		return mav;
	}

	// 내가 쓴 글 -자유게시판
	@RequestMapping("/my_board_free.do")
	public @ResponseBody myBoardDTO boardfreelist(HttpServletRequest req, int boardcategory_no) {
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_no", dto.getMember_no());
		map.put("boardcategory_no", boardcategory_no);
		return boardservice.myboardlistProcess(map);
	}

	// 내가 쓴 글 - 포토후기
	@RequestMapping("/my_board_photo.do")
	public @ResponseBody myBoardDTO boardphotolist(HttpServletRequest req, int boardcategory_no) {
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_no", dto.getMember_no());
		map.put("boardcategory_no", boardcategory_no);
		return boardservice.myboardlistProcess(map);
	}

	// 내가 쓴 글 -질문과 답변
	@RequestMapping("/my_board_qa.do")
	public @ResponseBody myBoardDTO boardqalist(HttpServletRequest req, int boardcategory_no) {
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_no", dto.getMember_no());
		map.put("boardcategory_no", boardcategory_no);
		return boardservice.myboardlistProcess(map);
	}

	// 내 정보 변경
	@RequestMapping("/my_update.do")
	public String myupdate() {
		return "my_update";
	}

	// 내 정보 변경
	@RequestMapping(value = "/myupdate.do", method = RequestMethod.POST)
	public String myupdateProcess(MemberDTO dto) {
		memberservice.updateProcess(dto);
		return "updsucc";
	}

	// 회원 탈퇴
	@RequestMapping("/my_leave.do")
	public String myleave() {
		return "my_leave";
	}

	// 회원 탈퇴
	@RequestMapping("/leavesucc.do")
	public String leavesucc() {
		return "leavesucc";
	}

	// 회원 가입 성공
	@RequestMapping("/joinsucc.do")
	public String joinsucc() {
		return "joinsucc";
	}

	// 회원탈퇴
	@RequestMapping(value = "/myleave.do", method = RequestMethod.POST)
	public String myleaveProcess(MemberDTO dto) {

		System.out.println(dto.getId());
		System.out.println(dto.getMember_name());
		System.out.println(dto.getPw());
		System.out.println(dto.getTel());
		System.out.println(dto.getAddress());

		memberservice.leaveProcess(dto);
		return "leavesucc";
	}

	// 내가쓴글 제목 검색
	@RequestMapping(value = "/boardtitlesearch.do", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> myboardtitleSearch(HttpServletRequest req, int boardcategory_no,
			String board_subject) {

		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_no", dto.getMember_no());
		map.put("boardcategory_no", boardcategory_no);
		map.put("board_subject", board_subject);
		map.put("list", boardservice.myBoardSearchProcess(dto.getMember_no(), boardcategory_no, board_subject));
		return map;
	}

	// 내가쓴글 내용 검색
	@RequestMapping(value = "/boardcontentsearch.do", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> myboardcontentSearch(HttpServletRequest req, int boardcategory_no,
			String board_content) {

		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_no", dto.getMember_no());
		map.put("boardcategory_no", boardcategory_no);
		map.put("board_content", board_content);

		map.put("list", boardservice.myContentSearchProcess(dto.getMember_no(), boardcategory_no, board_content));

		return map;
	}

	// 주문날짜 검색
	@RequestMapping(value = "/ordersearch.do", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> myorderSearch(HttpServletRequest req, String start, String end) {

		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("member");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_no", dto.getMember_no());
		map.put("start", start);
		map.put("end", end);

		map.put("list", orderservice.myOrderSearchProcess(dto.getMember_no(), start, end));

		return map;
	}

}
