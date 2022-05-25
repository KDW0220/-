package com.example.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.dao.SlickDAO;

@RestController
@RequestMapping("/slick")
public class SlickController {
	@Autowired
	SlickDAO dao;
	
	@RequestMapping("/list.json")
	public List<Map<String, Object>> list(){
		return dao.list();
	}
}
