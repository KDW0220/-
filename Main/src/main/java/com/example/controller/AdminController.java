package com.example.controller;

import java.io.File;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.controller.AdminController;
import com.example.dao.AdminDAO;
import com.example.domain.BoardVO;
import com.example.domain.BuyVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ShopVO;
import com.example.domain.UserVO;



@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource(name = "uploadPath")
	String path;
	
	@Autowired
	AdminDAO dao;
	


	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	
	//관리자화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		logger.info("get index"); 
	}
	
	
	//상품등록
	@RequestMapping(value="/shop/insert", method=RequestMethod.POST)
	public String AdminInsertPost(ShopVO vo, MultipartHttpServletRequest multi) throws Exception, IOException{
		MultipartFile file=multi.getFile("file");
		//파일업로드
		String image="shop/" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
		file.transferTo(new File(path + image));
		vo.setImage(image);
		
		//데이터 저장
		dao.admininsert(vo);
		return "redirect:/shop/list";
	}
	
	//상품등록화면	
	@RequestMapping(value = "/shop/insert", method = RequestMethod.GET)
	public void getInsert() throws Exception {
		logger.info("get shop insert"); 
	}
	
	//상품 목록
	@RequestMapping(value = "/shop/list", method = RequestMethod.GET)
	public void getShopList(Model model) throws Exception {
		logger.info("get shop list");
		
	}
	
	@RequestMapping("/list.json")
	@ResponseBody
	public Map<String, Object> listJSON(Criteria cri) {
		Map<String, Object> map = new HashMap<>();
		cri.setPerPageNum(5);

		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(dao.total());

		map.put("pm", pm);
		map.put("shoplist", dao.list(cri));
		return map;
	}
	
	//상품등록
	@RequestMapping(value="/shop/update", method=RequestMethod.POST)
	public String AdminUpdatePost(ShopVO vo, MultipartHttpServletRequest multi) throws Exception, IOException{
		MultipartFile file=multi.getFile("file");
		
		//파일업로드
		if(!file.isEmpty()){
			new File(path + vo.getImage()).delete(); //기존이미지 삭제
			String image="shop/" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
			file.transferTo(new File(path + image));
			vo.setImage(image);
		}		
		
		//데이터 수정
		dao.adminupdate(vo);
		return "redirect:/admin/shop/list";
	}
	
	//상품 수정
	@RequestMapping(value = "/shop/update", method = RequestMethod.GET)
	public void getShopUpdate(Model model, int id) throws Exception {
		model.addAttribute("vo", dao.read(id));
		model.addAttribute("pageName", "admin/shop/update.jsp");
			logger.info("get shop list");
			
	}
	
	//상품등록화면	
	@RequestMapping(value = "/shop/alltrade", method = RequestMethod.GET)
	public void getAllTrade() throws Exception {
		logger.info("get shop alltrade"); 
	}
	
	
	@RequestMapping("/alltrade.json")
	   @ResponseBody
	   public List<BuyVO> alltradeJSON(){
	      return dao.alltrade();
	}
	
	// 상품 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(int id) {
		dao.delete(id);
		return "redirect:/admin/shop/list";
	}
	
	
	//상품등록화면	
	@RequestMapping(value = "/user/userlist", method = RequestMethod.GET)
	public void getUserlist() throws Exception {
		logger.info("get user userlist"); 
	}
	
	   
	  
	   
	   @RequestMapping("/userlist.json")
		@ResponseBody
		public List<UserVO> userlistJSON() {
			return dao.userlist();
		}
	   
	   @RequestMapping(value="statusUpdate", method=RequestMethod.POST)
	      public String statusUpdate(String uid, int status) {
	         dao.statusUpdate(uid, status);
	         return "redirect:/admin/user/userlist";
	      }

}
