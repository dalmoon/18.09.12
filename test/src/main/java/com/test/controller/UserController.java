package com.test.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.dto.UserVO;
import com.test.service.UserService;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	@Autowired
	private UserService userService;

	@RequestMapping(value = "login.do")
	public String login(UserVO vo, HttpSession session, HttpServletRequest req, HttpServletResponse res)
			throws Exception {

		logger.debug("---->>>>> 로그인 동작");
		
		modul a = new modul();
		
		String id = req.getParameter("id");
		
		if (userService.idck(id) != null) {
			if (userService.login(vo) != null) {
				session.setAttribute("userId", vo.getId());
				return "main";
			} else {
				a.sa(res, "비밀번호를 틀렸습니다.");
				return "login";
			}
		} else {
			a.sa(res, "존재하지 않는 아이디입니다.");
			return "login";
		}
	}
}
