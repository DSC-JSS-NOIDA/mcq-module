package org.gdgjss.controller;

import java.util.List;

import org.gdgjss.model.Questions;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuestionController {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value = "/QuestionController", method = RequestMethod.POST)
	public ModelAndView submitAdmissionForm()
	{
		Session session = sessionFactory.openSession();
		List<Questions> ques=session.createCriteria(Questions.class).list();
		ModelAndView model = new ModelAndView("displayquestions");
		model.addObject("ques" ,ques);
		return model;
	}


}
