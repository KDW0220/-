package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.HomeDAO;
import com.example.domain.BoardVO;
import com.example.domain.MyPetVO;
import com.example.domain.ShopVO;

@Controller
public class HomeController {
	
	@Autowired
	HomeDAO hdao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("pageName","about.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String chat(Model model) {
		return "test";
	}
	
	@RequestMapping("/shop.json")
	@ResponseBody
	public List<ShopVO> shop() {
		List<ShopVO> list = hdao.product();
		return list;
	}
	
	@RequestMapping("/board.json")
	@ResponseBody
	public List<BoardVO> board() {
		List<BoardVO> list = hdao.community();
		return list;
	}
	
	@RequestMapping("/mypet.json")
	@ResponseBody
	public List<MyPetVO> mypet() {
		List<MyPetVO> list = hdao.mypet();
		return list;
	}
	
}
