package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.AqnaVO;
import com.example.domain.Criteria;


@Repository
public class AqnaDAOImpl implements AqnaDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.AqnaMapper";
	
		
	@Override
	public List<AqnaVO> list(Criteria cri,int qno) {
		HashMap<String,Object> map = new HashMap<>();
		map.put("cri", cri);
		map.put("qno", qno);
		return session.selectList(namespace + ".list", map);
	}

	@Override
	public void insert(AqnaVO vo) {
		session.insert(namespace + ".insert", vo);
		
	}

	@Override
	public void delete(int ano) {
		session.delete(namespace + ".delete", ano);
		
	}

	@Override
	public void status(int qno) {
		session.update(namespace + ".status", qno);
	}

}
