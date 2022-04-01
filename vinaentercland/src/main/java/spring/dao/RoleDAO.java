package spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.model.Roles;
@Repository
public class RoleDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private static final String FIND_ALL ="SELECT * FROM roles";
	
	public List<Roles> getItems(){
		return jdbcTemplate.query(FIND_ALL, new BeanPropertyRowMapper<Roles>(Roles.class));
	}
}
