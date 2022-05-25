package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.MyPetReplyVO;

@Repository
public class MyPetReplyDAOImpl implements MyPetReplyDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.MyPetReplyMapper";

	@Override
	public List<MyPetReplyVO> list(Criteria cri, int mpno) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("cri", cri);
		map.put("mpno", mpno);
		return session.selectList(namespace + ".list", map);
	}

	@Override
	public int count(int mpno) {
		return session.selectOne(namespace + ".count", mpno);
	}

	@Override
	public void insert(MyPetReplyVO vo) {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public void update(MyPetReplyVO vo) {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int mprno) {
		session.delete(namespace + ".delete", mprno);
	}

}
