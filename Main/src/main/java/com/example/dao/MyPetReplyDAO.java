package com.example.dao;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.MyPetReplyVO;

public interface MyPetReplyDAO {
	public List<MyPetReplyVO> list(Criteria cri, int mpno);
	public int count(int mpno);
	public void insert(MyPetReplyVO vo);
	public void update(MyPetReplyVO vo);
	public void delete(int mprno);

}
