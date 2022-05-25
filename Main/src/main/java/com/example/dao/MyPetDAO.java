package com.example.dao;

import java.util.List;
import com.example.domain.Criteria;
import com.example.domain.MyPetVO;

public interface MyPetDAO {
	public List<MyPetVO> list(Criteria cri);
	public int count(Criteria cri);
	public void insert(MyPetVO vo);
	public MyPetVO read(int mpno);
	public void update(MyPetVO vo);
	public void delete(int mpno);
	public void point(int mpno);
	public void like(MyPetVO vo);
}
