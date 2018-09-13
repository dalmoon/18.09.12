package com.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.ListDAO;
import com.test.dvo.TestVO;

@Service
public class ListServiceImpl implements ListService {
	
	@Autowired
	private ListDAO listDAO;

	@Override
	public List<TestVO> testlist(TestVO vo) {
		return listDAO.getboardlist(vo);
	}
}
