

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import IA_Project.Util.HibernateUtil;
import IA_Project.WebData.Reservation;

/**
 * Servlet implementation class checkinreservation
 */
@WebServlet("/checkinreservation")
public class checkinreservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkinreservation() {
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
		Session sess = HibernateUtil.getInstance().getSession();
		reservation.setActualCheckin(new Date(java.util.Calendar.getInstance().getTimeInMillis()));
		Transaction t = sess.beginTransaction();
		sess.update(reservation.getHotel());
		sess.update(reservation);
		t.commit();
		sess.close();
		response.getWriter().println("reservation checkin");
		
		response.sendRedirect("currentreservations.jsp");
	}

}
