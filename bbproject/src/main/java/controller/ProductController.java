package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.xml.internal.ws.wsdl.writer.document.Service;

import dto.FoodsDTO;
import dto.ReviewDTO;
import service.ShopService;

@Controller
public class ProductController {
	

	ShopService service;
	
	
	
	public void setService(ShopService service) {
		this.service = service;
	}

	public ProductController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("/detailProduct.do")
	public ModelAndView detailproductProcess(FoodsDTO fdto){
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", service.listProcess(fdto.getFoods_no()));
		mav.setViewName("view/shop_detail/detail_product");
		return mav;
	}
	

	/*@RequestMapping("/reviewList.do")
	public ModelAndView review_listProcess(FoodsDTO fdto){
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("view/shop_detail/detail_product");
		return mav;
	}*/
}
