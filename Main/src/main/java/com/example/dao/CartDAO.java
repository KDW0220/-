package com.example.dao;

import java.util.List;

import com.example.domain.CartVO;
import com.example.domain.Criteria;

public interface CartDAO {
	public CartVO read(int id);
	public void insert(CartVO vo);
	public int total();
	public CartVO check(String link);
	public List<CartVO> list(Criteria cri,String uid);
	public void delete(int id);
	public CartVO readuser(String uid);
	public int sum(String uid);
}
