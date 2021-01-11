package IA_Project.WebData;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.JoinColumn;
//secret key: 6Lfv7yEaAAAAAHxUWxL4yVvuGGHv3DJKq6fmOCwR
@Entity
public class Hotel implements java.io.Serializable {
	@Id
	@GeneratedValue
	int hid;
	double price;
	double userRating;
	double distanceToCityCenter;
	double stars;
	String name;
	String address;
	String city;
	String country;
	
	@ElementCollection
	@CollectionTable(name="inculded_meals", joinColumns= @JoinColumn(name="hid"))
	@Column(name="meals")
	List<String> includingMeals;
	@OneToMany(mappedBy="hotel")
	List<Rate> rates;
	
	@OneToMany(mappedBy="hotel")
	List<Room> rooms ;           
	@OneToMany(mappedBy="hotel")
	List<Reservation> reservations;
	@ElementCollection
	@CollectionTable(name="hotel_images", joinColumns=@JoinColumn(name="hid"))
	@Column(name="image")
	List<String> images;
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getUserRating() {
		return userRating;
	}
	public void setUserRating(double userRating) {
		this.userRating = userRating;
	}
	public double getDistanceToCityCenter() {
		return distanceToCityCenter;
	}
	public void setDistanceToCityCenter(double distanceToCityCenter) {
		this.distanceToCityCenter = distanceToCityCenter;
	}
	public double getStars() {
		return stars;
	}
	public void setStars(double stars) {
		this.stars = stars;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public List<String> getIncludingMeals() {
		return includingMeals;
	}
	public void setIncludingMeals(List<String> includingMeals) {
		this.includingMeals = includingMeals;
	}
	public List<Rate> getRates() {
		return rates;
	}
	public void setRates(List<Rate> rates) {
		this.rates = rates;
	}
	public List<Reservation> getReservations() {
		return reservations;
	}
	public void setReservations(List<Reservation> reservations) {
		this.reservations = reservations;
	}
	public List<String> getImages() {
		return images;
	}
	public void setImages(List<String> images) {
		this.images = images;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Room> getRooms() {
		return rooms;
	}
	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}
	
	
}
