package com.example.controller;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.SymptomDAO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;

@Controller
@RequestMapping("/symptom")
public class SymptomController {
	@Autowired
	SymptomDAO dao;

	@RequestMapping("/read")
	public String read(int sno, Model model) {
		model.addAttribute("pageName", "symptom/read.jsp");
		model.addAttribute("vo", dao.read(sno));
		return "/home";
	}

	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("pageName", "symptom/list.jsp");
		return "/home";
	}

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
}
