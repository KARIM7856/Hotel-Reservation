import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Reservation {
	@Id
	@GeneratedValue
	int rid;
	@ManyToOne
	Hotel hotel;
	@ManyToOne
	Room room;
	@ManyToOne
	User user;
	boolean active;
	boolean cancelled;
	boolean paid;
	double price;
	Date checkIn;
	Date expectedCheckOut;
	Date actualCheckOut;
}
