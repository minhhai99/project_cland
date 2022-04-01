package spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.model.Category;

@Repository
public class DanhMucTinDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Category> findAll(){
		String sql = "SELECT * FROM danhmuctin ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));
	}
}
