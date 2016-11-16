package controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.FoodsDTO;
import dto.shop_PageDTO;
import service.ShopService;

@Controller
public class ShopController {

	private ShopService service;
	private int currentPage;
	private shop_PageDTO pdto;

	public ShopController() {
		// TODO Auto-generated constructor stub
	}

	public void setService(ShopService service) {
		this.service = service;
	}

	@RequestMapping("/shopSoup.do")
	public ModelAndView soupPage(FoodsDTO fdto, shop_PageDTO spdto) {

		ModelAndView mav = new ModelAndView();
		int totalRecord = service.countProcess(fdto.getCategory_no());
		
		

		if (totalRecord >= 1) {
			// 첫 접속시 현재 페이지를 1로 지정
			if (spdto.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = spdto.getCurrentPage();

			pdto = new shop_PageDTO(currentPage, totalRecord);
			mav.addObject("pv", pdto);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", pdto.getStartRow());
			map.put("endRow", pdto.getEndRow());
			map.put("category_no", fdto.getCategory_no());
			
			mav.addObject("aList", service.pageListProcess(map));
			
		}
		mav.setViewName("shop_soup");
		return mav;
	}

	@RequestMapping("/shopDish.do")
	public ModelAndView dishPage(FoodsDTO fdto, shop_PageDTO spdto) {
		ModelAndView mav = new ModelAndView();

		int totalRecord = service.countProcess(fdto.getCategory_no());

		if (totalRecord >= 1) {
			// 첫 접속시 현재 페이지를 1로 지정
			if (spdto.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = spdto.getCurrentPage();

			pdto = new shop_PageDTO(currentPage, totalRecord);
			mav.addObject("pv", pdto);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", pdto.getStartRow());
			map.put("endRow", pdto.getEndRow());
			map.put("category_no", fdto.getCategory_no());
			
			mav.addObject("aList", service.pageListProcess(map));
		}

		mav.setViewName("shop_dish");
		return mav;
	}// end dishPage()

	@RequestMapping("/shopKimchi.do")
	public ModelAndView kimchiPage(FoodsDTO fdto, shop_PageDTO spdto) {
		ModelAndView mav = new ModelAndView();

		int totalRecord = service.countProcess(fdto.getCategory_no());

		if (totalRecord >= 1) {
			// 첫 접속시 현재 페이지를 1로 지정
			if (spdto.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = spdto.getCurrentPage();

			pdto = new shop_PageDTO(currentPage, totalRecord);
			mav.addObject("pv", pdto);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", pdto.getStartRow());
			map.put("endRow", pdto.getEndRow());
			map.put("category_no", fdto.getCategory_no());
			
			mav.addObject("aList", service.pageListProcess(map));
		}

		mav.setViewName("shop_kimchi");
		return mav;
	}// end kimchiPage()
	
	
}
