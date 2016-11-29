package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.RecipePageDTO;
import dto.ThemeRecipeDTO;
import service.ThemeRecipeService;

@Controller
public class ThemeRecipeController {
	private ThemeRecipeService service;
	private int currentRow;

	public ThemeRecipeController() {
	}

	public void setService(ThemeRecipeService service) {
		this.service = service;
	}

	@RequestMapping("/recipe.do")
	public ModelAndView recipePage(RecipePageDTO pdto) {
		ModelAndView mav = new ModelAndView();
		int theme_no = pdto.getTheme_no();
		int totalRow = service.countRecipeProcess(pdto.getTheme_no());
		if (totalRow >= 1) {
			if (pdto.getCurrentRow() == 0) {
				currentRow = 1;
			} else {
				currentRow = pdto.getCurrentRow();
			}
			pdto = new RecipePageDTO(currentRow, totalRow);
			pdto.setTheme_no(theme_no);
			mav.addObject("pdto", pdto);
			mav.addObject("aList", service.selectListProcess(pdto));
		}
		mav.setViewName("recipe");
		return mav;
	}

	@RequestMapping(value = "/recipe.do", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> recipeReload(RecipePageDTO pdto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int theme_no = pdto.getTheme_no();
		int totalRow = service.countRecipeProcess(pdto.getTheme_no());
		if (totalRow >= 1) {
			if (pdto.getCurrentRow() == 0) {
				currentRow = 1;
			} else {
				currentRow = pdto.getCurrentRow();
			}
			pdto = new RecipePageDTO(currentRow, totalRow);
			pdto.setTheme_no(theme_no);
		}
		
		map.put("pdto", pdto);
		map.put("list", service.selectListProcess(pdto));
		
		return map; 
	}

	@RequestMapping("/recipedetail.do")
	public ModelAndView recipeDetailPage(int recipe_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", service.selectRecipeProcess(recipe_no));
		mav.setViewName("recipedetail");
		return mav;
	}

}
