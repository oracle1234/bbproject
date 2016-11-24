package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dto.FoodsDTO;
import dto.ThemeRecipeDTO;
import service.ShopService;
import service.ThemeRecipeService;

@Controller
public class adminController {
	private ThemeRecipeService recipeservice;
	private ShopService foodsservice;

	public adminController() {
		
	}

	public void setRecipeservice(ThemeRecipeService recipeservice) {
		this.recipeservice = recipeservice;
	}
	
	

	public void setFoodsservice(ShopService foodsservice) {
		this.foodsservice = foodsservice;
	}

	@RequestMapping("/admin.do")
	public String admin() {
		return "admin";
	}

	/*
	 * 레시피관리
	 */
	@RequestMapping("/adminrecipe.do")
	public String recipeadmin() {
		return "adminrecipe";
	}

	@RequestMapping("/adminrecipelist.do")
	public ModelAndView recipePage(int theme_no) {
		ModelAndView mav = new ModelAndView();
		List<ThemeRecipeDTO> list = recipeservice.selectListProcess(theme_no);
		mav.addObject("aList", list);
		mav.setViewName("adminrecipelist");
		return mav;
	}

	@RequestMapping(value = "/adminrecipeins.do", method = RequestMethod.GET)
	public String recipeinsertPage() {
		return "adminrecipeins";
	}

	@RequestMapping(value = "/adminrecipeins.do", method = RequestMethod.POST)
	public String recipeSavePage(ThemeRecipeDTO dto, HttpServletRequest req) {
		return recipeservice.insertRecipeProcess(dto, req);
	}

	@RequestMapping("/adminrecipedel.do")
	public ModelAndView recipeDelPage(ThemeRecipeDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		List<ThemeRecipeDTO> list = recipeservice.deleteRecipeProcess(dto, req);
		mav.addObject("aList", list);
		mav.setViewName("adminrecipelist");
		return mav;
	}

	/*
	 * 음식관리
	 */
	@RequestMapping("/adminfoods.do")
	public String foodsInsertPage() {
		return "adminfoods";
	}

	@RequestMapping("/adminfoodslist.do")
	public ModelAndView foodsPage(int category_no) {
		ModelAndView mav = new ModelAndView();
		List<FoodsDTO> aList = foodsservice.adminFoodsListProcess(category_no);
		mav.addObject("aList", aList);
		mav.setViewName("adminfoodslist");
		return mav;
	}

	@RequestMapping(value = "/adminfoodsins.do", method = RequestMethod.GET)
	public String foodsinsertPage() {
		return "adminfoodsins";
	}

	@RequestMapping(value = "/adminfoodsins.do", method = RequestMethod.POST)
	public String foodsSavePage(FoodsDTO dto, HttpServletRequest req) {
		return foodsservice.insertFoodsProcess(dto, req);
	}
	
	@RequestMapping("/adminfoodsdel.do")
	public ModelAndView foodsDelPage(FoodsDTO dto, HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		
		List<FoodsDTO> aList = foodsservice.deletFoodsProcess(dto.getFoods_no(), req);
		mav.addObject("aList", aList);
		mav.setViewName("adminfoodslist");
		
		return mav;
	}

	@RequestMapping("/test.do")
	public String test() {
		return "view/test";
	}

}
