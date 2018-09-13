package com.test.mapper;

import org.springframework.stereotype.Repository;

import com.test.dto.UserVO;

@Repository(value="userMap")
public interface UserMap {

	public UserVO userlogin(UserVO vo) throws Exception;
	public UserVO idck(String id) throws Exception;
}
