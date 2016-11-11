package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	
	@RequestMapping("/product.do")
	public ModelAndView productProcess(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shopbody");
		return mav;
	}
	
	@RequestMapping("/detailproduct.do")
	public ModelAndView detailproductProcess(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("detailproduct");
		return mav;
	}
}
