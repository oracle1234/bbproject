package service;

import java.util.List;

import dao.ThemeRecipeDAO;
import dto.ThemeRecipeDTO;

public class ThemeRecipeServiceImp implements ThemeRecipeService {
	private ThemeRecipeDAO dao;

	public ThemeRecipeServiceImp() {

	}

	public void setDao(ThemeRecipeDAO dao) {
		this.dao = dao;
	}

	@Override
	public void insertRecipeProcess(ThemeRecipeDTO dto) {
		dao.insertRecipe(dto);
	}

	@Override
	public List<ThemeRecipeDTO> selectListProcess(int theme_no) {
		return dao.selectList(theme_no);
	}

	@Override
	public ThemeRecipeDTO selectRecipeProcess(int recipe_no) {
		return dao.selectRecipe(recipe_no);
	}

}
