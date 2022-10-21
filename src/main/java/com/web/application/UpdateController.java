package com.web.application;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.dao.BookDetailsDao;
import com.web.util.BookDetailsUtil;

import database.BookDetails;

@Controller
public class UpdateController {

	@RequestMapping("update")
	public ModelAndView update(@RequestParam("code") String code, @RequestParam("name") String name,
			@RequestParam("author") String author) {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("index");
		BookDetailsDao bookDetailsDao = new BookDetailsDao();
		
		Session fetchSession = BookDetailsUtil.getSessionFactory().openSession();
		BookDetails oldBook = (BookDetails) fetchSession.get(BookDetails.class, code);
		fetchSession.close();
		BookDetails book = new BookDetails(code, name, author, oldBook.getAddedDate());
		bookDetailsDao.updateBook(book);

		return mView;
	}

}
