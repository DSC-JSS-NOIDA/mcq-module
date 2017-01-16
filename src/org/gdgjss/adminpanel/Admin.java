package org.gdgjss.adminpanel;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.stereotype.Repository;

/**
 * Entity for admin rights of the project
 * @author Tilhari
 *
 */
@Repository
@Entity
public class Admin {
	@Id
	private String username;
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
