package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Board;
import com.example.demo.repository.BoardRepository;

@RestController
public class BoardController {
	
	@Autowired
	BoardRepository boardRepository;
	
	//읽기
	@GetMapping(value="/list")
	public ModelAndView list() throws Exception{
		List<Board> list = boardRepository.findAll();
		return new ModelAndView("boardList", "list", list);
	}
	
	//쓰기 페이지로 이동
	@GetMapping(value="/write")
    public ModelAndView writeForm() throws Exception{
        return new ModelAndView("boardWrite");
    }
	
	//쓰기
	/*@PostMapping(value="/create11")
    public ModelAndView write(Board vo) throws Exception{
		boardRepository.save(vo);
		List<Board> list = boardRepository.findAll();
        return new ModelAndView("boardList", "list", list);
    }*/
	
	//쓰기
	@PostMapping(value="/create")
	public Map<String, Object> write11(Board vo) throws Exception{
		
		boardRepository.save(vo);
		
		Map<String, Object> mapParam = new HashMap<String, Object>();
		
//		List<Board> list = boardRepository.findAll();
//		return new ModelAndView("boardList", "list", list);
		
		mapParam.put("result", "Y");
		
		return mapParam;
		
	}
	
	//상세보기 @RequestParam 이용한 방법
	/*@GetMapping(value="/board")
    public ModelAndView board(@RequestParam long id) throws Exception{
        Board list = boardRepository.findById(id);
		return new ModelAndView("board", "list", list);
    }*/
	
	//상세보기 @PathVariable 이용한 방법(html쪽에서 수정 해줘야함)
	@GetMapping(value="/boards/{id}")
    public ModelAndView board(@PathVariable long id) throws Exception{
        Board list = boardRepository.findById(id);
		return new ModelAndView("board", "list", list);
    }
	
	//수정
	@PutMapping(value="/boards/{id}")
	public ModelAndView update(@PathVariable long id, Board vo) throws Exception{
		boardRepository.save(vo);
		List<Board> list = boardRepository.findAll();
		return new ModelAndView("boardList", "list", list);
	}
	
	//삭제
	@RequestMapping(value="/delete/{id}")
	public ModelAndView delete(@PathVariable long id, Board vo) throws Exception{
		boardRepository.delete(vo);
		List<Board> list = boardRepository.findAll();
		return new ModelAndView("boardList", "list", list);
	}
}
