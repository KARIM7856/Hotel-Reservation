package IA_Project.WebData;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class RoomInfo implements java.io.Serializable{
	@Id
	@GeneratedValue
	int rid;
	@ManyToOne
	Room room;
	@ManyToOne
	Reservation r;
	int nRooms;
	/**
	 * @param rid
	 * @param room
	 * @param nRooms
	 */
	public RoomInfo(Room room, int nRooms) {
		super();
		this.room = room;
		this.nRooms = nRooms;
	}
	
	public RoomInfo() {
		
	}
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public int getnRooms() {
		return nRooms;
	}
	public void setnRooms(int nRooms) {
		this.nRooms = nRooms;
	}
	
	
}
