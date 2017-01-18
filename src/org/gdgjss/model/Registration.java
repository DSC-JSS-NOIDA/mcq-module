package org.gdgjss.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.stereotype.Repository;

/**
 * Entity set: Registration of participation.
 * 
 * @author Tilhari
 *
 */
@Repository
@Entity
public class Registration {

	private String name;
	private String college;
	private String branch;
	@Id
	private String rollno;
	private String labno;
	private String contact;
	private String email;
	private String pass;
	private int netMark;
	private int rgtAns;
	private int wngAns;
	private int notAns;
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
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getNetMark() {
		return netMark;
	}
	public void setNetMark(int netMark) {
		this.netMark = netMark;
	}
	public int getRgtAns() {
		return rgtAns;
	}
	public void setRgtAns(int rgtAns) {
		this.rgtAns = rgtAns;
	}
	public int getWngAns() {
		return wngAns;
	}
	public void setWngAns(int wngAns) {
		this.wngAns = wngAns;
	}
	public int getNotAns() {
		return notAns;
	}
	public void setNotAns(int notAns) {
		this.notAns = notAns;
	}

	
}