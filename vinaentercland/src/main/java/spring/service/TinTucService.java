package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.TinTucDAO;
import spring.model.Lands;

@Service
public class TinTucService {

	@Autowired
	private TinTucDAO tinTucDAO;
	
	public List<Lands> findAll(){
		List<Lands> list = tinTucDAO.findAll();
		return list;
	}
	
	public List<Lands> findByCatId(int id_danhmuctin){
		List<Lands> list = tinTucDAO.findByCatId(id_danhmuctin);
		return list;
	}
	
	public Lands findById(int id_tintuc) {
		Lands tinTuc = tinTucDAO.findById(id_tintuc);
		return tinTuc;
	}
}
