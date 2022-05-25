package com.example.dao;

import java.util.List;

import com.example.domain.ChatVO;

public interface ChatDAO {
	public List<ChatVO> list();
	public void insert(ChatVO vo);
	public void delete(int id);
}
