package org.gdgjss.controller;

import org.gdgjss.model.Registration;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegistrationLoginController {

	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	Registration regi;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getadmissionform()
	{
		ModelAndView model = new ModelAndView("index");

		return model;
	}

	@RequestMapping(value = "/RegistrationController", method = RequestMethod.POST)
	public ModelAndView submitAdmissionForm(
			@ModelAttribute("registration") org.gdgjss.model.Registration registration)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(registration);
		session.getTransaction().commit();
		ModelAndView model = new ModelAndView("registrationsuccess");
		return model;
	}

	@RequestMapping(value = "/LoginController", method = RequestMethod.POST)
	public ModelAndView login(
			@RequestParam("email") String email, @RequestParam("password") String password)
	{
		ModelAndView model;
		Session session = sessionFactory.openSession();
		regi = (Registration) session.get(Registration.class, email);
		if(regi!=null)
		{
		if (regi.getPassword().equals(password))
			model = new ModelAndView("loginsuccess");
		else
			model = new ModelAndView("tester");
		}
		else
			model = new ModelAndView("tester");
		return model;
	}

}
