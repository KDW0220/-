package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.BuyVO;
import com.example.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	@Autowired
	SqlSession session;
	String namespace = "com.example.mapper.UserMapper";
	
	@Override
	public List<UserVO> list() {
		return session.selectList(namespace + ".list");
	}

	@Override
	public UserVO read(String uid) {
		return session.selectOne(namespace + ".read", uid);
	}

	@Override
	public void insert(UserVO vo) {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public void update(UserVO vo) {
		session.update(namespace + ".update", vo);
	}
	
	@Override
	public UserVO idcheck(String uid) {
		return session.selectOne(namespace + ".id", uid);
	}
	@Override
	public UserVO mailcheck(String uemail) {
		return session.selectOne(namespace + ".mail", uemail);
	}

	@Override
	public UserVO nickcheck(String unickname) {
		return session.selectOne(namespace + ".nick", unickname);
	}

	   @Override
	   public List<BuyVO> trade(String uid) {
	      return session.selectList(namespace + ".trade", uid);
	   }

	   @Override
	   public int count(String uid) {
	      return session.selectOne(namespace + ".count", uid);
	   }

	   @Override
	   public List<BuyVO> alltrade(String uid) {
	      return session.selectList(namespace + ".alltrade", uid);
	   }

	   @Override
	   public UserVO idsearch(String uemail,String uid) {
	      Map<String,Object> map=new HashMap<>();
	      map.put("uemail", uemail);
	      map.put("uid", uid);
	      return session.selectOne(namespace + ".idsearch", map);
	   }

	   @Override
	   public void newpass(String uid, String upass) {
	      Map<String,Object> map = new HashMap<>();
	      map.put("uid", uid);
	      map.put("upass", upass);
	       session.update(namespace + ".newpass", map); 
	   }

}
