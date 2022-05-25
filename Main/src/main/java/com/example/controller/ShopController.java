package com.example.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dao.CartDAO;
import com.example.dao.ShopDAO;
import com.example.domain.AdoptVO;
import com.example.domain.BuyVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ShopVO;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	ShopDAO dao;
	CartDAO cdao;

	@Resource(name = "uploadPath")
	String path;

	// 게시글수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePost(ShopVO vo, MultipartHttpServletRequest multi) throws Exception {
		System.out.println(vo.toString());
		// 파일업로드
		MultipartFile file = multi.getFile("file");
		if (!file.isEmpty()) {
			new File(path + vo.getImage()).delete(); // 예전이미지삭제
			String image = "shop/" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
			file.transferTo(new File(path + image));
			vo.setImage(image);
		}
		dao.update(vo);
		return "redirect:/shop/list";
	}

	// 게시글수정 이동
	@RequestMapping("/update")
	public String update(Model model, int id) {
		model.addAttribute("vo", dao.read(id));
		model.addAttribute("pageName", "shop/update.jsp");
		return "/home";
	}

	// 게시글 읽기화면
	@RequestMapping("/read")
	public String read(int id, Model model) {
		model.addAttribute("vo", dao.read(id));
		model.addAttribute("pageName", "shop/read.jsp");
		return "/home";
	}

	// 상품 목록 페이지 이동
	@RequestMapping("/list")
	public String list(Criteria cri, Model model) {
		model.addAttribute("pageName", "shop/list.jsp");
		return "/home";
	}

	@RequestMapping("/list.json")
	@ResponseBody
	public Map<String, Object> listJSON(Criteria cri) {
		Map<String, Object> map = new HashMap<>();
		cri.setPerPageNum(16);

		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(dao.total());

		map.put("pm", pm);
		map.put("list", dao.list(cri));
		return map;
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(ShopVO vo) throws Exception {
		ShopVO checkvo = dao.check(vo.getLink());

		if (checkvo == null) {
			// 이미지 다운로드
			InputStream in = new FileInputStream(path + vo.getImage());

			String image = vo.getImage().substring(vo.getImage().lastIndexOf("/") + 1);
			OutputStream out = new FileOutputStream(path + "cart/" + image);
			FileCopyUtils.copy(in, out);
			// 상품등록
			vo.setImage("cart/" + image);
			dao.insert(vo);
		}
		return "redirect:/shop/list";
	}
	
	@RequestMapping(value = "/buy", method = RequestMethod.POST)
	@ResponseBody
	public String buy(ShopVO vo) throws Exception {
		ShopVO checkvo = dao.check(vo.getLink());
		if (checkvo == null) {
			// 이미지 다운로드
			InputStream in = new FileInputStream(path + vo.getImage());

			String image = vo.getImage().substring(vo.getImage().lastIndexOf("/") + 1);
			OutputStream out = new FileOutputStream(path + "cart/" + image);
			FileCopyUtils.copy(in, out);
			// 상품등록
			vo.setImage("cart/" + image);
			dao.insert(vo);
		}
		return "redirect:/";
	}
}
