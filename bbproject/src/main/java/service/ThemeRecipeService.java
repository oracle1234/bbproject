package service;

import java.util.List;

import dto.ThemeRecipeDTO;

public interface ThemeRecipeService {
	public void insertRecipeProcess(ThemeRecipeDTO dto);
	public List<ThemeRecipeDTO> selectListProcess();
}











