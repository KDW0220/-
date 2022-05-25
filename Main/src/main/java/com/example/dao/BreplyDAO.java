package com.example.dao;

import java.util.List;

import com.example.domain.BreplyVO;
import com.example.domain.Criteria;

public interface BreplyDAO {
	public List<BreplyVO> list(Criteria cri, int bno);
	public int count(int bno);
	public void insert(BreplyVO vo);
	public void update(BreplyVO vo);
	public void delete(int brno);
}
