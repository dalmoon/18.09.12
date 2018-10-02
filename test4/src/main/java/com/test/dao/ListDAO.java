package com.test.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.dvo.TestVO;

@Repository
public class ListDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<TestVO> getboardlist(TestVO vo){
		return mybatis.selectList("BoardDAO.getBoardList", vo);
	}
	
}
