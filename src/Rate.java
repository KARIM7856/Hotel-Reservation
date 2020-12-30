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
	int rate;
	Date date;

}
