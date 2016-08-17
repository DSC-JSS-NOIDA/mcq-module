package org.gdgjss.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.gdgjss.model.Questions;
import org.gdgjss.model.Registration;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Service layer for displaying questions and submitting solution.
 * 
 * @author Tilhari
 *
 */

@Controller
public class SessionControlled {

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private Registration registration;

	@RequestMapping(value = "/QuestionController", method = RequestMethod.POST)
	public ModelAndView submitAdmissionForm(HttpSession httpSession){
		/**
		 * As soon as the test is started key1 attribute is destroyed.
		 * In case reload/ back button is triggered while test is going on, jsp
		 * Header(---) and following if block code will logout the participant.
		 */
		if (httpSession.getAttribute("key1") == null) {
			httpSession.invalidate();
			return new ModelAndView("index_redirector");
		}
		httpSession.removeAttribute("key1");
		Session session = sessionFactory.openSession();
		List<Questions> ques = session.createCriteria(Questions.class).list();
		ModelAndView model = new ModelAndView("displayquestions");
		int myhr=0;
		int mymin=2;
		int mysec=0;
		registration = (Registration) httpSession.getAttribute("SESSION");
		model.addObject("sessionName", registration.getName());
		model.addObject("sessionrollNo", registration.getRollno());
		model.addObject("myhr", myhr);
		model.addObject("mymin", mymin);
		model.addObject("mysec", mysec);
		model.addObject("ques", ques);
		session.close();
		return model;

	}

	@RequestMapping(value = "/SubmitSolution", method = RequestMethod.POST)
	public ModelAndView submitSolution(HttpSession httpSession) {
		ModelAndView model = new ModelAndView("solutionsubmit");
		registration = (Registration) httpSession.getAttribute("SESSION");
		model.addObject("sessionName", registration.getName());
		httpSession.invalidate();
		return model;
	}

	@RequestMapping(value = "/LogoutController", method = RequestMethod.POST)
	public ModelAndView LogoutController(HttpSession httpSession) {
		httpSession.invalidate();
		ModelAndView model = new ModelAndView("index");
		return model;
	}
}
