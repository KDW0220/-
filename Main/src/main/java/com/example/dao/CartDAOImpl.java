package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.CartVO;
import com.example.domain.Criteria;
import com.example.domain.ShopVO;

@Repository
public class CartDAOImpl implements CartDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.CartMapper";

	@Override
	public CartVO read(int id) {
		return session.selectOne(namespace + ".read",id);
	}

	@Override
	public void insert(CartVO vo) {
		session.insert(namespace + ".insert",vo);
		
	}

	@Override
	public int total() {
		return session.selectOne(namespace + ".total");
	}

	@Override
	public CartVO check(String link) {
		return session.selectOne(namespace + ".check",link);
	}

	@Override
	public List<CartVO> list(Criteria cri,String uid) {
		Map<String ,Object> map=new HashMap<>();
		map.put("cri",cri );
		map.put("uid", uid);
		return session.selectList(namespace + ".list",map);
	}

	@Override
	public void delete(int id) {
		session.delete(namespace + ".delete",id);
		
	}

	@Override
	public CartVO readuser(String uid) {
		return session.selectOne(namespace + ".readuser", uid);
	}

	@Override
	public int sum(String uid) {
		return session.selectOne(namespace + ".sum", uid);
	}
}
