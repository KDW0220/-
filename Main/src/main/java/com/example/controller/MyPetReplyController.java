package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.dao.MyPetReplyDAO;
import com.example.domain.Criteria;
import com.example.domain.MyPetReplyVO;
import com.example.domain.PageMaker;

@RestController
@RequestMapping("/mpreply")
public class MyPetReplyController {
	@Autowired
	MyPetReplyDAO mprdao;
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public void insert(MyPetReplyVO vo){
		mprdao.insert(vo);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public void update(MyPetReplyVO vo){
		mprdao.update(vo);
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public void delete(int mprno){
		mprdao.delete(mprno);
	}
	
	@RequestMapping("/list.json")
	public HashMap<String, Object> list(int mpno, Criteria cri){
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		cri.setPerPageNum(6);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(mprdao.count(mpno));
		
		map.put("pm", pm);
		map.put("mprlist", mprdao.list(cri, mpno));
		return map;
	}

}
