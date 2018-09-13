package com.test.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class modul {
	
	public void sa(HttpServletResponse res, String msg) throws Exception {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println("<script>alert('"+ msg +"'); history.go(-1);</script>");
		out.flush();
	}
}
