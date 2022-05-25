package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.QnaVO;

@Repository
public class QnaDAOImpl implements QnaDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.QnaMapper";
	
	
	
	@Override
	public List<QnaVO> list(Criteria cri) {
		return session.selectList(namespace + ".list", cri);
	}

	@Override
	public QnaVO read(int qno) {
		return session.selectOne(namespace + ".read", qno);
	}

	@Override
	public void insert(QnaVO vo) {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public void update(QnaVO vo) {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int qno) {
		session.delete(namespace + ".delete", qno);
		
	}

}
