package org.gdgjss.service;

import javax.servlet.http.HttpSession;

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
	Registration registered;

	// Index page controller.
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView getadmissionform(HttpSession httpSession) {
		/**
		 * key attribute is set to check restart of test via back/front/refresh
		 * button of browser. Here if condition is used so that 'key' attribute
		 * is not created again-2 in case index page is refreshed which MAY
		 * throw exception.
		 */
		if (httpSession.getAttribute("key1") == null)
			httpSession.setAttribute("key1", "key1");
		ModelAndView model = new ModelAndView("index");

		return model;
	}

	// Registration page controller
	@RequestMapping(value = "/RegistrationController", method = RequestMethod.POST)
	public ModelAndView submitAdmissionForm(
			@ModelAttribute("registration") org.gdgjss.model.Registration registration) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(registration);
		session.getTransaction().commit();
		session.close();
		ModelAndView model = new ModelAndView("registrationsuccess");
		return model;
	}

	// Login controller
	@RequestMapping(value = "/LoginController", method = RequestMethod.POST)
	public ModelAndView login(HttpSession httpSession, @RequestParam("email") String email,
			@RequestParam("password") String password){
		ModelAndView model;
		Session session = sessionFactory.openSession();
		registered = (Registration) session.get(Registration.class, email);
		if (registered != null) {
			if (registered.getPassword().equals(password)) {
				httpSession.setAttribute("SESSION", registered);
				/**
				 * In case participant tries to come back to login
				 * success(rules) page via back button and tries to to be smart
				 * to restart the timer, following if block code is executed
				 * because key1 attribute is already destroyed by question
				 * display page.and Header(---) included on the jsp will force
				 * for page-reload from server.
				 */
				if (httpSession.getAttribute("key1") == null) {
					httpSession.invalidate();
					return new ModelAndView("index_redirector");
				}
				registered = (Registration) httpSession.getAttribute("SESSION");
				model = new ModelAndView("loginsuccess");
				model.addObject("sessionName", registered.getName());

			} else
				model = new ModelAndView("tester");
		} else
			model = new ModelAndView("tester");
		session.close();
		return model;
	}

}
