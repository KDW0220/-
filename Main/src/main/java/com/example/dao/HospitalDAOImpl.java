package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.HospitalVO;

@Repository
public class HospitalDAOImpl implements HospitalDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.HospitalMapper";
	
	@Override
	public List<HospitalVO> list(Criteria cri) {
		return session.selectList(namespace + ".list", cri);
	}
	@Override
	public HospitalVO read(int ano) {
		return session.selectOne(namespace + ".read", ano);
	}
	@Override
	public int count(Criteria cri) {
		return session.selectOne(namespace + ".count", cri);
	}

}
