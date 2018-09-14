package com.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.UserDAO;
import com.test.dvo.JoinVO;
import com.test.dvo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDAO;

	@Override
	public UserVO login(UserVO vo) throws Exception {
		return userDAO.getlogin(vo);
	}

	@Override
	public UserVO idck(String id) throws Exception {
		return userDAO.getidck(id);
	}

	@Override
	public int uinsert(JoinVO vo) throws Exception {
		return userDAO.getinsert(vo);
	}

	@Override
	public int idDuplChk(String id) throws Exception {
		return userDAO.getDuplChk(id);
	}
	
}
