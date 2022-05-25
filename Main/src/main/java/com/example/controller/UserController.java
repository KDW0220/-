package com.example.controller;

import java.io.File;
import java.util.List;

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

import com.example.dao.UserDAO;
import com.example.domain.BuyVO;
import com.example.domain.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserDAO dao;

	@Autowired
	BCryptPasswordEncoder passEncoder; // 비밀번호 암호화

	@Resource(name = "uploadPath")
	String path;
	
	@RequestMapping("/test")
	public String test(Model model) {
		model.addAttribute("pageName", "user/test.jsp");
		return "/home";
	}

	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("pageName", "user/login.jsp");
		return "/home";
	}
	
	@RequestMapping("/complete")
	public String complete(Model model) {
		model.addAttribute("pageName", "user/complete.jsp");
		return "/home";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public int loginPost(String uid, String unickname, String upass, HttpSession session) {
		int result = 0; // 계정이 없음
		UserVO vo = dao.read(uid);
		if (vo != null) {
			if (upass.equals(vo.getUpass())||passEncoder.matches(upass, vo.getUpass())) {
				result = 1; // 로그인성공
				session.setAttribute("uid", uid);
				session.setAttribute("manager", vo.getManager());
				session.setAttribute("unickname", vo.getUnickname());
				session.setAttribute("image", vo.getUimage());
				System.out.println(upass+vo.getUpass());
			} else {
				System.out.println(upass+vo.getUpass());
				result = 2; // 비밀번호 불일치
			}
		}
		return result;
	}
	
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public int idcheck(String uid, HttpSession session) {
		int result = 0;
		UserVO vo = dao.idcheck(uid);

		if (vo != null) {
			result = 1;
		}
		return result;
	}

	@RequestMapping(value = "/mailcheck", method = RequestMethod.POST)
	@ResponseBody
	public int mailcheck(String uemail, HttpSession session) {
		int result = 0;
		UserVO vo = dao.mailcheck(uemail);

		if (vo != null) {
			result = 1;
		}
		return result;
	}

	@RequestMapping(value = "/nickcheck", method = RequestMethod.POST)
	@ResponseBody
	public int nickcheck(String unickname, HttpSession session) {
		int result = 0;
		UserVO vo = dao.nickcheck(unickname);

		if (vo != null) {
			result = 1;
		}
		return result;
	}

	@RequestMapping("/update")
	public String update(Model model, String uid, HttpSession session) {
		model.addAttribute("vo", dao.read(uid));
		model.addAttribute("pageName", "user/update.jsp");
		return "/home";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePost(UserVO vo, MultipartHttpServletRequest multi) throws Exception {
		MultipartFile file = multi.getFile("file");
		if (!file.isEmpty()) {
			new File(path + vo.getUimage()).delete();
			String image = "user/" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
			file.transferTo(new File(path + image));
			vo.setUimage(image);
		}
		dao.update(vo);
		return "redirect:/user/update";
	}

	@RequestMapping("/join_sel")
	public String join_sel(Model model) {
		model.addAttribute("pageName", "user/join_sel.jsp");
		return "/home";
	}

	@RequestMapping("/join")
	public String join(Model model) {
		model.addAttribute("pageName", "user/join.jsp");
		return "/home";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPost(UserVO vo, MultipartHttpServletRequest multi) throws Exception {
		MultipartFile file = multi.getFile("file");
		if (!file.isEmpty()) {
			String image = "user/" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
			file.transferTo(new File(path + image));
			vo.setUimage(image);
		}
		dao.insert(vo);

		return "redirect:/user/complete";
	}
	@RequestMapping("/find_id")
	   public String find_id(Model model) {
	      model.addAttribute("pageName", "user/find_id.jsp");
	      return "/home";
	   }
	   
	   @RequestMapping(value = "/idsearch", method = RequestMethod.POST)
	   @ResponseBody
	   public String idsearch(String uemail, HttpSession session) {
	      UserVO vo = dao.mailcheck(uemail);
	      String fid="";
	      
	      if (vo != null) {
	         session.setAttribute("find_id", vo.getUid());
	         fid=(String)session.getAttribute("find_id");
	      }      
	      return fid;
	   }
	   
	   @RequestMapping(value = "/newpass", method = RequestMethod.POST)
	   @ResponseBody
	   public int newpass(String uid, String uemail, HttpSession session) {
	      int result = 0; //둘다 일치
	      UserVO vo = dao.idsearch(uemail,uid);
	      
	      if (vo == null) {
	         result = 1; //아이디가 없을떄
	      }
	      
	      return result;
	   }
	   
	   
	   @RequestMapping("/newpass")
	   public String newpass(Model model, String uid) {
	      dao.read(uid);
	      model.addAttribute("vo", dao.read(uid));
	      model.addAttribute("pageName", "user/newpass.jsp");

	      return "/home";
	   }
	   
	   @RequestMapping(value="/passUpdate", method=RequestMethod.POST)
	   public String passUpdate(String uid, String upass) {
	      String password = passEncoder.encode(upass);
	      dao.newpass(uid, password);
	      
	      return "redirect:/";
	   }
	   
	   @RequestMapping("/trade.json")
	   @ResponseBody
	   public List<BuyVO> tradeJSON(String uid){
	      return dao.trade(uid);
	   }
	   
	   @RequestMapping("/alltrade.json")
	   @ResponseBody
	   public List<BuyVO> alltradeJSON(String uid){
	      return dao.alltrade(uid);
	   }
	   
	   @RequestMapping("/trade")
	   public String trade(Model model,String uid) {
	      model.addAttribute("vo", dao.read(uid));
	      model.addAttribute("pageName", "user/trade.jsp");
	      return "/home";
	   }
}