package com.test.board;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	@PersistenceContext
	private EntityManager em;
	
	public List<BoardVO> getBoardList(BoardVO vo) throws Exception {
		System.out.println("===> JPA insertBoard() 기능처리");
		return em.createQuery("from BoardVO b order by b.seq desc").getResultList();
	}
}
