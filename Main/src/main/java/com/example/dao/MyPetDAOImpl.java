package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.MyPetVO;

@Repository
public class MyPetDAOImpl implements MyPetDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.MyPetMapper";
	
	@Override
	public List<MyPetVO> list(Criteria cri) {
		return session.selectList(namespace +".list", cri);
	}

	@Override
	public void insert(MyPetVO vo) {
		session.insert(namespace + ".insert", vo);
		
	}

	@Override
	public MyPetVO read(int mpno) {
		return session.selectOne(namespace + ".read", mpno);
	}

	@Override
	public int count(Criteria cri) {
		return session.selectOne(namespace + ".count", cri);
	}

	@Override
	public void update(MyPetVO vo) {
		session.update(namespace + ".update", vo);
		
	}

	@Override
	public void delete(int mpno) {
		session.delete(namespace + ".delete", mpno);
		
	}

	@Override
	public void point(int mpno) {
		session.selectOne(namespace + ".point", mpno);
		
	}
	
	@Override
	public void like(MyPetVO vo) {
		session.update(namespace + ".like", vo);	
	}
}
