package com.test.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test.dto.TestVO;

@Repository(value="listMap")
public interface ListMap {

	public List<TestVO> list(TestVO vo) throws Exception;

}
