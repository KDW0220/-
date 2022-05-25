package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.DoctorVO;
import com.example.domain.UserVO;

@Repository
public class DoctorDAOImpl implements DoctorDAO{
	@Autowired
	SqlSession session;
	String namespace = "com.example.mapper.DoctorMapper";
	
	@Override
	public List<DoctorVO> list() {
		return session.selectList(namespace + ".list");
	}

	@Override
	public DoctorVO read(String did) {
		return session.selectOne(namespace + ".read", did);
	}

	@Override
	public void insert(DoctorVO vo) {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public void update(DoctorVO vo) {
		session.update(namespace + ".update", vo);
	}
	@Override
	public DoctorVO mailcheck(String demail) {
		return session.selectOne(namespace + ".mailcheck", demail);
	}

	@Override
	public DoctorVO nickcheck(String unickname) {
		return session.selectOne(namespace + ".nickcheck", unickname);
	}

}
