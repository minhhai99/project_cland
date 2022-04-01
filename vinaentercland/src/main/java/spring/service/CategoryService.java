package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.CategorryDAO;
import spring.model.Category;

@Service
public class CategoryService {

	@Autowired 
	private CategorryDAO categorryDAO;
	
	public List<Category> getItems(){
		List<Category> list = categorryDAO.getItems();
		return list;
	}
//	public List<Category> getAddItem(String  cname){
//		List<Category> list = categorryDAO.getAddItem(cname);
//		return list;
//	}
}
