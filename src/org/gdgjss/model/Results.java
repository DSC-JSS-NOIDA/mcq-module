package org.gdgjss.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.springframework.stereotype.Repository;
/**
 * One to one mapped entity for results of test.
 * @author Tilhari
 *
 */
@Repository
@Entity
public class Results implements Serializable {
	@OneToOne
	private Registration registration;
	private int netMarks;
	private int correctAnswered;
	private int wrongAnswered;
	private int notAnswered;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int result_id;
	public Registration getRegistration() {
		return registration;
	}
	public void setRegistration(Registration registration) {
		this.registration = registration;
	}
	public int getNetMarks() {
		return netMarks;
	}
	public void setNetMarks(int netMarks) {
		this.netMarks = netMarks;
	}
	public int getCorrectAnswered() {
		return correctAnswered;
	}
	public void setCorrectAnswered(int correctAnswered) {
		this.correctAnswered = correctAnswered;
	}
	public int getWrongAnswered() {
		return wrongAnswered;
	}
	public void setWrongAnswered(int wrongAnswered) {
		this.wrongAnswered = wrongAnswered;
	}
	public int getNotAnswered() {
		return notAnswered;
	}
	public void setNotAnswered(int notAnswered) {
		this.notAnswered = notAnswered;
	}
	public int getResult_id() {
		return result_id;
	}
	public void setResult_id(int result_id) {
		this.result_id = result_id;
	}
	
	

}	