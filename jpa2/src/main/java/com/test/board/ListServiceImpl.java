package com.test.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ListServiceImpl implements ListService {
	
	@Autowired
	private BoardDAO BoardDAO;

	@Override
	public List<BoardVO> testlist(BoardVO vo) throws Exception{
		return BoardDAO.getBoardList(vo);
	}
}
