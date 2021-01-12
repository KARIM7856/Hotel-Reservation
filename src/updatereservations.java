

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

import IA_Project.Util.HibernateUtil;
import IA_Project.WebData.Reservation;
import IA_Project.WebData.RoomInfo;
import IA_Project.WebData.User;

/**
 * Servlet implementation class updatereservation
 */
@WebServlet("/updatereservations")
public class updatereservations extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatereservations() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		Reservation reservation = (Reservation) request.getSession(false).getAttribute("currentReservation");
		
		System.out.println(reservation);
		String checkinS = request.getParameter("newcheckin");
		String checkoutS = request.getParameter("newcheckout");
		
		
		
		Date checkinD = Date.valueOf(checkinS);
		Date checkoutD = Date.valueOf(checkoutS);
		
		reservation.setCheckIn(checkinD);
		reservation.setExpectedCheckOut(checkoutD);
		System.out.println(checkoutD);
		
		long nDays = reservation.getCheckIn().getTime() - reservation.getExpectedCheckOut().getTime()/(1000 * 60 * 60 * 24) % 365;
		
		double price = 0.0;
		
		
		
		for(RoomInfo ri : reservation.getRoomInfos()) {
			price += ri.getnRooms()*ri.getRoom().getPrice()*nDays;
		}
		reservation.setPrice(price);
		//reservation.updatePrice();
		Session sess = HibernateUtil.getInstance().getSession();
		Transaction t = sess.beginTransaction();
		sess.update(reservation.getHotel());
		sess.update(reservation);
		t.commit();
		sess.close();
		
	}

}
