package com.example.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.DogDAO;

@Controller
@RequestMapping("/dog")
public class DogController {
	@Autowired
	DogDAO dao;
	
	@RequestMapping("/list.json")
	@ResponseBody
	public List<Map<String,Object>> listJSON(){
		return dao.list();
	}
	
	@RequestMapping("/list")
	public String list(Model model){
		model.addAttribute("pageName", "dog/list.jsp");
		return "/home";
	}
	
}
