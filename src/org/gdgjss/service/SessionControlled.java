package org.gdgjss.service;

import java.util.Collections;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.gdgjss.model.Questions;
import org.gdgjss.model.Registration;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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

	private String solutions[];

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private Registration registration;

	

	@RequestMapping(value = "/sessionQuestionController", method = RequestMethod.POST)
	public ModelAndView submitAdmissionForm(HttpSession httpSession) {
		/**
		 * As soon as the test is started key1 attribute is destroyed. In case
		 * reload/ back button is triggered while test is going on, JSP
		 * Header(---) and following if block code will logout the participant.
		 */
		if (httpSession.getAttribute("key1") == null) {
			httpSession.invalidate();
			return new ModelAndView("galvatronIntercepter");
		}
		httpSession.removeAttribute("key1");
		Session session = sessionFactory.openSession();

		/**
		 * Logic for shuffling questions for each participants.
		 */

		List<Questions> ques = session.createCriteria(Questions.class).list();
		session.close();
		Collections.shuffle(ques);
		int size = ques.size();
		/**
		 * Ignoring 0th position of array solution to sync the solution.
		 */
		solutions = new String[size + 1];
		int seqOfQues = 1;
		for (Questions getAnswers : ques) {
			solutions[seqOfQues] = getAnswers.getAnswer();
			seqOfQues++;
		}

		ModelAndView model = new ModelAndView("displayquestions");
		int myhr = 0, mymin = 20, mysec = 0;
		registration = (Registration) httpSession.getAttribute("SESSION");
		model.addObject("sessionName", registration.getName());
		model.addObject("sessionrollNo", registration.getRollno());
		model.addObject("myhr", myhr);
		model.addObject("mymin", mymin);
		model.addObject("mysec", mysec);
		model.addObject("ques", ques);
		return model;

	}

	@RequestMapping(value = "/sessionSubmitSolution", method = RequestMethod.POST)
	public ModelAndView submitSolution(HttpSession httpSession, HttpServletRequest request) {
		ModelAndView model = new ModelAndView("solutionsubmit");
		int marks = 0, countCorrect = 0, countWrong = 0, countUnanswered = 0;
		for (int j = 1; j < solutions.length; j++) {
			String nameid = "ques" + Integer.toString(j);
			String participantSolution = request.getParameter(nameid);
			if (participantSolution != null) {
				if (solutions[j].equals(participantSolution)) {
					marks += 3;
					countCorrect += 1;
				} else {
					marks -= 1;
					countWrong += 1;
				}

			} else {
				countUnanswered += 1;
			}
		}
		registration = (Registration) httpSession.getAttribute("SESSION");
		Session session = sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		registration.setCorrectAnswered(countCorrect);
		registration.setWrongAnswered(countWrong);
		registration.setNotAnswered(countUnanswered);
		registration.setNetMarks(marks);
		session.update(registration);
		tx.commit();
		session.close();
		model.addObject("marks", marks);
		model.addObject("sessionName", registration.getName());
		httpSession.invalidate();
		return model;
	}

	@RequestMapping(value = "/sessionLogoutController", method = RequestMethod.POST)
	public ModelAndView LogoutController(HttpSession httpSession) {
		httpSession.invalidate();
		ModelAndView model = new ModelAndView("index");
		return model;
	}
}
