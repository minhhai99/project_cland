package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import spring.dao.CategorryDAO;
import spring.dao.LandDAO;
import spring.dao.UserDAO;

@Controller

public class AdminIndexController {

	@Autowired
	private CategorryDAO categorryDAO;
	@Autowired
	private LandDAO landDAO;
	@Autowired
	private UserDAO userDAO;
	
	@GetMapping("admincp")
	public String index(Model model) {
		model.addAttribute("countCat", categorryDAO.getCount());
		model.addAttribute("countLand", landDAO.getCount());
		model.addAttribute("countUser", userDAO.numberOfItem());
		return "cland.admin.index.index";
	}
	
}
