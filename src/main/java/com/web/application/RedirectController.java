package com.web.application;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RedirectController {
	
	@RequestMapping("home")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}

	@RequestMapping("addPage")
	public ModelAndView add() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("add");
		return mv;
	}

	@RequestMapping("editPage")
	public ModelAndView edit() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("edit");
		return mv;
	}

	@RequestMapping("cancel")
	public ModelAndView cancel() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

}
