package com.test.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.dvo.CCodemngVO;
import com.test.dvo.CodemngVO;
import com.test.dvo.DetailVO;
import com.test.dvo.ItVO;
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

	public int gdetail(DetailVO vo) {
		return mybatis.insert("User.getdetail", vo);
	}

	public List<CodemngVO> glist(CodemngVO vo) {
		return mybatis.selectList("User.getlist", vo);
	}

	public CodemngVO gglist(CodemngVO vo) {
		return mybatis.selectOne("User.ggetlist", vo);
	}

	public int update(CodemngVO vo) {
		return mybatis.update("User.update", vo);
	}

	public int insert(CodemngVO vo) {
		return mybatis.insert("User.insert", vo);
	}

	public CodemngVO iselect(CodemngVO vo) {
		return mybatis.selectOne("User.iselect", vo);
	}

	public List<ItVO> itlist(ItVO vo) {
		return mybatis.selectList("User.itselect", vo);
	}

	public ItVO ittlist(ItVO vo) {
		return mybatis.selectOne("User.ittselect", vo);
	}

	public ItVO ituulist(ItVO vo) {
		return mybatis.selectOne("User.ittselect", vo);
	}

	public List<ItVO> iitlist(String project) {
		return mybatis.selectList("User.iitlist", project);
	}

	public List<ItVO> search(HashMap<String, Object> map) {
		return mybatis.selectList("User.search", map);
	}

	public List<ItVO> fufulllist2list(ItVO vo) {
		return mybatis.selectList("User.fulllist2list", vo);
	}



}
