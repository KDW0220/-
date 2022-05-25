package com.example.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dao.QnaDAO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.QnaVO;

@Controller
@RequestMapping("/qna")
public class QnaController {
	@Autowired
	QnaDAO dao;
	
	@Resource(name="uploadPath")
	String path;
	
	@RequestMapping("/read")
	public String read(Model model, int qno){
		model.addAttribute("vo", dao.read(qno));
		model.addAttribute("pageName", "qna/read.jsp");
		return "/home";
	}
	
	@RequestMapping("/list")
	public String list(Model model){
		model.addAttribute("pageName", "qna/list.jsp");
		return "/home";
	}
	
	@RequestMapping("/list.json")
	@ResponseBody
	public Map<String,Object> listJSON(Criteria cri){
		Map<String,Object> map=new HashMap<>();
		cri.setPerPageNum(4);
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(3);
		pm.setTotalCount(51);
		
		
		map.put("pm", pm);
		map.put("list", dao.list(cri));
		
		return map;
	}
	
	@RequestMapping("/insert")
	public String insert(Model model){
		model.addAttribute("pageName", "qna/insert.jsp");
		return "/home";
	}
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insertPost(QnaVO vo, MultipartHttpServletRequest multi) throws Exception{
	    dao.insert(vo);
		
		return "redirect:/";
	}
	
//	// 게시글수정
//		@RequestMapping(value = "/update", method = RequestMethod.POST)
//		public String updatePost(QnaVO vo ) {
//			
//			dao.update(vo);
//			return "redirect:/qna/list";
//		}
//		// 게시글수정 이동
//		@RequestMapping("/update")
//		public String update(Model model, int qno) {
//			model.addAttribute("vo", dao.read(qno));
//			model.addAttribute("pageName", "qna/update.jsp");
//			return "/home";
//		}
		
//		// 게시글삭제
//				@RequestMapping(value = "/delete", method = RequestMethod.GET)
//				public String delete(QnaVO vo, Criteria cri, RedirectAttributes rttr,int qno) {
//					rttr.addAttribute("page", cri.getPage());
//					dao.delete(vo.getQno());
//					return "redirect:/qna/list";
//				} 
//	
}
