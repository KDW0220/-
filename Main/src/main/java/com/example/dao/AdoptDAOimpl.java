package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.AdoptVO;
import com.example.domain.Criteria;

@Repository
public class AdoptDAOimpl implements AdoptDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.AdoptMapper";
	
	@Override
	public List<AdoptVO> list(Criteria cri) {
		return session.selectList(namespace + ".list",cri);
	}

	@Override
	public void insert(AdoptVO vo) {
		session.insert(namespace + ".insert", vo);
		
	}

	@Override
	public AdoptVO read(int ano) {
		return session.selectOne(namespace + ".read",ano);
	}

	@Override
	public void delete(int ano) {
		session.delete(namespace + ".delete",ano);
		
	}

	@Override
	public void update(AdoptVO vo) {
		session.update(namespace + ".update",vo);
		
	}

	@Override
	public int totalCount(Criteria cri) {
		return session.selectOne(namespace + ".totalCount",cri);
	}

	@Override
	public int count(Criteria cri) {
		return session.selectOne(namespace + ".count", cri);
	}

}
