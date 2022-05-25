package com.example.dao;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.QnaVO;

public interface QnaDAO {
	public List<QnaVO> list(Criteria cri);
	public QnaVO read(int qno);
	public void insert(QnaVO vo);
	public void update(QnaVO vo);
	public void delete(int qno);
}
