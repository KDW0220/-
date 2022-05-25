package com.example.dao;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.HospitalVO;

public interface HospitalDAO {
	public List<HospitalVO> list(Criteria cri);
	public HospitalVO read(int ano);
	public int count(Criteria cri);
}
