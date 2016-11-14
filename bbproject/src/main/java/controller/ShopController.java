package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShopController {
	
	
	@RequestMapping("/shop.do")
	public String shopPage(){
		return "view/shop/shopbody";
	}
	
	@RequestMapping("/shop_soup.do")
	public String soupPage(){
		return "view/shop/shopbody_soup";
	}//end soupPage()
	
	@RequestMapping("/shop_dish.do")
	public String dishPage(){
		return "view/shop/shopbody_dish";
	}//end dishPage()
	
	@RequestMapping("/shop_kimchi.do")
	public String kimchiPage(){
		return "view/shop/shopbody_kimchi";
	}//end kimchiPage()
	
}
