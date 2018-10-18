package com.test.board;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ListController {
	
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	
	@Autowired
	private ListService listService;
	
	@RequestMapping(value="list.do")
	public String testlist(BoardVO vo, Model model) throws Exception{
		
		logger.debug("---->>>>> 조회처리");
		
		List<BoardVO> list = listService.testlist(vo);
		model.addAttribute("boardlist", list);
		return "list";
	}
}
