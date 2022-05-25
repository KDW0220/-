package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.CartDAO;
import com.example.domain.BuyVO;
import com.example.domain.CartVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ShopVO;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	CartDAO dao;
	
	@Resource(name="uploadPath")
	String path;
	
	// 장바구니삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(ShopVO vo, Criteria cri) {
		dao.delete(vo.getId());
		return "redirect:/cart/list";
	}
	
	@RequestMapping("/list.json")
	@ResponseBody
	public Map<String,Object> listJSON(Criteria cri,String uid, Model model){
		Map<String,Object> map=new HashMap<>();
		
		cri.setPerPageNum(4);
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(dao.total());
		
		map.put("pm", pm);
		map.put("list", dao.list(cri,uid));
		map.put("sum", dao.sum(uid));
		
		return map;
	}
	
	// 게시글 읽기화면
		@RequestMapping("/read")
		public String read(int id, Model model) {
			model.addAttribute("vo", dao.read(id));
			model.addAttribute("pageName", "cart/read.jsp");
			return "/home";
		}
	
	// 상품 목록 페이지
	@RequestMapping("/list")
	public String list(Criteria cri, Model model, String uid) {
		CartVO vo= dao.readuser(uid);
		
		model.addAttribute("vo", vo);
		model.addAttribute("pageName", "cart/list.jsp");
		return "/home";
	}
	
	// 상품 목록 페이지
	@RequestMapping("/buy")
	public String buy(Criteria cri, Model model, String uid) {
		CartVO vo= dao.readuser(uid);
		vo.setSum(dao.sum(uid));
		
		model.addAttribute("vo", vo);
		System.out.println(vo.toString());
		model.addAttribute("pageName", "cart/buy.jsp");
		return "/home";
	}
	
}
