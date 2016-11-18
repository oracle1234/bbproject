package dao;

import java.util.List;

import dto.ThemeRecipeDTO;

public interface ThemeRecipeDAO {
	public void insertRecipe(ThemeRecipeDTO dto);
	public List<ThemeRecipeDTO> selectList();
	public ThemeRecipeDTO selectRecipe(int recipe_no);
}
