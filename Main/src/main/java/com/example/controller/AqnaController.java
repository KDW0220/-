package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dao.AqnaDAO;
import com.example.domain.AqnaVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.QnaVO;



@RestController
@RequestMapping("/aqna")
public class AqnaController {
	@Autowired
	AqnaDAO adao;
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(AqnaVO vo){
		adao.insert(vo);
		adao.status(vo.getQno());
		
		System.out.println(vo.toString());
		
		return "redirect:/list";
	}
	
//	@RequestMapping(value = "/delete", method = RequestMethod.GET)
//	public String delete(AqnaVO vo, int ano) {
//		adao.delete(vo.getAno());
//		return "redirect:/";
//	} 
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public void delete(int ano){
		adao.delete(ano);
	}
	
	@RequestMapping("/list.json")
	@ResponseBody
	public Map<String,Object> listJSON(Criteria cri, int qno){
		Map<String,Object> map=new HashMap<>();
		cri.setPerPageNum(4);
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(3);
		pm.setTotalCount(51);
		
		
		map.put("pm", pm);
		map.put("list", adao.list(cri, qno));
		
		return map;
	}
	
	
}
