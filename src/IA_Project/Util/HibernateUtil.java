package IA_Project.Util;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import IA_Project.WebData.*;

public class HibernateUtil {
	private static HibernateUtil instance;
	private static SessionFactory sessionFactory = null;
	private HibernateUtil() {
		sessionFactory = new Configuration().configure().addAnnotatedClass(User.class)
		.addAnnotatedClass(Hotel.class).addAnnotatedClass(Room.class).addAnnotatedClass(Reservation.class)
		.addAnnotatedClass(RoomInfo.class).addAnnotatedClass(Notification.class)
		.addAnnotatedClass(Rate.class).addAnnotatedClass(Name.class).buildSessionFactory();
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
	public Session getCurrentSesssion() {
		return sessionFactory.getCurrentSession();
	}
	
	public void saveUser(User u) {
		Session sess = getSession();
		Transaction t = sess.beginTransaction();
		
		sess.save(u);
		
		t.commit();
	}
	public void updateUser(User u ) {
		Session session;
        try {
            session = sessionFactory.getCurrentSession();
        } catch (HibernateException ex) {
            session = sessionFactory.openSession();
        }
        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();
            session.update(u);
            transaction.commit();
        } catch (HibernateException ex) {
            System.out.println("Error deleting car: " + ex);
            if(transaction != null) {
                transaction.rollback();
            }
        } finally {
            if (session.isOpen()){
                session.close();
            }
        }
	}
	
	public void updateRoom(Room r ) {
		Session session;
        try {
            session = sessionFactory.getCurrentSession();
        } catch (HibernateException ex) {
            session = sessionFactory.openSession();
        }
        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();
            session.update(r.getHotel());
            session.update(r);
            transaction.commit();
        } catch (HibernateException ex) {
            System.out.println("Error deleting car: " + ex);
            if(transaction != null) {
                transaction.rollback();
            }
        } finally {
            if (session.isOpen()){
                session.close();
            }
        }
	}
	
	public Hotel loadHotel(int hid) {
		Session sess = getSession();
		Hotel hotel = (Hotel)sess.load(Hotel.class, hid);
		sess.close();
		return hotel;
	}
	public void updateResrvation(Reservation r) {
		System.err.println("udaaateR");
		Session session;

        session = sessionFactory.openSession();
        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();
            session.evict(r);
            session.clear();
            session.merge(r);
            session.update(r.getHotel());
            session.update(r);
            transaction.commit();
        } catch (HibernateException ex) {
        	ex.printStackTrace();
            System.out.println("Error deleting car: " + ex);
            if(transaction != null) {
                transaction.rollback();
            }
        } finally {
            if (session.isOpen()){
                session.close();
            }
        }
	}
	public Reservation loadReservation(int rid) {
		// TODO Auto-generated method stub
		Session sess = getSession();
		Reservation reservation = (Reservation)sess.get(Reservation.class, rid);
		//System.out.println("fdsf"+reservation.getRoomInfos());
		sess.close();
		
		return reservation;
	}
	public void updateHotel(Hotel h) {
		// TODO Auto-generated method stub
		Session session;

        session = sessionFactory.openSession();
        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();

            session.update(h);
            transaction.commit();
        } catch (HibernateException ex) {
        	ex.printStackTrace();
            System.out.println("Error deleting car: " + ex);
            if(transaction != null) {
                transaction.rollback();
            }
        } finally {
            if (session.isOpen()){
                session.close();
            }
        }
	}
}
