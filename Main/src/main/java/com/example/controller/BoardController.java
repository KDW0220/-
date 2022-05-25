package com.example.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dao.BoardDAO;
import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.UserVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Resource(name="uploadPath")
	String path;
	@Autowired
	BoardDAO dao;

	// 게시글 상세정보 페이지
	@RequestMapping("/read")
	public String read(int bno, Model model) {
		dao.point(bno);
		model.addAttribute("pageName", "board/read.jsp");
		model.addAttribute("vo", dao.read(bno));
		return "/home";
	}

	// 게시글 목록 페이지
	@RequestMapping("/list")
	public String list(Model model) {

		model.addAttribute("pageName", "board/list.jsp");
		return "/home";
	}

	// 게시글목록 JSON 데이터생성
	@RequestMapping("/list.json")
	@ResponseBody
	public HashMap<String, Object> listJSON(Criteria cri) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		cri.setPerPageNum(10);

		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(dao.count(cri));

		map.put("pm", pm);// 페이지정보
		map.put("list", dao.list(cri)); // 목록 데이터

		return map;
	}

	// 게시글 입력화면
	@RequestMapping("/insert")
	public String insert(Model model) {
		model.addAttribute("pageName", "board/insert.jsp");
		return "/home";
	}

	// 게시글 입력
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPost(BoardVO vo) {
		dao.insert(vo);
		return "redirect:/board/list";
	}

	// 게시글수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePost(BoardVO vo) {
		System.out.println(vo.toString());
		dao.update(vo);
		return "redirect:/board/list";
	}

	// 게시글수정 이동
	@RequestMapping("/update")
	public String update(Model model, int bno) {
		model.addAttribute("vo", dao.read(bno));
		model.addAttribute("pageName", "board/update.jsp");
		return "/home";
	}
	// 게시글삭제
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		public String delete(BoardVO vo, Criteria cri, RedirectAttributes rttr) {
			rttr.addAttribute("page", cri.getPage());
			dao.delete(vo.getBno());
			return "redirect:/board/list";
		}
}