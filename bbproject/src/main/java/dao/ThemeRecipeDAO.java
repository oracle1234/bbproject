package dao;

import java.util.List;

import dto.ThemeRecipeDTO;

public interface ThemeRecipeDAO {
	public String insertRecipe(ThemeRecipeDTO dto);
	public List<ThemeRecipeDTO> selectList(int theme_no);
	public ThemeRecipeDTO selectRecipe(int recipe_no);
	public List<ThemeRecipeDTO> deleteRecipe(ThemeRecipeDTO dto);
}
