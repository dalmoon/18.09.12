package com.example.demo.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Board;
import com.example.demo.domain.Member;
import com.example.demo.repository.BoardRepository;
import com.example.demo.repository.MemberRepository;

@RestController
public class MemberController {
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private BoardRepository boardRepository;
	
	
	//메인
	@GetMapping(value="/members")
	public ModelAndView main() {
		return new ModelAndView("login");
	}
	
	//회원가입화면
	@GetMapping(value="/members/post")
	public ModelAndView join() {
		return new ModelAndView("join");
	}
	
	//회원가입
	@PostMapping(value="/members/post")
	public ModelAndView joinForm(Member vo) throws Exception{
//		vo.setPassword(bCryptPasswordEncoder.encode(vo.getPassword()));
		memberRepository.save(vo);
		return new ModelAndView("login");
    }
	
	//로그인
	@PostMapping(value="/members/login")
	public ModelAndView login(String id, String password, HttpSession session) throws Exception{
		Optional<Member> vo = memberRepository.findById(id);
		if(vo.get().getId() == null) {
			return new ModelAndView("login");
		}
		if(!password.equals(vo.get().getPassword())) {
			return new ModelAndView("login");
		}
		
		session.setAttribute("member", id);
		List<Board> list = boardRepository.findAll();
		return new ModelAndView("boardList", "list", list);
	}
}
