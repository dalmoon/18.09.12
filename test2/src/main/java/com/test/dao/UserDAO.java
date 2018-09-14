package com.test.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.dvo.JoinVO;
import com.test.dvo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserVO getlogin(UserVO vo) {
		return mybatis.selectOne("User.getUser", vo);
	}
	
	public UserVO getidck(String id) {
		return mybatis.selectOne("User.getIdck", id);
	}
	
	public int getinsert(JoinVO vo) {
		return mybatis.insert("User.getInsert", vo);
	}
	
	public int getDuplChk(String id) {
		return mybatis.selectOne("User.getDuplChk", id);
	}
}
