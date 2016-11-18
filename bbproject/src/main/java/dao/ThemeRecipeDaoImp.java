package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.ThemeRecipeDTO;

public class ThemeRecipeDaoImp implements ThemeRecipeDAO {
	private SqlSessionTemplate sqlSession;

	public ThemeRecipeDaoImp() {

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertRecipe(ThemeRecipeDTO dto) {
		sqlSession.insert("recipe.insert", dto);
	}

	@Override
	public List<ThemeRecipeDTO> selectList(int theme_no) {
		return sqlSession.selectList("recipe.list", theme_no);
	}

	@Override
	public ThemeRecipeDTO selectRecipe(int recipe_no) {
		return sqlSession.selectOne("recipe.detail", recipe_no);
	}


	
}
