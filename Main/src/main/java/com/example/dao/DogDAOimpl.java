package com.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class DogDAOimpl implements DogDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.DogMapper";
	
	@Override
	public List<Map<String, Object>> list() {
		return session.selectList(namespace + ".list");
	}

}
