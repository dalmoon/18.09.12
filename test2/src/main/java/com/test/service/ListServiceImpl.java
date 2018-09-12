package com.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dto.TestVO;
import com.test.mapper.ListMap;

@Service
public class ListServiceImpl implements ListService{
	
	@Autowired
	ListMap listMap;
	
	@Override
	public List<TestVO> testlist(TestVO vo) throws Exception{
		return listMap.list(vo);
	}
	
}
