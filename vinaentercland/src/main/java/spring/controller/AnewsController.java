package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.Category;
import spring.model.Lands;
import spring.service.DanhMucTinService;
import spring.service.TinTucService;

@Controller
@RequestMapping("anews")
public class AnewsController {

	@Autowired
	private DanhMucTinService danhMucTinService;
	@Autowired
	private TinTucService tinTucService;
	
	@ModelAttribute
	public void setDanhMucTin(Model model) {
		List<Category> lisDanhMucTin = danhMucTinService.findAll();
		model.addAttribute("lisDanhMucTin", lisDanhMucTin);
	}
	
	@GetMapping("index")
	public String index(Model model) {
		List<Lands> listTinTuc = tinTucService.findAll();
		model.addAttribute("listTinTuc", listTinTuc);
		return "anews.index";
	}
	@GetMapping("cat/{id}")
	public String cat(@PathVariable int id, Model model) {
		List<Lands> listTinTuc = tinTucService.findByCatId(id);
		model.addAttribute("listTinTuc", listTinTuc);
		return "anews.cat";
	}
	@GetMapping("detail/{name}/{id}")
	public String detail(@PathVariable int id, Model  model) {
		Lands tintuc = tinTucService.findById(id);
		model.addAttribute("tintuc", tintuc);
		return "anews.detail";
	}
	@GetMapping("add")
	public String add() {
		return "anews.add";
	}
}
