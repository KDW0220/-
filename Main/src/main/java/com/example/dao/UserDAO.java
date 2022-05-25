package com.example.dao;

import java.util.List;

import com.example.domain.BuyVO;
import com.example.domain.UserVO;

public interface UserDAO {
	public List<UserVO> list();

	public UserVO read(String uid);

	public void insert(UserVO vo);

	public void update(UserVO vo);

	public UserVO idcheck(String uid);

	public UserVO mailcheck(String uemail);

	public UserVO nickcheck(String unickname);

	public List<BuyVO> trade(String uid);

	public List<BuyVO> alltrade(String uid);

	public int count(String uid);

	public UserVO idsearch(String uemail, String uid);

	public void newpass(String uid, String upass);

}
