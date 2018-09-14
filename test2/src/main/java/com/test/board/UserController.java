package com.test.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.dvo.JoinVO;
import com.test.dvo.UserVO;
import com.test.service.UserService;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	@Autowired
	private UserService userService;

	@RequestMapping(value = "login.do")
	public String login(UserVO vo, HttpServletResponse res, HttpServletRequest req, HttpSession session)
			throws Exception {

		logger.debug("---->>> 로그인 동작");

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
		}
		return "login";
	}
	
	@RequestMapping(value = "join.do")
	public String userinsert(JoinVO vo) throws Exception {
		
		logger.debug("---->>>>> 회원가입 동작");
		
		userService.uinsert(vo);
		return "detail";
	}
	
	@RequestMapping(value = "/idDuplChk.do")
	public @ResponseBody String idDuplChk(UserVO vo) throws Exception{
	    int result = userService.idDuplChk(vo.getId());
	    return String.valueOf(result);
	}
}
