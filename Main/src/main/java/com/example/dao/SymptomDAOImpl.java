package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.SymptomVO;

@Repository
public class SymptomDAOImpl implements SymptomDAO {
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.SymptomMapper";
	
	@Override
	public List<SymptomVO> list(Criteria cri) {
		return session.selectList(namespace + ".list", cri);
	}
	@Override
	public SymptomVO read(int sno) {
		return session.selectOne(namespace + ".read", sno);
	}
	@Override
	public int count(Criteria cri) {
		return session.selectOne(namespace + ".count", cri);
	}
}
