package controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.FoodsDTO;
import dto.MemberDTO;
import dto.fb_CouponDTO;
import dto.shop_PageDTO;
import service.ShopService;

@Controller
public class ShopController {

	private ShopService service;
	private int currentPage;
	private shop_PageDTO pdto;

	public ShopController() {
		// TODO Auto-generated constructor stubdd
	}

	public void setService(ShopService service) {
		this.service = service;
	}

	@RequestMapping(value="/shop.do", method=RequestMethod.GET)
	public ModelAndView shopPage(FoodsDTO fdto, shop_PageDTO spdto) {
		ModelAndView mav = new ModelAndView();
		

		int totalRecord = service.countProcess(fdto.getCategory_no());

		if (totalRecord >= 1) {
			// 첫 접속시 현재 페이지를 1로 지정
			if (spdto.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = spdto.getCurrentPage();

			pdto = new shop_PageDTO(currentPage, totalRecord);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", pdto.getStartRow());
			map.put("endRow", pdto.getEndRow());
			map.put("category_no", fdto.getCategory_no());
			
			mav.addObject("category_no", fdto.getCategory_no());
			mav.addObject("pv", pdto);
			mav.addObject("aList", service.pageListProcess(map));
		}

		mav.setViewName("shop");
		return mav;
	}// end shopPage()
	
	@RequestMapping(value="/shop.do", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> shopPostPage(FoodsDTO fdto, shop_PageDTO spdto) {
		
		System.out.println("카넘:"+fdto.getCategory_no());
		System.out.println("커런트"+spdto.getCurrentPage());
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int totalRecord = service.countProcess(fdto.getCategory_no());
		System.out.println("토탈"+totalRecord);

		if (totalRecord >= 1) {
			// 첫 접속시 현재 페이지를 1로 지정
			if (spdto.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = spdto.getCurrentPage();

			pdto = new shop_PageDTO(currentPage, totalRecord);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", pdto.getStartRow());
			map.put("endRow", pdto.getEndRow());
			map.put("category_no", fdto.getCategory_no());
			
			resultMap.put("aList", service.pageListProcess(map));
		}
		
		resultMap.put("pv", pdto);
		return resultMap;
	}// end shopPage()
	

	
	@RequestMapping(value="/shop_buy.do", method = RequestMethod.POST)
	public ModelAndView buyPage(FoodsDTO fdto, HttpServletRequest req,  int amount) {
		ModelAndView mav = new ModelAndView( );
		
		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");
		
		String address[] = mdto.getAddress().split("/");
		String Address = address[0]; 
		String detailAddress = address[1];
		String postNum = address[2];
		
		String phoneNumber[] = mdto.getTel().split("-");
		String firstPhone = phoneNumber[0];
		String secondPhone = phoneNumber[1];
		String lastPhone = phoneNumber[2];
		
		
		
		
		mav.addObject("FoodsDTO", service.buyListProcess(fdto.getFoods_no()));
		mav.addObject("amount", amount);
		mav.addObject("MemberDTO", mdto);
		mav.addObject("Address", Address);
		mav.addObject("detailAddress", detailAddress);
		mav.addObject("postNum", postNum);
		mav.addObject("firstPhone", firstPhone);
		mav.addObject("secondPhone", secondPhone);
		mav.addObject("lastPhone", lastPhone);
		mav.setViewName("shop_buy");
		return mav;
	}
	
	@RequestMapping(value = "/shopSearch.do", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> searchProcess(FoodsDTO fdto, shop_PageDTO spdto){
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		int totalRecord = service.countProcess(fdto.getCategory_no(), fdto.getFoods_name());

		if (totalRecord >= 1) {
			if (spdto.getCurrentPage() == 0){
				currentPage = 1;
			}
			else{
				currentPage = spdto.getCurrentPage();
			}
			
			pdto = new shop_PageDTO(currentPage, totalRecord);
			pdto.setCategory_no(fdto.getCategory_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pdto", pdto);
			map.put("foods_name", fdto.getFoods_name());
			
			searchMap.put("searchList", service.shopSearchProcess(map));
		}
		
		searchMap.put("pdto",pdto);
		
		return searchMap;
		
	}//end searchProcess()
	
	@RequestMapping(value = "/shopSearch.do", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> searchPostProcess(FoodsDTO fdto, shop_PageDTO spdto){
		
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		int totalRecord = service.countProcess(fdto.getCategory_no(), fdto.getFoods_name());

		if (totalRecord >= 1) {
			if (spdto.getCurrentPage() == 0){
				currentPage = 1;
			}
			else{
				currentPage = spdto.getCurrentPage();
			}
			
			pdto = new shop_PageDTO(currentPage, totalRecord);
			pdto.setCategory_no(fdto.getCategory_no());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pdto", pdto);
			map.put("foods_name", fdto.getFoods_name());
			
			searchMap.put("searchList", service.shopSearchProcess(map));
		}
		
		searchMap.put("pdto",pdto);
		
		return searchMap;
		
	}//end searchProcess()
	
	@RequestMapping("/pay_end.do")
	public ModelAndView mailSendProcess(HttpServletRequest req){
		
		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");
		ModelAndView mav = new ModelAndView();
		
		new MailSend(mdto);
		
		mav.setViewName("shop_buy_result");
		return mav;
		
	}
	
}//end class

