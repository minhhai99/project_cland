package spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.dao.CategorryDAO;
import spring.dao.ContactDAO;
import spring.dao.LandDAO;
import spring.model.Category;
import spring.model.Contact;
import spring.model.Lands;
import string.util.DefineUtil;

@Controller
public class PublicController {
	
	@Autowired
	private CategorryDAO categorryDAO;
	@Autowired
	private LandDAO landDAO;
	@Autowired
	private ContactDAO contactDAO;
	@Autowired
	JavaMailSender mailSender;
	
	@ModelAttribute
	void commonObject(Model model) {
		model.addAttribute("categories", categorryDAO.getItems());
		model.addAttribute("landDAO", landDAO);
		List<Lands> landViews = landDAO.getItemsCountView(5);
		model.addAttribute("landViews", landViews);
		model.addAttribute("landItem", landDAO.getItems());
		List<Lands> landHot = landDAO.getItemByCountCategory();
		model.addAttribute("landHot", landHot);
	}
	
	@GetMapping("search")
	public String search(@RequestParam("search") String search, Model model, ServletResponse response) {
		
		System.out.println("tìm kiếm: "+search);
		List<Lands> landSearch = landDAO.getSearch(search);
//		model.addAttribute("landSearch", landSearch);
		model.addAttribute("search", search);
		HttpServletResponse rp = (HttpServletResponse)response;
		for (  Lands o : landSearch) {
			try {
				rp.getWriter().print("<div class=\"clearfix single_content\">\r\n"
						+ "							<div class=\"clearfix post_date floatleft\">\r\n"
						+ "								<div class=\"date\">\r\n"
						+ "									<h3>27</h3>\r\n"
						+ "									<p>Tháng 3</p>\r\n"
						+ "								</div>\r\n"
						+ "							</div>\r\n"
						+ "							<div class=\"clearfix post_detail\">\r\n"
						+ "								<h2><a href=\"\">"+o.getLname() +"</a></h2>\r\n"
						+ "								<div class=\"clearfix post-meta\">\r\n"
						+ "									<p><span><i class=\"fa fa-clock-o\"></i> Địa chỉ: "+o.getAddress() +"</span> <span><i class=\"fa fa-folder\"></i> Diện tích: "+o.getArea()+"m2</span></p>\r\n"
						+ "								</div>\r\n"
						+ "								<div class=\"clearfix post_excerpt\">\r\n"
						+ "									<img src=\"images/thumb.png\" alt=\"\"/>\r\n"
						+ "									<p>"+o.getDetail_text()+" </p>\r\n"
						+ "								</div>\r\n"
						+ "								<a href=\"\">Đọc thêm</a>\r\n"
						+ "							</div>\r\n"
						+ "						</div>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "cland.public.index";
	}
	@GetMapping("index")
	public String index(@RequestParam(name = "page", required = false) Integer page, Model model) {
		
		int numberOfItems = landDAO.getCount();
		int numberOfPages = (int) Math.ceil((float) numberOfItems / DefineUtil.NUMBER_PER_PAGE);
		if(page == null) {
			page = 1;
		}else if(page < 1) {
			return "redirect:/index?page=1";
		}else if(page > numberOfPages){
			return "redirect:/index?page=" + numberOfPages;
		}
		
		int offset = (page - 1) * DefineUtil.NUMBER_PER_PAGE;
		
		List<Lands> lands = landDAO.getItemsPagination(offset);
		model.addAttribute("lands", lands);
		model.addAttribute("page", page);
		model.addAttribute("numberOfPages", numberOfPages);
		return "cland.public.index";
	}
	@GetMapping("danh-muc/{catName}-{id}")
	public String cat(@PathVariable("id") int id, Model model) {
		
		List<Lands> lands = landDAO.getItemsByCategoryId(id);
		Category category = categorryDAO.getItem(id);
		model.addAttribute("lands", lands);
		model.addAttribute("category", category);
		// bài trước
		Category categoryDef = categorryDAO.getIdCountinue(id);
		model.addAttribute("categoryDef", categoryDef);
		// bài kế
		Category categoryNext = categorryDAO.getIdNext(id);
		model.addAttribute("categoryNext", categoryNext);
		return "cland.public.cat";
	}
	@GetMapping("{landName}-{id}.html")
	public String single(@PathVariable("id") int id, Model model, HttpServletRequest request) {
		Lands land = landDAO.getItem(id);
		// tăng view
		HttpSession session = request.getSession();
		String hasVisited =(String) session.getAttribute("hasVisited: "+ id);
		if(hasVisited == null) {
			session.setAttribute("hasVisited: "+ id, "yes");
			session.setMaxInactiveInterval(60);
			landDAO.increaseView(id);
		}
		// bài viết trước
		Lands landIdBefor = landDAO.getIdBefor(id);
		model.addAttribute("landIdBefor", landIdBefor);
		// bài viết kế tiếp
				Lands landIdNext = landDAO.getIdNext(id);
				model.addAttribute("landIdNext", landIdNext);
		// bài viết liên quan
		List<Lands> lands = landDAO.getRelatedLand(land, 3);
		model.addAttribute("land", land);
		model.addAttribute("lands", lands);
		return "cland.public.single";
	}
	@GetMapping("lien-he")
	public String contact() {
		return "cland.public.contact";
	}
	@PostMapping("lien-he")
	public String contact(@Valid @ModelAttribute("contact") Contact contact, BindingResult rd, 
			RedirectAttributes ra, Model model, @RequestParam("email") String email, 
			@RequestParam("subject") String subject, @RequestParam("content") String content) {
		if(rd.hasErrors()) {
			return "cland.public.contact";
		}
		SimpleMailMessage smm = new SimpleMailMessage();
		smm.setTo(email);
		smm.setSubject(subject);
		smm.setText(content);
		if(contactDAO.getAddContact(contact) > 0) {
			ra.addFlashAttribute("msg", "Thêm liên hệ thành công!");
		}else {
			ra.addFlashAttribute("msg", "Có lỗi xảy ra!");
		}
		mailSender.send(smm);
		return "redirect:/lien-he";
	}
	
}
