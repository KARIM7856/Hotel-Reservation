import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	private static HibernateUtil instance;
	private static SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(User.class)
			.addAnnotatedClass(Hotel.class).addAnnotatedClass(Room.class).addAnnotatedClass(Reservation.class)
			.addAnnotatedClass(Rate.class).addAnnotatedClass(Name.class).buildSessionFactory();
	private HibernateUtil() {
		
	}
	public static HibernateUtil getInstance() {
		if (instance == null) {
			instance = new HibernateUtil();
		}
		return instance;
	}
	public Session getSession() {

       
        return sessionFactory.openSession();
    }
	
	public void saveUser(User u) {
		Session sess = getSession();
		Transaction t = sess.beginTransaction();
		
		sess.save(u);
		
		t.commit();
	}
}
