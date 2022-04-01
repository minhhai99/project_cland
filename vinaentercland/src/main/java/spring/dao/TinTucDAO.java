package spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.model.Lands;

@Repository
public class TinTucDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Lands> findAll(){
		String sql = "SELECT * FROM `tintuc` ORDER BY id_tintuc DESC ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Lands>(Lands.class));
	}
	
	public List<Lands> findByCatId(int id_danhmuctin){
		String sql = "SELECT * FROM `tintuc` WHERE id_danhmuctin = ? ORDER BY id_tintuc DESC ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Lands>(Lands.class) , id_danhmuctin);
	}
	
	public Lands findById(int id_tintuc) {
		String sql = "SELECT * FROM `tintuc` WHERE id_tintuc = ? ";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<Lands>(Lands.class) , id_tintuc);
	}

}
