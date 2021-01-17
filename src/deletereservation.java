

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import IA_Project.Util.HibernateUtil;
import IA_Project.WebData.Notification;
import IA_Project.WebData.Reservation;
import IA_Project.WebData.User;

/**
 * Servlet implementation class deletereservation
 */
@WebServlet("/deletereservation")
public class deletereservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletereservation() {
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
		
		
		
		
		User user = reservation.getUser();
		Session sess = HibernateUtil.getInstance().getSession();
		reservation.setCancelled(true);
		reservation.setActive(false);
		Transaction t = sess.beginTransaction();
		User currentUser = (User) request.getSession(false).getAttribute("currentUser");
		if(currentUser.getType().equals("user")) {
			System.out.println("user");
			String emailBody = EmailHandler.getCancellingEmailBody(user.getName(),user.getUsername(),reservation.getHotel().getName());
			EmailHandler.sendEmail("g.karim1998@yahoo.com", "user deleted " + reservation.getHotel().getName(), emailBody);
		}
		else {
			System.out.println("la2a");
		}
		sess.update(reservation.getHotel());
		sess.update(reservation);
		sess.save(new Notification(user.getUsername() + "Deleted his/her reservation to hotel"
									+ reservation.getHotel().getName()));
		t.commit();
		sess.close();
		response.getWriter().println("reservation deleted");
		
		response.sendRedirect("managereservations.jsp");
	}

}
