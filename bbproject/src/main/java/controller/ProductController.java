package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.xml.internal.ws.wsdl.writer.document.Service;

import dto.FoodsDTO;
import dto.ReviewDTO;
import dto.review_PageDTO;
import dto.shop_PageDTO;
import jdk.nashorn.internal.ir.RuntimeNode.Request;
import service.ShopService;

@Controller
public class ProductController {
	

	ShopService service;
	private review_PageDTO pdto;
	private int currentPage;
	
	
	public void setService(ShopService service) {
		this.service = service;
	}

	public ProductController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "/detailProduct.do", method = RequestMethod.GET)
	public ModelAndView detailproductProcess(FoodsDTO fdto, review_PageDTO rpdto){
		
		ModelAndView mav = new ModelAndView();
		
		int totalRecord = service.reviewCountProcess(fdto.getFoods_no());
		
		if (totalRecord >= 1) {
			// 첫 접속시 현재 페이지를 1로 지정
			if (rpdto.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = rpdto.getCurrentPage();

			pdto = new review_PageDTO(currentPage, totalRecord);
			mav.addObject("pv", pdto);
			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", pdto.getStartRow());
			map.put("endRow", pdto.getEndRow());
			map.put("foods_no", fdto.getFoods_no());
			mav.addObject("aList", service.reviewPageListProcess(map));
			
		}
		
		mav.addObject("foods_no", fdto.getFoods_no());
		mav.addObject("list", service.listProcess(fdto.getFoods_no()));
		mav.setViewName("detail_product");
		return mav;
	}
	
	@RequestMapping(value="/detailProduct.do", method = RequestMethod.POST)
	public @ResponseBody List<ReviewDTO> detailproductPostProcess(FoodsDTO fdto, review_PageDTO rpdto){
		
//		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int totalRecord = service.reviewCountProcess(fdto.getFoods_no());
		
		if (totalRecord >= 1) {
			// 첫 접속시 현재 페이지를 1로 지정
			if (rpdto.getCurrentPage() == 0)
				currentPage = 1;
			else
				currentPage = rpdto.getCurrentPage();

			pdto = new review_PageDTO(currentPage, totalRecord);
//			mav.addObject("pv", pdto);
			
			
			map.put("startRow", pdto.getStartRow());
			map.put("endRow", pdto.getEndRow());
			map.put("foods_no", fdto.getFoods_no());
//			mav.addObject("aList", service.reviewPageListProcess(map));
			
		}
		
//		mav.addObject("foods_no", fdto.getFoods_no());
//		mav.addObject("list", service.listProcess(fdto.getFoods_no()));
//		mav.setViewName("view/shop_detail/detail_product");
//		return mav;
		return service.reviewPageListProcess(map);
	}
	

	/*@RequestMapping("/reviewList.do")
	public ModelAndView review_listProcess(FoodsDTO fdto){
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("view/shop_detail/detail_product");
		return mav;
	}*/
}
