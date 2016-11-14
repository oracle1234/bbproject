package service;

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
	public void insert(ThemeRecipeDTO dto) {
		dao.insertRecipe(dto);
	}

}
