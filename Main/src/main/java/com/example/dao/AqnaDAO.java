package com.example.dao;

import java.util.List;

import com.example.domain.AqnaVO;
import com.example.domain.Criteria;

public interface AqnaDAO {
	public List<AqnaVO> list(Criteria cri,int qno);
	public void insert(AqnaVO vo);
	public void delete(int ano);
	public void status(int qno);
}
