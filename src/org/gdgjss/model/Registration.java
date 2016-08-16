package org.gdgjss.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.stereotype.Repository;
/**
 * Entity set: Registration of participation.
 * @author Tilhari
 *
 */
@Repository
@Entity
public class Registration {

	private String name;
	private String college;
	private String branch;
	private String rollno;
	private String labno;
	private String contact;
	@Id
	private String email;
	private String password;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getRollno() {
		return rollno;
	}

	public void setRollno(String rollno) {
		this.rollno = rollno;
	}

	public String getLabno() {
		return labno;
	}

	public void setLabno(String labno) {
		this.labno = labno;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
