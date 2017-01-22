package org.gdgjss.service;

import javax.servlet.http.HttpSession;

import org.gdgjss.model.Constraints;
import org.gdgjss.model.Registration;
import org.gdgjss.model.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * service layer for registration and login.
 * 
 * @author Tilhari
 *
 */
@Controller
public class Commons {

	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	private Registration registered;
	
	// Index page controller.
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView getadmissionform(HttpSession httpSession) {
		/**
		 * key attribute is set to check restart of test via back/front/refresh
		 * button of browser. Here if condition is used so that 'key' attribute
		 * is not created again-2 in case index page is refreshed which MAY
		 * throw exceptions.
		 */
		if (httpSession.getAttribute("key1") == null)
			httpSession.setAttribute("key1", "key1");
		ModelAndView model = new ModelAndView("index");
		model.addObject("invalid", null);

		return model;
	}
	
	

	// Registration page controller
	@RequestMapping(value = "/RegistrationController", method = RequestMethod.POST)
	public ModelAndView submitAdmissionForm(
			@ModelAttribute("registration") org.gdgjss.model.Registration registration) {
		Session session = sessionFactory.openSession();
		ModelAndView model = new ModelAndView("index");
		Result result=new Result();
		if(session.get(Registration.class, registration.getRollno()) == null)
		{
			session.beginTransaction();
			registration.setAttempt(false);
			session.save(registration);
			result.setContact(registration.getContact());
			result.setName(registration.getName());
			result.setRollno(registration.getRollno());
			result.setNetMarks(0);
			result.setRgtAns(0);
			result.setWngAns(0);
			result.setNotAns(0);
			
			session.save(result);
			session.getTransaction().commit();
			session.close();
			model.addObject("invalid", "Successfully registered, login to proceed!");
			
		}
		else
			model.addObject("invalid", "This roll number is already registered.");
		
		return model;
	}

	// Login controller
	@RequestMapping(value = "/LoginController", method = RequestMethod.POST)
	public ModelAndView login(HttpSession httpSession, @RequestParam("rollno") String rollno,
			@RequestParam("password") String password) {
		ModelAndView model;
		Session session = sessionFactory.openSession();
		registered = (Registration) session.get(Registration.class, rollno);
		Constraints constraints=(Constraints) session.get(Constraints.class,"3_rules");
		System.out.println(constraints.getValue());
		if (registered != null) {
			if (registered.getPass().equals(password)) {
				httpSession.setAttribute("SESSION", registered);
				/**
				 * In case bad-ass tries to come back to login-success(rules)
				 * page via browser back button and tries to be over smart to
				 * restart the quiz timer, following if-block code is executed
				 * as 'key1' attribute is already destroyed by question display
				 * page at first place. Header(---) included on the mapped JSP
				 * will force for page-reload from server and the GALVATRON
				 * INTERCEPTER page will be displayed, automatically destroying
				 * the session and logging out the participant.
				 * 
				 * @security
				 * @author Tilhari
				 */
				if (httpSession.getAttribute("key1") == null) {
					httpSession.invalidate();
					return new ModelAndView("galvatronIntercepter");
				}
				if(registered.isAttempt()==true)
				{
					model = new ModelAndView("index");
					model.addObject("invalid", "A test submission has already been made on this roll number.");
					return model;
				}
				registered = (Registration) httpSession.getAttribute("SESSION");
				model = new ModelAndView("loginsuccess");
				model.addObject("sessionName", registered.getName());
				model.addObject("sessionrollNo", registered.getRollno());
				model.addObject("rules",constraints.getValue());

			} else {
				model = new ModelAndView("index");
				model.addObject("invalid", "Incorrect roll number or password");
			}
		} else {
			model = new ModelAndView("index");
			model.addObject("invalid", "Incorrect roll number or password");
		}
		session.close();
		return model;
	}

}