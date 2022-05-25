package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.dao.PetDAO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.PetVO;

@Controller
@RequestMapping("/pet")
public class PetController {
	@Autowired
	PetDAO dao;
	
	@RequestMapping("/list")
	public String list(Model model){
		model.addAttribute("pageName", "pet/list.jsp");
		return "/home";
	}
	
	@RequestMapping("/read")
	public String read(Model model,int dno){
		model.addAttribute("pageName", "pet/read.jsp");
		model.addAttribute("vo",dao.read(dno));
		return "/home";
	}
	
	@RequestMapping("/list.json")
	@ResponseBody
	public Map<String,Object> listJSON(Criteria cri){
		Map<String,Object> map=new HashMap<>();
		cri.setPerPageNum(12);
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(dao.total(cri));
		
		map.put("pm", pm);
		map.put("list", dao.list(cri));
		return map;
	}
}
