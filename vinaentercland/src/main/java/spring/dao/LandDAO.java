package spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import spring.model.Category;
import spring.model.Lands;
import string.util.DefineUtil;

@Repository
public class LandDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private static final String FIND_ALL = "SELECT l.*, c.cname FROM lands AS l INNER JOIN categories AS c ON l.cid=c.cid "
			+ " ORDER BY lid DESC";

	private RowMapper<Lands> getRowMapper() {
		return new RowMapper<Lands>() {

			@Override
			public Lands mapRow(ResultSet rs, int rowNum) throws SQLException {
				Lands lands = new Lands(rs.getInt("lid"), rs.getString("lname"), rs.getString("description"), rs.getString("detail_text") , rs.getTimestamp("date_create"), 
						rs.getString("picture"),rs.getString("address") , rs.getInt("area"), rs.getInt("count_views"), 
						new Category(rs.getInt("l.cid"), rs.getString("cname")));
				return lands;
			}
		};
	}
	public List<Lands> getItems(){
//		String sql = "SELECT l.*, c.cname FROM lands AS l INNER JOIN categories AS c ON l.cid=c.cid ORDER BY lid DESC";
		return jdbcTemplate.query(FIND_ALL, new RowMapper<Lands>() {

			@Override
			public Lands mapRow(ResultSet rs, int rowNum) throws SQLException {
				Lands lands = new Lands(rs.getInt("lid"), rs.getString("lname"), rs.getString("description"), rs.getString("detail_text") , rs.getTimestamp("date_create"), 
						rs.getString("picture"),rs.getString("address") , rs.getInt("area"), rs.getInt("count_views"), 
						new Category(rs.getInt("l.cid"), rs.getString("cname")));
				return lands;
			}
		});
	}

	public int add(Lands lands) {
		String sql ="INSERT INTO lands(lname, description, detail_text, cid, picture , area, address) VALUES (?, ? , ?, ?, ? , ? ,?)";
		return jdbcTemplate.update(sql, new Object[] { 
				lands.getLname(), lands.getDescription(), lands.getDetail_text(), lands.getCategory().getCid(), 
				lands.getPicture(), lands.getArea(), lands.getAddress()
		});
	}

	public Lands getItem(int lid) {
		String sql="SELECT l.*, c.cname FROM lands AS l INNER JOIN categories AS c ON l.cid=c.cid WHERE lid = ?";
		return jdbcTemplate.queryForObject(sql ,new Object[] { lid }, getRowMapper());
	}
	public int del(int lid) {
		String sql ="DELETE FROM lands WHERE lid = ?";
		return jdbcTemplate.update(sql,new Object[] {lid});
	}
	public int edit(Lands lands) {
		String sql = "UPDATE lands AS l SET lname= ?, description= ? , detail_text= ? , "
				+ " l.cid= ?, picture= ?, area= ?, address= ? WHERE lid = ?";
		return jdbcTemplate.update(sql, new Object[] {lands.getLname(), lands.getDescription(), lands.getDetail_text(), lands.getCategory().getCid(), lands.getPicture(), lands.getArea(), lands.getAddress(), lands.getLid()});
	}
	public List<Lands> getSearch(String search) {
		String sql="SELECT l.*, c.cname FROM lands AS l INNER JOIN categories AS c ON l.cid=c.cid WHERE l.lname LIKE BINARY ? ";
		return jdbcTemplate.query(sql, getRowMapper(), new Object[] { "%" + search + "%"});
	}
	public int getCount() {
		String sql="SELECT COUNT(*) AS count FROM lands";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public int countItemByCategoryId(int id) {
		String sql="SELECT COUNT(*) FROM lands WHERE cid = ? ";
		return jdbcTemplate.queryForObject(sql, Integer.class ,new Object[] { id });
	}
	public List<Lands> getItemsPagination(int offset) {
		String sql = "SELECT l.*, c.cname FROM lands AS l INNER JOIN categories AS c ON l.cid=c.cid ORDER BY date_create DESC LIMIT ?, ? ";
		return jdbcTemplate.query(sql, new Object[] { offset, DefineUtil.NUMBER_PER_PAGE } , getRowMapper());
	}
	public List<Lands> getItemsByCategoryId(int id) {
		String sql ="SELECT l.*, c.cname FROM lands AS l INNER JOIN categories AS c ON l.cid=c.cid WHERE c.cid = ?";
		return jdbcTemplate.query(sql, getRowMapper(), new Object[] { id });
	}
	public List<Lands> getRelatedLand(Lands land, int max) {
		String sql = "SELECT l.*, c.cname FROM lands AS l INNER JOIN categories AS c ON l.cid=c.cid WHERE c.cid = ? AND l.lid != ? LIMIT ?";
		return jdbcTemplate.query(sql, getRowMapper(), new Object[] { land.getCategory().getCid(), land.getLid(), max });
	}
	public List<Lands> getItemsCountView(int view) {
		String sql="SELECT l.*, c.cname FROM lands AS l INNER JOIN categories AS c ON l.cid=c.cid ORDER BY count_views DESC LIMIT ?";
		return jdbcTemplate.query(sql, getRowMapper(), new Object[] { view });
	}
	public List<Lands> getItemByCountCategory() {
		String sql="SELECT l.*, c.cname, COUNT(l.cid) AS count FROM lands AS l INNER JOIN categories AS c ON l.cid=c.cid GROUP BY l.cid";
		return jdbcTemplate.query(sql, new RowMapper<Lands>() {

			@Override
			public Lands mapRow(ResultSet rs, int rowNum) throws SQLException {
				Lands lands = new Lands(rs.getInt("lid"), rs.getString("lname"), rs.getString("description"), rs.getString("detail_text") , rs.getTimestamp("date_create"), 
						rs.getString("picture"),rs.getString("address") , rs.getInt("area"), rs.getInt("count_views"),  
						new Category(rs.getInt("l.cid"), rs.getString("cname")), rs.getInt("count"));
				return lands;
			}
		});
	}
	public List<Lands> getItemsCountCid(){
		String sql="SELECT COUNT(cid) AS count FROM lands GROUP BY cid";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Lands>(Lands.class));
	}
	
	public void increaseView(int id) {
		String sql="UPDATE `lands` SET count_views = count_views + 1 WHERE lid = ?";
		jdbcTemplate.update(sql, new Object[] { id });
		
	}
	public Lands getIdBefor(int id) {
		String sql ="SELECT l.*, c.cname FROM lands AS l INNER JOIN categories AS c ON l.cid=c.cid "
				+ " WHERE l.lid < ? OR l.lid = 1 ORDER BY l.lid DESC LIMIT 1";
		return jdbcTemplate.queryForObject(sql, getRowMapper(), new Object[] { id });
	}
	public Lands getIdNext(int id) {
		String sql ="SELECT l.*, c.cname FROM lands AS l INNER JOIN categories AS c ON l.cid=c.cid "
				+ " WHERE l.lid > ? OR l.lid = (SELECT MAX(l.lid) FROM lands AS l) ORDER BY l.lid ASC LIMIT 1";
		return jdbcTemplate.queryForObject(sql, getRowMapper(), new Object[] { id });
	}
}
