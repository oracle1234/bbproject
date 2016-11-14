package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


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
	public String recipeinsertPage(int a){
		return "view/recipe_insert";
	}
	
}
