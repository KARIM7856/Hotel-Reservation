import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.DynamicUpdate;

@Entity
public class UserT {
	@Id
	int aid;
	@Column(name="username")
	String userName;
	@Column(name="password")
	String Password2;
	
	/**
	 * @param name
	 * @param password
	 */
	public UserT(String name, String password) {
		super();
		userName = name;
		Password2 = password;
	}
	public String getName() {
		return userName;
	}
	public void setName(String name) {
		userName = name;
	}
	public String getPassword() {
		return Password2;
	}
	public void setPassword(String password) {
		Password2 = password;
	}
	
	
}
