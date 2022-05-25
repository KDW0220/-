package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.HospitalDAO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;

@Controller
@RequestMapping("hospital")
public class HospitalController {
	@Autowired
	HospitalDAO dao;

	// 병원 목록
	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("pageName", "hospital/list.jsp");
		return "/home";
	}

	// 병원 목록 JSON
	@RequestMapping("/list.json")
	@ResponseBody
	public HashMap<String, Object> listJSON(Criteria cri) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		cri.setPerPageNum(5);
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(dao.count(cri));
		
		map.put("pm", pm);
		map.put("list", dao.list(cri));
		return map;
	}

	// 병원 정보 페이지
	@RequestMapping("/info")
	public String info(Model model) {
		model.addAttribute("pageName", "hospital/info.jsp");
		return "/home";
	}
}
