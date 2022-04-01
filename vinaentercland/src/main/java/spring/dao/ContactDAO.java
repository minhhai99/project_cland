package spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import spring.model.Contact;
import string.util.DefineUtil;

@Repository
public class ContactDAO {

//	private static final String INSERT_ONE = "INSERT INTO vnecontact(fullname , email, subject, content) VALUES (?, ? , ? , ?)";
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Contact> getItems(){
		String sql ="SELECT * FROM vnecontact ORDER BY vid  DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Contact>(Contact.class));
	}

	public int getAddContact(Contact contact) {
		String sql ="INSERT INTO vnecontact(fullname , email, subject, content) VALUES (?, ? , ? , ?)";
		return jdbcTemplate.update(sql, new Object[] { contact.getFullname(), 
				contact.getEmail(), contact.getSubject(), contact.getContent()});
	}

	public int delete(int vid) {
		String sql="DELETE FROM vnecontact WHERE vid = ? ";
		return jdbcTemplate.update(sql, new Object[] { vid });
	}

	public int getItemsCount() {
		String sql="SELECT COUNT(*) AS count FROM vnecontact ";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public List<Contact> getItemsPagination(int offset) {
		String sql ="SELECT * FROM vnecontact ORDER BY vid  DESC LIMIT ?, ?";
		return jdbcTemplate.query(sql, new Object[] { offset, DefineUtil.NUMBER_PER_PAGE}, new RowMapper() {

			@Override
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				Contact contact = new Contact(rs.getInt("vid"), rs.getString("fullname"), rs.getString("email"), rs.getString("subject"), rs.getString("content"));
				return contact;
			}
		});
	}
}
