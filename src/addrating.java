

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
import IA_Project.WebData.Hotel;
import IA_Project.WebData.Rate;
import IA_Project.WebData.User;

/**
 * Servlet implementation class addrating
 */
@WebServlet("/addrating")
public class addrating extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addrating() {
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
		
		String rating = request.getParameter("rating");
		int ratingI = Integer.parseInt(rating);
		Hotel hotel = (Hotel) request.getSession(false).getAttribute("currentHotel");
		User user = (User) request.getSession(false).getAttribute("currentUser");
		
		Date date = new Date(java.util.Calendar.getInstance().getTime().getTime());
		
		String comment = request.getParameter("ratecomment");
		
		Rate rate = new Rate(user,hotel,comment,ratingI,date);
		
		Session sess = HibernateUtil.getInstance().getSession();
		Transaction t = sess.beginTransaction();
		
		
		//hotel.addRating(rate);
		
		sess.save(rate);
		double avgRate = (double) sess.createQuery("Select avg(r.rate) from Rate r").getSingleResult();
		System.out.println("rate: " + avgRate);
		hotel.setUserRating(avgRate);
		sess.update(hotel);
		t.commit();
		
		sess.close();
		
	}

}
