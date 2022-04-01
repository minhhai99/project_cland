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

import spring.dao.RoleDAO;
import spring.dao.UserDAO;
import spring.model.Roles;
import spring.model.Users;
import string.util.DefineUtil;

@Controller
@RequestMapping("admin/user")
public class AdminUsersController {

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private RoleDAO roleDAO;
	
	@GetMapping("index")
	public String index(@RequestParam(name = "page", required = false) Integer page,Model model) {
		
//		Tổng số tin
		int numberOfItem = userDAO.numberOfItem();
		//tổng số trang
		int numberOfPage = (int) Math.ceil((float) numberOfItem / DefineUtil.NUMBER_PER_PAGE);
		if(page == null) {
			page = 1;
		}else if(page < 1) {
			return "redirect:/admin/user/index";
		}else if(page > numberOfPage) {
			return "redirect:/admin/user/index?page=" + numberOfPage;
		}
		
		// tính offset
		int offset = (page - 1) * DefineUtil.NUMBER_PER_PAGE;
		
		List<Users> listUser = userDAO.getItemsPagination(offset);
		
		model.addAttribute("listUser", listUser);
		model.addAttribute("page", page);
		model.addAttribute("numberOfPage", numberOfPage);
		return "cland.admin.user.index";
	}
	@GetMapping("add")
	public String add(Model model) {
		model.addAttribute("roles", roleDAO.getItems());
		return "cland.admin.user.add";
	}
	
	@PostMapping("add")
	public String add(@Valid @ModelAttribute("user") Users users, BindingResult br,
			 RedirectAttributes ra, @RequestParam("roleId") int roleId, Model model) {
		users.setRole(new Roles(roleId, null));
		//kiểm tra username đã tồn tại chưa?
		if(userDAO.hasUser(users.getUsername())) {
			br.rejectValue("username", "usernameExisted");
		}
		if(br.hasErrors()) {
			model.addAttribute("roles", roleDAO.getItems());
			return "cland.admin.user.add";
		}
		if(userDAO.add(users) > 0) {
			ra.addFlashAttribute("msg", "Thêm người dùng thành công!");
			return "redirect:/admin/user/index";
		}else {
			ra.addFlashAttribute("msg", "Có lỗi xảy ra khi thêm người dùng!");
			return "redirect:/admin/user/index";
		}
		
	}
	
	@GetMapping("del/{id}")
	public String del(@PathVariable int id,RedirectAttributes ra) {
		if(userDAO.delete(id) > 0) {
			ra.addFlashAttribute("msg", "xoá người dùng thành công!");
			return "redirect:/admin/user/index";
		}else {
			ra.addFlashAttribute("msg", "Có lỗi xảy ra khi xoá!");
			return "redirect:/admin/user/index";
		}
	}
	
	@GetMapping("edit/{id}")
	public String edit(@PathVariable("id") int id, Model model) {
		Users user = userDAO.getItem(id);
		
		model.addAttribute("user", user);
		model.addAttribute("roles", roleDAO.getItems());
		return "cland.admin.user.edit";
	}
	
	@PostMapping("edit/{id}")
	public String edit(@Valid @ModelAttribute("user") Users users, BindingResult br,
			 @RequestParam("roId") int roId, RedirectAttributes ra, Model model) {
		System.out.println("chào mừng bạn Hải: ------------"+ users.getFull_name());
		users.setRole(new Roles(roId, null));
		// lấy lại đối tượng user cũ
		Users oldUser = userDAO.getItem(users.getId());
		
		if("".equals(users.getPassword())) {
			users.setPassword(oldUser.getPassword());
		}
		if(br.hasErrors()) {
			model.addAttribute("roles", roleDAO.getItems());
			return "cland.admin.user.edit";
		}
		
		
		if(userDAO.edit(users) > 0) {
			ra.addFlashAttribute("msg", "sửa người dùng thành công!");
			return "redirect:/admin/user/index";
		}else {
			ra.addFlashAttribute("msg", "Có lỗi xảy ra khi sửa!");
			return "redirect:/admin/user/index";
		}
	}
	
	@GetMapping("search")
	public String search(@RequestParam("search") String search, Model model) {
		System.out.println("KQ tìm kiếm: "+ search);
		List<Users> listSearch = userDAO.getSearch(search);
		model.addAttribute("listSearch", listSearch);
		return "cland.admin.user.index";
	}
}
