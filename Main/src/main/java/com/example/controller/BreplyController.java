package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.dao.BreplyDAO;
import com.example.domain.BreplyVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;

@RestController
@RequestMapping("/breply")
public class BreplyController {
	@Autowired
	BreplyDAO brdao;
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public void insert(BreplyVO vo){
		brdao.insert(vo);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public void update(BreplyVO vo){
		brdao.update(vo);
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public void delete(int brno){
		brdao.delete(brno);
	}
	
	@RequestMapping("/list.json")
	public HashMap<String, Object> list(int bno, Criteria cri){
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		cri.setPerPageNum(6);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(brdao.count(bno));
		
		map.put("pm", pm);
		map.put("brlist", brdao.list(cri, bno));
		return map;
	}

}
