import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {
	@Id
	@GeneratedValue
	int aid;
	Name name;
	@Column(name="username")
	String username;
	@Column(name="password")
	String password;
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
		this.password = password;
	}
	public String getName() {
		return username;
	}
	public void setName(String name) {
		this.username = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
