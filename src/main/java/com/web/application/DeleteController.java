package com.web.application;

import com.web.dao.BookDetailsDao;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class DeleteController {
	
	@RequestMapping("delete")
	public ModelAndView delete(@RequestParam("deletecode") String code) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("index");
		BookDetailsDao bookDetailsDao = new BookDetailsDao();
		bookDetailsDao.deleteBook(code);
		return mView;
	}

}
