package com.example.dao;

import java.util.List;

import com.example.domain.BoardVO;
import com.example.domain.MyPetVO;
import com.example.domain.ShopVO;

public interface HomeDAO {
	public List<BoardVO> community();
	public List<ShopVO> product();
	public List<MyPetVO> mypet();
}
