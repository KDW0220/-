package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.dao.ChatDAO;
import com.example.domain.ChatVO;

@RestController
@RequestMapping("/chat")
public class ChatController {
	@Autowired
	ChatDAO dao;
	
	@RequestMapping("/list.json")
	public List<ChatVO> list(){
		return dao.list();
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public void insert(ChatVO vo) {
		dao.insert(vo);
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public void delete(int id) {
		dao.delete(id);
	}
}
