package IA_Project.WebData;
import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Reservation implements java.io.Serializable {
	@Id
	@GeneratedValue
	int rid;
	@ManyToOne
	Hotel hotel;
	@ManyToOne
	User user;
	
	@OneToMany(mappedBy="r")
	List<RoomInfo> roomInfos;
	boolean active;
	boolean cancelled;
	boolean paid;
	double price;
	Date checkIn;
	Date expectedCheckOut;
	Date actualCheckOut;
	Date actualCheckin;
	
	public Reservation() {
		
	}
	/**
	 * @param hotel
	 * @param user
	 * @param roomInfos
	 * @param active
	 * @param cancelled
	 * @param paid
	 * @param price
	 * @param checkIn
	 * @param expectedCheckOut
	 */
	public Reservation(Hotel hotel, User user, boolean active, boolean cancelled,
			boolean paid, double price, Date checkIn, Date expectedCheckOut) {
		super();
		this.hotel = hotel;
		this.user = user;
		this.active = active;
		this.cancelled = cancelled;
		this.paid = paid;
		this.price = price;
		this.checkIn = checkIn;
		this.expectedCheckOut = expectedCheckOut;
	}
	
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public Hotel getHotel() {
		return hotel;
	}
	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<RoomInfo> getRoomInfos() {
		return roomInfos;
	}
	public void setRoomInfos(List<RoomInfo> roomInfos) {
		this.roomInfos = roomInfos;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public boolean isCancelled() {
		return cancelled;
	}
	public void setCancelled(boolean cancelled) {
		this.cancelled = cancelled;
	}
	public boolean isPaid() {
		return paid;
	}
	public void setPaid(boolean paid) {
		this.paid = paid;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Date getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}
	public Date getExpectedCheckOut() {
		return expectedCheckOut;
	}
	public void setExpectedCheckOut(Date expectedCheckOut) {
		this.expectedCheckOut = expectedCheckOut;
	}
	public Date getActualCheckOut() {
		return actualCheckOut;
	}
	public void setActualCheckOut(Date actualCheckOut) {
		this.actualCheckOut = actualCheckOut;
	}
	public void updatePrice() {
		long nDays = (getExpectedCheckOut().getTime() - getCheckIn().getTime())/(1000 * 60 * 60 * 24) % 365;
		
		double price = 0.0;
		
		
		
		for(RoomInfo ri : roomInfos) {
			System.out.println(ri.getnRooms());
			price += ri.getnRooms()*ri.getRoom().getPrice()*nDays;
		}
		System.out.println(price);
		this.price = price;
	}
	public Date getActualCheckin() {
		return actualCheckin;
	}
	public void setActualCheckin(Date actualCheckin) {
		this.actualCheckin = actualCheckin;
	}
	
	
	
	
	
	
}
