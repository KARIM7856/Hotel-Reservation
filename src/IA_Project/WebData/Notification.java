package IA_Project.WebData;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Notification {
	@Id
	@GeneratedValue
	int id;
	
	String message;
	boolean isFetched=false;

	private boolean seen;
	
	public Notification(){
		
	}
	
	
	
	/**
	 * @param id
	 * @param message
	 * @param isFetched
	 */
	public Notification(String message) {
		super();
		this.message = message;
		this.isFetched = false;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public boolean isFetched() {
		return isFetched;
	}
	public void setFetched(boolean isFetched) {
		this.isFetched = isFetched;
	}
	
	@Override
	public String toString() {
		return this.message;
	}



	public boolean getSeen() {
		// TODO Auto-generated method stub
		return this.seen;
	}
	
	
	
}
