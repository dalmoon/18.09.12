package com.test.service;

import java.util.List;

import com.test.dto.TestVO;

public interface ListService{

	public List<TestVO> testlist(TestVO vo) throws Exception;

}
