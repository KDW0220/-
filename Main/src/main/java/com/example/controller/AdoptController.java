package com.example.controller;

import java.io.File;
import java.util.HashMap;

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

import com.example.dao.AdoptDAO;
import com.example.domain.AdoptVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;

@Controller
@RequestMapping("/adopt")
public class AdoptController {
	@Resource(name="uploadPath")
	String path;
	
	@Autowired
	AdoptDAO dao;

	// 개시굴 목록 페이지
	@RequestMapping("/list")
	public String list(Criteria cri, Model model) {
		model.addAttribute("pageName", "adopt/list.jsp");
		return "/home";
	}

	// 게시글목록 JSON 데이터생성
	@RequestMapping("/list.json")
	@ResponseBody
	public HashMap<String, Object> list(Model model, Criteria cri) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		cri.setPerPageNum(5);

		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(dao.totalCount(cri));

		map.put("count", dao.count(cri));
		map.put("pm", pm); // 페이지정보
		map.put("list", dao.list(cri)); // 목록데이터

		return map;
	}

	// 게시글 입력화면
	@RequestMapping("/insert")
	public String insert(Model model) {
		model.addAttribute("pageName", "adopt/insert.jsp");
		return "/home";
	}

	// 게시글 입력
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPost(AdoptVO vo,MultipartHttpServletRequest multi) throws Exception{
		//파일업로드
		MultipartFile file=multi.getFile("file");
		String image= "adopt/" + System.currentTimeMillis()+"_"+file.getOriginalFilename();
		file.transferTo(new File(path + image));
		vo.setImage(image);
		dao.insert(vo);
		return "redirect:/adopt/list";
	}

	// 게시글 읽기화면
	@RequestMapping("/read")
	public String read(int ano, Model model) {
		model.addAttribute("vo", dao.read(ano));
		model.addAttribute("pageName", "adopt/read.jsp");
		return "/home";
	}

	// 게시글수정
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updatePost(AdoptVO vo, MultipartHttpServletRequest multi) throws Exception{
		System.out.println(vo.toString());
		//파일업로드
		MultipartFile file=multi.getFile("file");
		if(!file.isEmpty()){
			new File(path + vo.getImage()).delete(); //예전이미지삭제
			String image= "adopt/" + System.currentTimeMillis()+"_"+file.getOriginalFilename();
			file.transferTo(new File(path + image));
			vo.setImage(image);
		}
		dao.update(vo);
		return "redirect:/adopt/list";
	}

	//게시글수정 이동
	@RequestMapping("/update")
	   public String update(Model model, int ano){
	      model.addAttribute("vo", dao.read(ano));
	      model.addAttribute("pageName", "adopt/update.jsp");
	      return "/home";
	   }
	
	// 게시글삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(AdoptVO vo, Criteria cri, RedirectAttributes rttr) {
		rttr.addAttribute("page", cri.getPage());
		dao.delete(vo.getAno());
		return "redirect:/adopt/list";
	}
}
