package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.ContactDAO;
import spring.model.Contact;

@Service
public class ContactService {

	@Autowired
	private ContactDAO contactDAO;
	
	public List<Contact> getItems(){
		List<Contact> list = contactDAO.getItems();
		return list;
	}
}
