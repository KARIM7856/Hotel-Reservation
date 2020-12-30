import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Room {
	@Id
	int rid;
	
	int roomNumber;
	@ManyToOne
	Hotel hotel;
	int nBeds;
	String type;
}
