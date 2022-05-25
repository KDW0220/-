package com.example.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.dao.DoctorDAO;
import com.example.dao.UserDAO;
import com.example.domain.DoctorVO;
import com.example.domain.UserVO;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
	@Autowired
	DoctorDAO dao;

	@Autowired
	BCryptPasswordEncoder passEncoder; // ��й�ȣ ��ȣȭ

	@Resource(name = "uploadPath")
	String path;

	//���̵� �ߺ�üũ �� �α��� 
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public int loginPost(String did, String dpass, HttpSession session) {
		int result = 0; // ������ ����
		DoctorVO vo = dao.read(did);
		if (vo != null) {
			if (passEncoder.matches(dpass, vo.getDpass())) {
				result = 1; // �α��μ���
				session.setAttribute("uid", did);
				session.setAttribute("image", vo.getDimage());
			} else {
				result = 2; // ��й�ȣ ����ġ
			}
		}
		return result;
	}
	
	//�̸���üũ
	@RequestMapping(value = "/mailcheck", method = RequestMethod.POST)
	@ResponseBody
	public int mailcheck(String demail, HttpSession session) {
		int result = 0;
		DoctorVO vo = dao.mailcheck(demail);

		if (vo != null) {
			result = 1;
		}
		return result;
	}
	
	//�г���üũ
	@RequestMapping(value = "/nickcheck", method = RequestMethod.POST)
	@ResponseBody
	public int nickcheck(String dnickname, HttpSession session) {
		int result = 0;
		DoctorVO vo = dao.nickcheck(dnickname);

		if (vo != null) {
			result = 1;
		}
		return result;
	}
	
	//ȸ������ �������� �̵�
	@RequestMapping("/join")
	public String join(Model model){
		model.addAttribute("pageName", "user/doctorjoin.jsp");
		return "/home";
	}
	
	//ȸ������ ������ �Է�
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPost(DoctorVO vo, MultipartHttpServletRequest multi) throws Exception {
			MultipartFile file = multi.getFile("file");
			String password = passEncoder.encode(vo.getDpass());
			vo.setDpass(password);
			if (!file.isEmpty()) {
			String image = "doctor/" + System.currentTimeMillis() + "_" +
			file.getOriginalFilename();
			file.transferTo(new File(path + image));
			vo.setDimage(image);
		 }
		dao.insert(vo);
		return "redirect:/user/login";
	}
	
	// @RequestMapping("/update")
		// public String update(Model model, String uid) {
		// model.addAttribute("vo", dao.read(uid));
		// model.addAttribute("pageName", "user/update.jsp");
		// return "/home";
		// }

		// @RequestMapping(value = "/update", method = RequestMethod.POST)
		// public String updatePost(UserVO vo, MultipartHttpServletRequest multi)
		// throws Exception {
		// MultipartFile file = multi.getFile("file");
		// String password=passEncoder.encode(vo.getUpass());
		// vo.setUpass(password);
		// if (!file.isEmpty()) {
		// new File(path + vo.getImage()).delete();
		// String image = "photo/" + System.currentTimeMillis() + "_" +
		// file.getOriginalFilename();
		// file.transferTo(new File(path + image));
		// vo.setImage(image);
		// }
		// dao.update(vo);
		// return "redirect:/user/list";
		// }
		
}
