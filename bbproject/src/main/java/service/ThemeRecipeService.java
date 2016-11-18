package service;

import java.util.List;

import dto.ThemeRecipeDTO;

public interface ThemeRecipeService {
	public void insertRecipeProcess(ThemeRecipeDTO dto);
	public List<ThemeRecipeDTO> selectListProcess(int theme_no);
	public ThemeRecipeDTO selectRecipeProcess(int recipe_no);
}











