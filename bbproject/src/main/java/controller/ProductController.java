package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	

	
	@RequestMapping("/detailProduct.do")
	public ModelAndView detailproductProcess(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("view/shop_detail/detail_product");
		return mav;
	}
	
	@RequestMapping("reviewView.do")
	public ModelAndView review_listProcess(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reivew_list");
		return mav;
	}
}
