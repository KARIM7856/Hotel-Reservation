package IA_Project.WebData;
import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Room implements java.io.Serializable {
	@Id
	int rid;
	
	int nRooms;
	@ManyToOne
	Hotel hotel;
	int nBeds;
	String type;
	double price;
	
	
	
	public int getRid() {
		return rid;
	}



	public void setRid(int rid) {
		this.rid = rid;
	}



	public int getnRooms() {
		return nRooms;
	}



	public void setnRooms(int nRooms) {
		this.nRooms = nRooms;
	}



	public Hotel getHotel() {
		return hotel;
	}



	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}



	public int getnBeds() {
		return nBeds;
	}



	public void setnBeds(int nBeds) {
		this.nBeds = nBeds;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}

	

	public double getPrice() {
		return price;
	}



	public void setPrice(double price) {
		this.price = price;
	}



	@Override
	public String toString() {
		return "Room [rid=" + rid + ", roomNumber=" + nRooms + ", hotel=" + hotel + ", nBeds=" + nBeds + ", type="
				+ type + "]";
	}
	
	
}
