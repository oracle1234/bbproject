package dao;

import java.util.HashMap;
import java.util.List;

import dto.RecipePageDTO;
import dto.ThemeRecipeDTO;

public interface ThemeRecipeDAO {
	public String insertRecipe(ThemeRecipeDTO dto);
	public List<ThemeRecipeDTO> selectList(RecipePageDTO pdto);
	public ThemeRecipeDTO selectRecipe(int recipe_no);
	public List<ThemeRecipeDTO> deleteRecipe(ThemeRecipeDTO dto);
	public int countRecipe(int theme_no);
	public List<ThemeRecipeDTO> selectSearch(HashMap<String, Object> map);
	public int countRecipe(HashMap<String, Object> map);
}
