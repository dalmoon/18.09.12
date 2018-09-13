package com.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dto.UserVO;
import com.test.mapper.UserMap;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMap userMap;
	
	@Override
	public UserVO login(UserVO vo) throws Exception{
		return userMap.userlogin(vo);
	}

	@Override
	public UserVO idck(String id) throws Exception {
		return userMap.idck(id);
	}
	
}
