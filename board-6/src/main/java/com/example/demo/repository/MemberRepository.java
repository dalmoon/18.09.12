package com.example.demo.repository;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.example.demo.domain.Member;

@Transactional
@RepositoryRestResource
public interface MemberRepository extends JpaRepository<Member, String> {

	Optional<Member> findById(String id);

}
