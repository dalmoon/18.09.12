package com.example.demo.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.demo.domain.Board;

@Transactional
@RepositoryRestResource
public interface BoardRepository extends JpaRepository<Board, Long>{
	
	Board findById(@PathVariable("id") long id);

}
