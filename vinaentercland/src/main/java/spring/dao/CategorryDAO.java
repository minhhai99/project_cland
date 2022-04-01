package spring.dao;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.model.Category;

@Repository
public class CategorryDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public BeanPropertyRowMapper<Category> getRowMapper(){
		return new BeanPropertyRowMapper<Category>(Category.class);
	}
	public List<Category> getItems(){
		String sql = "SELECT * FROM categories";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));
	}
	
	public int add(Category category) {
		String sql = "INSERT INTO categories(cname) VALUES (N?)";
		return jdbcTemplate.update(sql, new Object[] { category.getCname() });
	}

	public int delete(int cid) {
		String sql ="DELETE FROM categories WHERE cid = ?";
		return jdbcTemplate.update(sql, new Object[] { cid });
	}

	public Category getItem(int cid) {
		String sql = "SELECT * FROM categories WHERE cid = ?";
		return jdbcTemplate.queryForObject(sql, getRowMapper(),new Object[] { cid });
	}
	public int edit(@Valid Category category) {
		String sql = "UPDATE categories SET cname=? WHERE cid = ?";
		return jdbcTemplate.update(sql, new Object[] {category.getCname(), category.getCid()});
	}
	public List<Category> getSearch(String search) {
		String sql="SELECT * FROM categories WHERE cname LIKE BINARY ?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class), new Object[] { "%"+ search +"%"});
	}
	public int getCount() {
		String sql = "SELECT COUNT(*) AS count FROM categories";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public int categoryIdMax() {
		String sql= "SELECT MAX(cid) FROM categories";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public Category getIdCountinue(int id) {
		String sql = "SELECT * FROM categories WHERE cid < ? OR cid = 1 ORDER BY cid DESC LIMIT 1";
		return jdbcTemplate.queryForObject(sql, getRowMapper(),new Object[] { id });
	}
	public Category getIdNext(int id) {
		String sql = "SELECT * FROM categories WHERE cid > ? OR cid = (SELECT MAX(cid) FROM categories) ORDER BY cid ASC LIMIT 1";
		return jdbcTemplate.queryForObject(sql, getRowMapper(),new Object[] { id });
	}
	
	
}
