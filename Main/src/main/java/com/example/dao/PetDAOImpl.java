package com.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.PetVO;

@Repository
public class PetDAOImpl implements PetDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.PetMapper";


	@Override
	public List<PetVO> list(Criteria cri) {
		return session.selectList(namespace + ".list",cri);
	}


	@Override
	public int total(Criteria cri) {
		return session.selectOne(namespace + ".total", cri);
	}
	
	@Override
	public PetVO read(int dno) {
		return session.selectOne(namespace + ".read", dno);
	}

}
