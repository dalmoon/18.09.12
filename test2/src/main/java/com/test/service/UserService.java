package com.test.service;

import com.test.dvo.JoinVO;
import com.test.dvo.UserVO;

public interface UserService {
	
	public UserVO login(UserVO vo) throws Exception;
	public UserVO idck(String id) throws Exception;
	public int uinsert(JoinVO vo) throws Exception;
	public int idDuplChk(String id) throws Exception;
}
