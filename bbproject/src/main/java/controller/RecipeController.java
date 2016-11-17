package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


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
	public ModelAndView recipeSavePage(int theme){
		ModelAndView mav = new ModelAndView();
		
		System.out.println(theme);
		
		mav.setViewName("view/recipe_insert");
		return mav;
	}
	
}
