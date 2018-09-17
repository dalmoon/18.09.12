package com.test.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.dvo.CodemngVO;
import com.test.dvo.DetailVO;
import com.test.dvo.JoinVO;
import com.test.dvo.UserVO;
import com.test.service.UserService;

import oracle.net.aso.a;

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
	public String userinsert(JoinVO vo, Model model) throws Exception {
		
		logger.debug("---->>>>> 회원가입 동작");
		
		userService.uinsert(vo);
		model.addAttribute("id", vo.getId());
		return "detail";
	}
	
	@RequestMapping(value = "/idDuplChk.do")
	public @ResponseBody String idDuplChk(UserVO vo) throws Exception{
	    int result = userService.idDuplChk(vo.getId());
	    return String.valueOf(result);
	}
	
	@RequestMapping(value = "detail.do")
	public String userdetail(DetailVO vo, Model model, HttpServletResponse res) throws Exception{
		logger.debug("---->>>>> 상세정보 동작");
		modul a = new modul();
		String mobil = vo.getMobiletelno();
		String home = vo.getHometelno();
		if(mobil.equals("") && home.equals("")) {
			a.sa(res, "휴대전화, 집전화번호 중 하나는 입력하셔야합니다.");
			return "detail";
		}else{
			userService.udetail(vo);
			model.addAttribute("uname", vo.getDelivname());
			return "main";
		}
	}
	
	@RequestMapping(value = "ulist.do")
	public String ulist(CodemngVO vo, Model model) throws Exception {
			List<CodemngVO> list = userService.ulist(vo);
			model.addAttribute("ulist", list);
		return "ulist";
	}
}
