

import java.io.IOException;
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
 * Servlet implementation class confirmpayment
 */
@WebServlet("/confirmpayment")
public class confirmpayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public confirmpayment() {
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
		reservation.setPaid(true);
		Transaction t = sess.beginTransaction();
		sess.update(reservation.getHotel());
		sess.update(reservation);
		t.commit();
		sess.close();
		response.getWriter().println("reservation confirmed");
		response.sendRedirect("currentreservations.jsp");
	}

}
