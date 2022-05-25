package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.BoardVO;
import com.example.domain.MyPetVO;
import com.example.domain.ShopVO;

@Repository
public class HomeDAOImpl implements HomeDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.MysqlMapper";

	@Override
	public List<BoardVO> community() {
		return session.selectList(namespace + ".community");
	}

	@Override
	public List<ShopVO> product() {
		return session.selectList(namespace + ".product");
	}

	@Override
	public List<MyPetVO> mypet() {
		return session.selectList(namespace+ ".mypet");
	}

}
