package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.LandDAO;
import spring.model.Lands;

@Service
public class LandService {

	@Autowired
	private LandDAO landDAO;
	
	public List<Lands> getItems(){
		List<Lands> list = landDAO.getItems();
		return list;
	}
}
