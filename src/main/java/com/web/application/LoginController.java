package com.web.application;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.dao.LoginDetailsDao;

@Controller
public class LoginController {

	@RequestMapping("login")
	public ModelAndView login(HttpServletRequest request, @RequestParam("uname") String username,
			@RequestParam("pass") String password) {
		ModelAndView mv = new ModelAndView();
		LoginDetailsDao loginDetailsDao = new LoginDetailsDao();
		if (loginDetailsDao.isValidLog(username, password)) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			mv.setViewName("index");
			mv.addObject("username", username);
		} else {
			mv.setViewName("login");
			mv.addObject("invalid",
					"<div id=\"invalid\"class=\"alert alert-danger\" role=\"alert\">\r\n"
							+ "					<span>Invalid username or password! Try again.</span>\r\n"
							+ "				</div>");
		}
		return mv;
	}

}
