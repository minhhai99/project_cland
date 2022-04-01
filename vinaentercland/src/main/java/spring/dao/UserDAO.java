package spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import spring.model.Roles;
import spring.model.Users;
import string.util.DefineUtil;

@Repository
public class UserDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public BeanPropertyRowMapper<Users> getRowMapper(){
		return new BeanPropertyRowMapper<Users>(Users.class);
	}
	
	private RowMapper<Users> getRowMapperUser(){
		return new RowMapper<Users>() {

			@Override
			public Users mapRow(ResultSet rs, int rowNum) throws SQLException {
				Users user = new Users(rs.getInt("id"), rs.getString("username"), rs.getString("full_name"), rs.getString("password"), 
						new Roles(rs.getInt("roleId"), rs.getString("roleName")));
				return user;
			}
		};
	}
	public List<Users> getItems(){
		String sql = "SELECT u.*, r.roleName FROM users AS u INNER JOIN roles AS r ON u.roleId = r.rid ORDER BY u.id DESC";
		return jdbcTemplate.query(sql, new RowMapper<Users>() {

			@Override
			public Users mapRow(ResultSet rs, int rowNum) throws SQLException {
				Users user = new Users(rs.getInt("id"), rs.getString("username"), rs.getString("full_name"), rs.getString("password"), 
						new Roles(rs.getInt("roleId"), rs.getString("roleName")));
				return user;
			}
		});
	}

	public int add(Users users) {
		String sql="INSERT INTO users(username, full_name, password, roleId ) VALUES( ?, ? , ? , ? )";
		return jdbcTemplate.update(sql, 
				new Object[] {users.getUsername(), 
						users.getFull_name(), 
						users.getPassword(), 
						users.getRole().getRid()});
	}
	public boolean hasUser(String username) {
		String sql ="SELECT COUNT(*) FROM users WHERE username = ? ";
		return jdbcTemplate.queryForObject(sql, Boolean.class, new Object[] {username});
	}

	public int delete(int id) {
		String sql="DELETE FROM users WHERE id = ?";
		return jdbcTemplate.update(sql, new Object[] { id });
	}

	public Users getItem(int id) {
		String sql = "SELECT u.*, r.roleName, r.rid FROM users AS u INNER JOIN roles AS r ON u.roleId = r.rid WHERE u.id = ? ";
		return jdbcTemplate.queryForObject(sql, getRowMapper(), new Object[] { id });
	}

	public int edit(Users users) {
		String sql =" UPDATE users AS u SET u.full_name= ? , u.password = ? , u.roleId = ? WHERE u.id = ? ";
		return jdbcTemplate.update(sql, new Object[] { users.getFull_name(), users.getPassword(), 
				users.getRole().getRid() , users.getId()});
	}

	public List<Users> getSearch(String search) {
		String sql="SELECT u.*, r.roleName FROM users AS u INNER JOIN roles AS r ON u.roleId = r.rid WHERE u.username LIKE BINARY ?";
		return jdbcTemplate.query(sql, getRowMapperUser(), new Object[] { "%" + search + "%" });
	}

	public int numberOfItem() {
		String sql ="SELECT COUNT(*) AS count FROM users";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public List<Users> getItemsPagination(int offset) {
		String sql = "SELECT u.*, r.roleName, r.rid FROM users AS u INNER JOIN roles AS r ON u.roleId = r.rid ORDER BY u.id DESC LIMIT ? , ? ";
		return jdbcTemplate.query(sql, getRowMapper(), new Object[] { offset , DefineUtil.NUMBER_PER_PAGE });
	}

	

}
