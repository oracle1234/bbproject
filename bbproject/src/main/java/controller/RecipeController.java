package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.ThemeRecipeDTO;


@Controller
public class RecipeController {
	
	@RequestMapping("/recipe.do")
	public String recipePage() {
		return "recipe";
	}
	
	@RequestMapping(value = "/recipeins.do", method = RequestMethod.GET)
	public String recipeinsertPage(){
		return "view/recipe_insert";
	}
	
	@RequestMapping(value = "/recipeins.do", method = RequestMethod.POST)
	public ModelAndView recipeSavePage(ThemeRecipeDTO theme, HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		
		
		for (MultipartFile ss : theme.getComplete_file()) {
			System.out.println(ss.getOriginalFilename());
		}
		
		
		
		mav.setViewName("view/recipe_insert");
		return mav;
	}
	
}
