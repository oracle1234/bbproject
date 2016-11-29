package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.RecipePageDTO;
import dto.ThemeRecipeDTO;

public interface ThemeRecipeService {
	public String insertRecipeProcess(ThemeRecipeDTO dto, HttpServletRequest req);
	public List<ThemeRecipeDTO> selectListProcess(RecipePageDTO pagedto);
	public ThemeRecipeDTO selectRecipeProcess(int recipe_no);
	public List<ThemeRecipeDTO> deleteRecipeProcess(ThemeRecipeDTO dto, HttpServletRequest request);
	public int countRecipeProcess(int theme_no);
}











