package com.example.dao;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.ShopVO;

public interface ShopDAO {
	public ShopVO read(int id);
	public void insert(ShopVO vo);
	public ShopVO check(String link);
	public int total();
	public List<ShopVO> list(Criteria cri);
	public void update(ShopVO vo);
}
