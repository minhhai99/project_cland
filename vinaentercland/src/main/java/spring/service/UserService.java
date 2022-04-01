package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.UserDAO;
import spring.model.Users;

@Service
public class UserService {

	@Autowired
	private UserDAO userDAO;
	
	public List<Users> getItems(){
		List<Users> list = userDAO.getItems();
		return list;
	}

}
