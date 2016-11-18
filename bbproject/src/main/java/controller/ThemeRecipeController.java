package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.ThemeRecipeDTO;
import service.ThemeRecipeService;

@Controller
public class ThemeRecipeController {
	private ThemeRecipeService service;

	public ThemeRecipeController() {
	}

	public void setService(ThemeRecipeService service) {
		this.service = service;
	}

	@RequestMapping("/recipe.do")
	public ModelAndView recipePage(int theme_no) {
		ModelAndView mav = new ModelAndView();
		List<ThemeRecipeDTO> list = service.selectListProcess(theme_no);
		mav.addObject("aList", list);
		mav.setViewName("recipe");
		return mav;
	}

	@RequestMapping("/recipedetail.do")
	public ModelAndView recipeDetailPage(int recipe_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", service.selectRecipeProcess(recipe_no));
		mav.setViewName("recipedetail");
		return mav;
	}

}
