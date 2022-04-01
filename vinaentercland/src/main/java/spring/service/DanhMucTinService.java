package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.DanhMucTinDAO;
import spring.model.Category;

@Service
public class DanhMucTinService {
	
	@Autowired
	private DanhMucTinDAO danhMucTinDAO;

	public List<Category> findAll(){
		List<Category> list = danhMucTinDAO.findAll();
		return list;
	}
}
