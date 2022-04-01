package spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.dao.CategorryDAO;
import spring.dao.LandDAO;
import spring.model.Category;
import spring.model.Lands;
import string.util.DefineUtil;
import string.util.FileNameUtil;

@Controller
@RequestMapping("admin/land")
public class AdminLandController {

	@Autowired
	private LandDAO landDAO;
	@Autowired
	private CategorryDAO categorryDAO;
	@Autowired
	private ServletContext servletContext;
	
	@GetMapping("index")
	public String index(@RequestParam(name = "page", required = false) Integer page ,Model model) {
		// tổng số tin
		int numberOfItems = landDAO.getCount();
		// tổng số trang
		int numberOfPages = (int) Math.ceil((float)numberOfItems / DefineUtil.NUMBER_PER_PAGE);
		// kiểm tra trang
		if(page == null) {
			page = 1;
		}else if(page < 1) {
			return "redirect:/admin/land/index";
		}else if(page > numberOfPages) {
			return "redirect:/admin/land/index?page=" + numberOfPages;
		}
		// tính offset
		int offset = (page - 1) * DefineUtil.NUMBER_PER_PAGE;
		List<Lands> listLands = landDAO.getItemsPagination(offset);
		
		model.addAttribute("listLands", listLands);
		model.addAttribute("page", page);
		model.addAttribute("numberOfPages", numberOfPages);
		return "cland.admin.land.index";
	}
	
	@GetMapping("add")
	public String add( Model model) {
		model.addAttribute("categories", categorryDAO.getItems());
		return "cland.admin.land.add";
	}
	@PostMapping("add")
	public String add(@Valid @ModelAttribute("land") Lands lands, BindingResult br, 
			Model model, @RequestParam("categoryId") int categoryId, 
			@RequestParam("image") CommonsMultipartFile cmf, RedirectAttributes ra, HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		//set lại category để nó ánh xạ đến categoryId trong land
		lands.setCategory(new Category(categoryId, null));
		
		if(br.hasErrors()) {
			model.addAttribute("categories", categorryDAO.getItems());
			return "cland.admin.land.add";
		}
		String filename = FileNameUtil.rename(cmf.getOriginalFilename());  
		lands.setPicture(filename);
		
		if(landDAO.add(lands) > 0) {
			// tạo thư mục chứa ảnh
			String dirPath = servletContext.getRealPath("WEB-INF/files");
			System.out.println(dirPath);
			File  dir = new File(dirPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			//upload ảnh
			String filePath = dirPath + File.separator + filename;
			try {
				cmf.transferTo(new File(filePath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			ra.addFlashAttribute("msg", "thêm tin thành công!");
			return "redirect:/admin/land/index";
		}else {
			ra.addFlashAttribute("msg", "Có lỗi xảy ra khi thêm!");
			return "redirect:/admin/land/index";
		}
	}
	@GetMapping("del/{lid}")
	public String del(@PathVariable("lid") int lid, RedirectAttributes ra) {
		Lands lands = landDAO.getItem(lid);
		
		if(landDAO.del(lid) > 0) {
			File file = new File(servletContext.getRealPath("WEB-INF/files") + File.separator + lands.getPicture() );
			file.delete();
			ra.addFlashAttribute("msg", "xoá tin thành công!");
			return "redirect:/admin/land/index";
		}else {
			ra.addFlashAttribute("msg", "Có lỗi xảy ra!");
			return "redirect:/admin/land/index";
		}
		
	}
	
	@GetMapping("edit/{lid}")
	public String edit( @PathVariable("lid") int lid, Model model) {
		Lands land = landDAO.getItem(lid);
		model.addAttribute("categories", categorryDAO.getItems());
		model.addAttribute("land", land);
		return "cland.admin.land.edit";
	}
	@PostMapping("edit/{lid}")
	public String edit(@Valid @ModelAttribute("land") Lands lands , BindingResult br, Model model, 
			@RequestParam("categoryId") int categoryId, 
			@RequestParam("image") CommonsMultipartFile cmf, RedirectAttributes ra) {
		
		lands.setCategory(new Category(categoryId, null));
		Lands oldLand = landDAO.getItem(lands.getLid());
		if(br.hasErrors()) {
			lands.setPicture(oldLand.getPicture());
			model.addAttribute("categories", categorryDAO.getItems());
			return "cland.admin.land.edit";
		}
		
		String filename = "";
		if("".equals(cmf.getOriginalFilename())) {
			lands.setPicture(oldLand.getPicture());
		}else {
			filename = FileNameUtil.rename(cmf.getOriginalFilename());
			lands.setPicture(filename);
		}
		
		if(landDAO.edit(lands) > 0) {
			if(!"".equals(filename)) {
				String dirPath = servletContext.getRealPath("WEB-INF/files");
				File file = new File(dirPath);
				if(!file.exists()) {
					file.mkdirs();
				}
				File oldFile = new File(dirPath + File.separator + oldLand.getPicture());
				oldFile.delete();
				// upoad ảnh mới
				try {
					cmf.transferTo(new File(dirPath + File.separator + filename));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			ra.addFlashAttribute("msg", "Sửa tin thành công!");
			return "redirect:/admin/land/index";
		}else {
			ra.addFlashAttribute("msg", "Có lỗi khi sửa tin!");
			return "redirect:/admin/land/index";
		}
	}
	@GetMapping("search")
	public String search(@RequestParam("search") String search, Model model) {
		System.out.println("tìm kiếm: "+search);
		List<Lands> landSearch = landDAO.getSearch(search);
		model.addAttribute("landSearch", landSearch);
		return "cland.admin.land.index";
	}
}
