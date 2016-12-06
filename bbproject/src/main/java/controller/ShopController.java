package controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.FoodsDTO;
import dto.MemberDTO;
import dto.fb_BasketDTO;
import dto.fb_CouponDTO;
import dto.shop_PageDTO;
import service.ShopService;
import service.fb_BasketService;

@Controller
public class ShopController {

	private fb_BasketService basketService;
	private ShopService service;
	private int currentPage;
	private shop_PageDTO pdto;

	public ShopController() {
		// TODO Auto-generated constructor stubdd
	}

	public void setBasketService(fb_BasketService basketService) {
		this.basketService = basketService;
	}

	public void setService(ShopService service) {
		this.service = service;
	}

	@RequestMapping(value = "/shop.do", method = RequestMethod.GET)
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

	@RequestMapping(value = "/shop.do", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> shopPostPage(FoodsDTO fdto, shop_PageDTO spdto) {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

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

			resultMap.put("aList", service.pageListProcess(map));
		}

		resultMap.put("pv", pdto);
		return resultMap;
	}// end shopPage()

	/*
	 * @RequestMapping(value="/shop_buy.do", method = RequestMethod.POST) public
	 * ModelAndView buyPage(FoodsDTO fdto, HttpServletRequest req, String
	 * foods_no, String amount) { ModelAndView mav = new ModelAndView( );
	 * 
	 * MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");
	 * 
	 * String address[] = mdto.getAddress().split("/"); String Address =
	 * address[0]; String detailAddress = address[1]; String postNum =
	 * address[2];
	 * 
	 * String phoneNumber[] = mdto.getTel().split("-"); String firstPhone =
	 * phoneNumber[0]; String secondPhone = phoneNumber[1]; String lastPhone =
	 * phoneNumber[2];
	 * 
	 * System.out.println(foods_no); String[] foodsno = foods_no.split("\\|");
	 * int i; for(i=0; i<foodsno.length; i++){ System.out.println("길이"
	 * +foodsno.length); System.out.println(foodsno[i]);
	 * 
	 * }
	 * 
	 * System.out.println(amount); String[] amountarr = amount.split("\\|"); int
	 * j; for(j=0; j<amountarr.length; j++){ System.out.println("길이"
	 * +amountarr.length); System.out.println(amountarr[j]); }
	 * 
	 * mav.addObject("FoodsDTO", service.buyListProcess(fdto.getFoods_no()));
	 * mav.addObject("amount", amount); //mav.addObject("",
	 * service.buyListProcess(fdto.getFoods_no())); mav.addObject("foods_no",
	 * foodsno[1]); mav.addObject("amount", amountarr[1]);
	 * mav.addObject("MemberDTO", mdto); mav.addObject("Address", Address);
	 * mav.addObject("detailAddress", detailAddress); mav.addObject("postNum",
	 * postNum); mav.addObject("firstPhone", firstPhone);
	 * mav.addObject("secondPhone", secondPhone); mav.addObject("lastPhone",
	 * lastPhone); //mav.setViewName("shop_buy"); return mav; }
	 */

	@RequestMapping(value = "/shop_buy.do", method = RequestMethod.POST)
	public ModelAndView buyPostPage(FoodsDTO fdto, HttpServletRequest req, String[] checkfood) {
		ModelAndView mav = new ModelAndView();
		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");

		String uc = req.getHeader("referer");

		String address[] = mdto.getAddress().split("/");
		String Address = address[0];
		String detailAddress = address[1];
		String postNum = address[2];

		String phoneNumber[] = mdto.getTel().split("-");
		String firstPhone = phoneNumber[0];
		String secondPhone = phoneNumber[1];
		String lastPhone = phoneNumber[2];

		mav.addObject("MemberDTO", mdto);
		mav.addObject("Address", Address);
		mav.addObject("detailAddress", detailAddress);
		mav.addObject("postNum", postNum);
		mav.addObject("firstPhone", firstPhone);
		mav.addObject("secondPhone", secondPhone);
		mav.addObject("lastPhone", lastPhone);

		if (uc.indexOf("my_cart.do") > 0) {
			List<fb_BasketDTO> list = new ArrayList<fb_BasketDTO>();

			for (String foods_no : checkfood) {
				list.add(service.shopBuyProcess(Integer.parseInt(foods_no), mdto.getMember_no()));
			}

			mav.addObject("FoodsDTO", list);
			mav.setViewName("shop_buy");

		} else { // 바로구매
			List<FoodsDTO> list = new ArrayList<FoodsDTO>();

			for (String foods_no : checkfood) {
				list.add(service.buyListProcess(Integer.parseInt(foods_no)));
			}

			mav.addObject("Foods", fdto);
			mav.addObject("FoodsDTO", list);
			mav.setViewName("view/shop_buy/buyPage2");
		}

		return mav;
	}

	@RequestMapping(value = "/shopSearch.do", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> searchProcess(FoodsDTO fdto, shop_PageDTO spdto) {

		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		int totalRecord = service.countProcess(fdto.getCategory_no(), fdto.getFoods_name());

		if (totalRecord >= 1) {
			if (spdto.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = spdto.getCurrentPage();
			}

			pdto = new shop_PageDTO(currentPage, totalRecord);
			pdto.setCategory_no(fdto.getCategory_no());

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pdto", pdto);
			map.put("foods_name", fdto.getFoods_name());

			searchMap.put("searchList", service.shopSearchProcess(map));
		}

		searchMap.put("pdto", pdto);

		return searchMap;

	}// end searchProcess()

	@RequestMapping(value = "/shopSearch.do", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> searchPostProcess(FoodsDTO fdto, shop_PageDTO spdto) {

		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		int totalRecord = service.countProcess(fdto.getCategory_no(), fdto.getFoods_name());

		if (totalRecord >= 1) {
			if (spdto.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = spdto.getCurrentPage();
			}

			pdto = new shop_PageDTO(currentPage, totalRecord);
			pdto.setCategory_no(fdto.getCategory_no());

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pdto", pdto);
			map.put("foods_name", fdto.getFoods_name());

			searchMap.put("searchList", service.shopSearchProcess(map));
		}

		searchMap.put("pdto", pdto);

		return searchMap;

	}// end searchProcess()

	@RequestMapping(value = "/pay_end.do", method = RequestMethod.GET)
	public ModelAndView pay_endProcess(HttpServletRequest req, String useSaveMoney) {
		
		ModelAndView mav = new ModelAndView();
		

		return mav;

	}

	@RequestMapping(value = "/pay_end.do", method = RequestMethod.POST)
	public ModelAndView pay_endPostProcess(HttpServletRequest req, String chkfood[], String foods_no[],
			String foods_name[], int price[], int amount[], String savepoint[], String userpoint) {
			
		System.out.println(userpoint);
		
		ModelAndView mav = new ModelAndView();
		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");

		int savePoint = 0;
		for (String i : savepoint) {
			savePoint += Integer.parseInt(i.substring(0, i.lastIndexOf(".")));
		}

		MailSend ms = new MailSend(mdto, price, amount, foods_name);
		
		List<FoodsDTO> list = new ArrayList<FoodsDTO>();
		for(int i = 0; i<foods_no.length; i++){
			list.add(service.buyListProcess(Integer.parseInt(foods_no[i])));
		}
		
		
		/*for(int i = 0; i < list.size(); i++){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_no", mdto.getMember_no());
		map.put("foods_no", list.get(i).getFoods_no());
		map.put("foods_name", list.get(i).getFoods_name());
		map.put("price", list.get(i).getPrice());
		map.put("amount", amount[i]);
		map.put("delivery_condition", "주문완료");
		map.put("picture", list.get(i).getPicture());
		service.requestInsertProcess(map);
		}*/
		

		service.savePointPlusProcess(mdto.getMember_no(), savePoint);
		service.savePointMinusProcess(mdto.getMember_no(), Integer.parseInt(userpoint));

		for (String food_no : chkfood) {
			int count = service.basketChkProcess(Integer.parseInt(food_no), mdto.getMember_no());
			if (count != 0) {
				basketService.basketDeleteProcess(Integer.parseInt(food_no));
			}
		}

		mav.setViewName("shop_buy_result");
		return mav;

	}
	
	@RequestMapping(value = "/paynow_end.do", method = RequestMethod.GET)
	public ModelAndView paynow_endProcess(HttpServletRequest req) {
		
		
		ModelAndView mav = new ModelAndView();
		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");
		
		return mav;

	}

	@RequestMapping(value = "/paynow_end.do", method = RequestMethod.POST)
	public ModelAndView paynow_endPostProcess(HttpServletRequest req, String chkfood, String foods_no,
			String foods_name, int price, int amount, String savepoint, String userpoint) {
		
		
		ModelAndView mav = new ModelAndView();
		MemberDTO mdto = (MemberDTO) req.getSession().getAttribute("member");

		MailSend ms = new MailSend(mdto, price, amount, foods_name);
		String SavePoint = savepoint.substring(0, savepoint.lastIndexOf("."));

		service.savePointPlusProcess(mdto.getMember_no(), Integer.parseInt(SavePoint));
		service.savePointMinusProcess(mdto.getMember_no(), Integer.parseInt(userpoint));
		
		/*HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_no", mdto.getMember_no());
		map.put("price", price);
		map.put("amount", amount);
		map.put("foods_no", foods_no);
		map.put("delivery_condition", "주문완료");
		//변경예정
		map.put("picture", 3);
		
		service.requestInsertProcess(map);*/
		

		int count = service.basketChkProcess(Integer.parseInt(foods_no), mdto.getMember_no());
		if (count != 0) {
			basketService.basketDeleteProcess(Integer.parseInt(foods_no));
		}

		mav.setViewName("shop_buy_result");
		return mav;
		

	}
	
	

	
	

}// end class
