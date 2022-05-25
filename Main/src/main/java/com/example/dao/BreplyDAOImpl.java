package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.BreplyVO;
import com.example.domain.Criteria;

@Repository
public class BreplyDAOImpl implements BreplyDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.BreplyMapper";
	
	@Override
	public List<BreplyVO> list(Criteria cri, int bno) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("cri", cri);
		map.put("bno", bno);
		return session.selectList(namespace + ".list", map);
	}

	@Override
	public int count(int bno) {
		return session.selectOne(namespace + ".count", bno);
	}

	@Override
	public void insert(BreplyVO vo) {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public void update(BreplyVO vo) {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int brno) {
		session.delete(namespace + ".delete", brno);
	}

}
