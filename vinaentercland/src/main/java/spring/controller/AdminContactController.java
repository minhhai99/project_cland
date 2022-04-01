package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.dao.ContactDAO;
import spring.model.Contact;
import string.util.DefineUtil;

@Controller
@RequestMapping("admin")
public class AdminContactController {

	@Autowired
	private ContactDAO contactDAO;
	
	@GetMapping("contact")
	public String contact(@RequestParam(name = "page", required = false) Integer page ,Model model) {
		int numberOfItems = contactDAO.getItemsCount();
		// tổng số trang
		int numberOfPages =(int) Math.ceil((float) numberOfItems / DefineUtil.NUMBER_PER_PAGE) ;
		// kiểm tra page
		if(page == null) {
			page = 1;
		}else if(page < 1) {
			return "redirect:/admin/contact";
		}else if(page > numberOfPages) {
			return "redirect:/admin/contact?page=" + numberOfPages;
		}
		// tính offset
		int offset = (page - 1) * DefineUtil.NUMBER_PER_PAGE;
		
		List<Contact> listContact = contactDAO.getItemsPagination(offset);
		model.addAttribute("listContact", listContact);
		model.addAttribute("page", page);
		model.addAttribute("numberOfPages", numberOfPages);
		return "cland.admin.contact";
	}

	@GetMapping("contact/del/{vid}")
	public String delete(@PathVariable("vid") int vid, RedirectAttributes ra) {
		if(contactDAO.delete(vid) > 0) {
			ra.addFlashAttribute("msg", "Xoá liên hệ thành công!");
		}else {
			ra.addFlashAttribute("msg", "Có lỗi xảy ra!");
		}
		return "redirect:/admin/contact";
	}
	
}
