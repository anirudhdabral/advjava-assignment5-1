package com.web.application;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.dao.BookDetailsDao;

//import com.database.util.BookUtil;
//import com.web.dao.BookDetailsDao;

import database.BookDetails;


@Controller
public class InsertController {

	@RequestMapping("insert")
	public ModelAndView insert(@RequestParam("code") String code, @RequestParam("name") String name,
			@RequestParam("author") String author) {
		ModelAndView mv = new ModelAndView();
		BookDetailsDao bookDetailsDao = new BookDetailsDao();
		if(bookDetailsDao.getBook(code)==null) {
			Date date = new Date();
			BookDetails book = new BookDetails(code, name, author, date);
			bookDetailsDao.saveBook(book);
			mv.setViewName("index");
		}
		else {
			mv.setViewName("add");
			mv.addObject("invalid",
					"<div id=\"invalid\"class=\"alert alert-danger\" role=\"alert\">\r\n"
							+ "					<span>Book code already exists! Try again.</span>\r\n"
							+ "				</div>");
		}
		return mv;
	}

}
