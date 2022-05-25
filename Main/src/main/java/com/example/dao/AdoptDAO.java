package com.example.dao;

import java.util.List;

import com.example.domain.AdoptVO;
import com.example.domain.Criteria;

public interface AdoptDAO {
	public List<AdoptVO> list(Criteria cri);
	public void insert(AdoptVO vo);
	public AdoptVO read(int ano);
	public void delete(int ano);
	public void update(AdoptVO vo);
	public int totalCount(Criteria cri);
	public int count(Criteria cri);
}
