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
public class ShopDAOImpl implements ShopDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ShopMapper";
	
	@Override
	public void insert(ShopVO vo) {
		session.insert(namespace + ".insert",vo);
	}

	@Override
	public ShopVO check(String link) {
		return session.selectOne(namespace + ".check",link);
	}

	@Override
	public int total() {
		return session.selectOne(namespace + ".total");
	}

	@Override
	public ShopVO read(int id) {
		return session.selectOne(namespace + ".read",id);
	}

	@Override
	public List<ShopVO> list(Criteria cri) {
		return session.selectList(namespace + ".list",cri);
	}

	@Override
	public void update(ShopVO vo) {
		session.update(namespace + ".delete",vo);
		
	}
	
}
