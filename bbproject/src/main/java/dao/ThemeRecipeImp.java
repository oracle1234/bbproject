package dao;

import org.mybatis.spring.SqlSessionTemplate;

import dto.ThemeRecipeDTO;

public class ThemeRecipeImp implements ThemeRecipeDAO {
	private SqlSessionTemplate sqlSession;

	public ThemeRecipeImp() {

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertRecipe(ThemeRecipeDTO dto) {
		
		sqlSession.insert("recipe.insert", dto);
	}


	
}
