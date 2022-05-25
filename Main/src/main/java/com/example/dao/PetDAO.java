package com.example.dao;

import java.util.List;
import java.util.Map;

import com.example.domain.Criteria;
import com.example.domain.PetVO;

public interface PetDAO {
	public List<PetVO> list(Criteria cri);
	public int total(Criteria cri);
	public PetVO read(int dno);
}
