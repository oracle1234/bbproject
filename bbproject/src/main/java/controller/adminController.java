package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dto.ThemeRecipeDTO;
import dto.ThemeRecipeOderDTO;
import service.ThemeRecipeService;

@Controller
public class adminController {
	private ThemeRecipeService service;

	public adminController() {
	}

	public void setService(ThemeRecipeService service) {
		this.service = service;
	}

	@RequestMapping("/admin.do")
	public String admin() {
		return "admin";
	}

	@RequestMapping("/adminrecipe.do")
	public String recipeadmin() {
		return "adminrecipe";
	}

	@RequestMapping("/adminrecipelist.do")
	public ModelAndView recipePage(int theme_no) {
		ModelAndView mav = new ModelAndView();
		List<ThemeRecipeDTO> list = service.selectListProcess(theme_no);
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
		return service.insertRecipeProcess(dto, req);
	}

	@RequestMapping("/adminrecipedel.do")
	public ModelAndView recipeDelPage(ThemeRecipeDTO dto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		List<ThemeRecipeDTO> list = service.deleteRecipeProcess(dto, req);
		mav.addObject("aList", list);
		mav.setViewName("adminrecipelist");
		return mav;
	}
	
	@RequestMapping("/test.do")
	public String test(){
		return "view/test";
	}

}
