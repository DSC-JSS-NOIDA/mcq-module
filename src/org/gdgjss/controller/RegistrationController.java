package org.gdgjss.controller;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class RegistrationController {

	@Autowired
	SessionFactory sessionFactory;
	
	@RequestMapping(value="/" , method= RequestMethod.GET)	
	public ModelAndView getadmissionform()
	{
		ModelAndView model=new ModelAndView("index");
		
		return model;
	}

@RequestMapping(value="/RegistrationController" , method= RequestMethod.POST)
		public ModelAndView submitAdmissionForm( @ModelAttribute("registration") org.gdgjss.model.Registration registration)
		{
			
		Session session = sessionFactory.openSession();
	
		session.beginTransaction();
		session.save(registration);
	
	
		//System.out.println(student.getName());
		session.getTransaction().commit();
		ModelAndView model= new ModelAndView("registrationsuccess");
			//model.addObject("student" ,student);
			return model;
		}
		
		

	}
