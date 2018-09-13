package com.test.service;

import com.test.dto.UserVO;

public interface UserService {

	public UserVO login(UserVO vo) throws Exception;
	public UserVO idck(String id) throws Exception;
}
