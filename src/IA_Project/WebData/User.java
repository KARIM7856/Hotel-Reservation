package IA_Project.WebData;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4063058446553533146L;
	@Id
	@GeneratedValue
	int aid;
	Name name;
	@Column(name="username")
	String username;
	@Column(name="password")
	String passwordHash;
	String phonenumber;
	String email;
	String type;
	
	@OneToMany(mappedBy="hotel")
	List<Reservation> reservations;
	@OneToMany(mappedBy="hotel")
	List<Rate> givenRates;
	
	/**
	 * @param name
	 * @param password
	 */
	public User(String name, String password) {
		super();
		this.username = name;
		this.passwordHash = password;
	}
	
	/**
	 * @param aid
	 * @param name
	 * @param username
	 * @param password
	 * @param phonenumber
	 * @param email
	 * @param type
	 */
	public User(Name name, String username, String password, String phonenumber, String email, String type) {
		super();
		this.name = name;
		this.username = username;
		this.passwordHash = password;
		this.phonenumber = phonenumber;
		this.email = email;
		this.type = type;
	}
	public User() {
		
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public Name getName() {
		return name;
	}

	public void setName(Name name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPasswordHash() {
		return passwordHash;
	}

	public void setPasswordHash(String passwordHash) {
		this.passwordHash = passwordHash;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<Reservation> getReservations() {
		return reservations;
	}

	public void setReservations(List<Reservation> reservations) {
		this.reservations = reservations;
	}

	public List<Rate> getGivenRates() {
		return givenRates;
	}

	public void setGivenRates(List<Rate> givenRates) {
		this.givenRates = givenRates;
	}

	@Override
	public String toString() {
		return "User [aid=" + aid + ", name=" + name + ", username=" + username + ", passwordHash=" + passwordHash
				+ ", phonenumber=" + phonenumber + ", email=" + email + ", type=" + type + ", reservations="
				+ reservations + ", givenRates=" + givenRates + "]";
	}


	
	
}
