package com.example.dao;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.SymptomVO;

public interface SymptomDAO {
	public List<SymptomVO> list(Criteria cri);
	public SymptomVO read(int sno);
	public int count(Criteria cri);
}
