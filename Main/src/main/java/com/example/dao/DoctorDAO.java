package com.example.dao;

import java.util.List;

import com.example.domain.DoctorVO;

public interface DoctorDAO {
	public List<DoctorVO> list();
	public DoctorVO read(String did);
	public void insert(DoctorVO vo);
	public void update(DoctorVO vo);
	public DoctorVO mailcheck(String demail);
	public DoctorVO nickcheck(String dnickname);
}
