package spring.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.dao.CategorryDAO;
import spring.dao.LandDAO;
import spring.model.Category;
import spring.service.CategoryService;

@Controller
@RequestMapping(value = "admin/cat", produces = "application/x-www-form-urlencoded;charset=UTF-8")
public class AdminCatController {

	@Autowired 
	private CategoryService categoryService;
	@Autowired
	private CategorryDAO categorryDAO;
	
	@Autowired
	private LandDAO landDAO;
	@GetMapping("index")
	public String index(Model model) {
		List<Category> listCat = categoryService.getItems();
		model.addAttribute("listCat", listCat);
		return "cland.admin.cat.index";
	}
	
	@GetMapping("add")
	public String add() {
		
		return "cland.admin.cat.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("category") Category category, BindingResult br,
			RedirectAttributes ra) {
		if(br.hasErrors()) {
			return "cland.admin.cat.add";
		}
		if(categorryDAO.add(category) > 0) {
			ra.addFlashAttribute("msg", "Thêm danh mục thành công");
			return "redirect:/admin/cat/index";
		}else {
			ra.addFlashAttribute("msg", "Có lỗi xảy ra!");
			return "redirect:/admin/cat/index";
		}
	}
	
	@GetMapping("del/{cid}")
	public String del(@PathVariable int cid, RedirectAttributes ra) {
		if(categorryDAO.delete(cid) > 0) {
				ra.addFlashAttribute("msg", "xoá thành công!");
				return "redirect:/admin/cat/index";
//			}else {
//				ra.addFlashAttribute("msg", "Có lỗi xảy ra khi xoá!");
//				return "redirect:/admin/cat/index";
//			}
			
		}else {
			ra.addFlashAttribute("msg", "Có lỗi xảy ra khi xoá!");
			return "redirect:/admin/cat/index";
		}
		
	}
	
	@GetMapping("edit/{cid}")
	public String edit(@PathVariable int cid, Model model) {
		Category category = categorryDAO.getItem(cid);
		model.addAttribute("category", category);
		return "cland.admin.cat.edit";
	}
	
	@PostMapping("edit/{cid}")
	public String edit(@Valid @ModelAttribute("category") Category category, BindingResult br,
			RedirectAttributes ra) {
		if(br.hasErrors()) {
			return "cland.admin.cat.edit";
		}
		if(categorryDAO.edit(category) > 0) {
			ra.addFlashAttribute("msg", "Sửa thành công!");
			return "redirect:/admin/cat/index";
		}else {
			ra.addFlashAttribute("msg", "Có lỗi khi sửa!");
			return "redirect:/admin/cat/index";
		}
	}
	
	@GetMapping("search")
	public String search(@RequestParam("search") String search, Model model) {
		System.out.println("Tìm kiếm lấy được: "+ search);
		List<Category> listSearch = categorryDAO.getSearch(search);
		model.addAttribute("listSearch", listSearch);
		return "cland.admin.cat.index";
	}
	
}
