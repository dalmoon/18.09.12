package com.test.board;

import java.io.PrintWriter;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.test.dvo.CCodemngVO;
import com.test.dvo.CodemngVO;
import com.test.dvo.DetailVO;
import com.test.dvo.ItVO;
import com.test.dvo.JoinVO;
import com.test.dvo.UserVO;
import com.test.service.UserService;

import net.minidev.json.JSONArray;

@Controller
@SessionAttributes({"uulist", "itemlist"})
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
	
	/*@RequestMapping(value = "uulist.do")
	public String uulist(Model model, HttpServletRequest req) throws Exception {
		String cdno = req.getParameter("cdno");
		CodemngVO list = userService.uulist(cdno);
		model.addAttribute("uulist", list);
		return "ulist";
	}*/
	
	@RequestMapping(value = "uulist.do")
	public String uulist(CodemngVO vo, Model model, HttpSession hp) throws Exception {
		CodemngVO list = userService.uulist(vo);
		hp.setAttribute("hplist", list);
		hp.setAttribute("hplist1", list);
		return "ulist";
	}
	
	@RequestMapping(value = "update.do")
	public String update(@ModelAttribute("uulist") CodemngVO vo) throws Exception{
		userService.update(vo);
		return "redirect:ulist.do";
	}
	
	@RequestMapping(value = "insert.do")
	public String insert(@ModelAttribute("uulist") CodemngVO vo, Model model) throws Exception {
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yy-MM-dd");
		String to = transFormat.format(from);
		vo.setInsdate(to);
		String a = vo.getInsdate();
		model.addAttribute("a", a);
		System.out.println(a);
		userService.insert(vo);
		return "redirect:ulist.do";
	}
	
	@RequestMapping(value = "iselect.do")
	public String iselect(@ModelAttribute("uulist") CodemngVO vo) throws Exception {
		userService.iselect(vo);
		return "ulist";
	}
	
	@RequestMapping(value = "in.do")
	public String log(HttpSession ht, HttpServletRequest req, Model model, CodemngVO vo)throws Exception{
		 vo = (CodemngVO) ht.getAttribute("hplist1");
		CodemngVO list = userService.uulist(vo);
		ht.setAttribute("hplist", list);
		model.addAttribute("uulist", list);
		String a = 	vo.getCdno();
		System.out.println(a);
		/*ht.removeAttribute("uulist");*/
		return "redirect:ulist.jsp";
	}
	
	@RequestMapping(value = "logout.do")
	public String logout(CodemngVO vo, HttpSession ht, HttpServletRequest req)throws Exception{
		ht.removeAttribute("hplist");
		return "redirect:ulist.jsp";
	}
	
	
	
	
	
	@RequestMapping(value = "fulllist.do")
	public String itlist(ItVO vo, Model model, HttpSession hp)throws Exception{
		List<ItVO> list = userService.itlist(vo);
		model.addAttribute("itemlist", list);
		return "fulllist";
	}
	
	@RequestMapping(value = "itselect.do")
	public String ittlist(ItVO vo, Model model, HttpSession hp) throws Exception {
		ItVO list = userService.ittlist(vo);
		hp.setAttribute("ithplist", list);
		hp.setAttribute("ithplist1", list);
		return "redirect:fulllist.do";
	}
	
	@RequestMapping(value = "itlogout.do")
	public String logoutt(ItVO vo, HttpSession ht, HttpServletRequest req)throws Exception{
		ht.removeAttribute("ithplist");
		return "redirect:fulllist.do";
	}
	
	@RequestMapping(value = "itin.do")
	public String log(HttpSession ht, HttpServletRequest req, Model model, ItVO vo)throws Exception{
		 vo = (ItVO) ht.getAttribute("ithplist1");
		 ItVO list = userService.ituulist(vo);
		ht.setAttribute("ithplist", list);
		/*ht.removeAttribute("uulist");*/
		return "redirect:fulllist.do";
	}
	
	@RequestMapping("testSelect.do")
	public void selectAjax(ItVO vo, HttpServletRequest req, HttpServletResponse res, String param) { 
	   try {
	   // 도 정보 받음
		   String a = vo.getItemclsname();
		   String province = a;
		   String b = vo.geti
	 
	   // 알맞은 동적 select box info 생성
	   List<String> cityList = new ArrayList();
	   
	   
	   if (province.equals("")) {
	      cityList.add("");
	      cityList.add("");
	   } else if (province.equals("")) {
	      cityList.add("");
	      cityList.add("");
	   }
	 
	   // jsonArray에 추가
	   JSONArray jsonArray = new JSONArray();
	   for (int i = 0; i < cityList.size(); i++) {
	      jsonArray.add(cityList.get(i));
	   }
	 
	   // jsonArray 넘김
	   PrintWriter pw = res.getWriter();
	   pw.print(jsonArray.toString());
	   pw.flush();
	   pw.close();
	 
	   } catch (Exception e) {
	       System.out.println("Controller error");
	   }
	}
	
}
