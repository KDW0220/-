package com.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.BuyVO;
import com.example.domain.CartVO;

@Repository
public class BuyDAOImpl implements BuyDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.BuyMapper";
	
	@Override
	public void insert(BuyVO vo) {
		session.insert(namespace + ".insert",vo);
	}

}
