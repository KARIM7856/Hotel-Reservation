package IA_Project.WebData;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
@Entity
public class Rate {
	@Id
	@GeneratedValue
	int rid;
	@ManyToOne
	User user;
	@ManyToOne
	Hotel hotel;
	String comment;
	double rate;
	Date date;
	public Rate() {
		
	}
	
	
	
	/**
	 * @param user
	 * @param hotel
	 * @param comment
	 * @param rate
	 * @param date
	 */
	public Rate(User user, Hotel hotel, String comment, double rate, Date date) {
		super();
		this.user = user;
		this.hotel = hotel;
		this.comment = comment;
		this.rate = rate;
		this.date = date;
	}



	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Hotel getHotel() {
		return hotel;
	}
	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
}
