package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.ThemeRecipeDTO;

public interface ThemeRecipeService {
	public String insertRecipeProcess(ThemeRecipeDTO dto, HttpServletRequest req);
	public List<ThemeRecipeDTO> selectListProcess(int theme_no);
	public ThemeRecipeDTO selectRecipeProcess(int recipe_no);
	public List<ThemeRecipeDTO> deleteRecipeProcess(ThemeRecipeDTO dto, HttpServletRequest request);
}











