

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import IA_Project.Util.HibernateUtil;
import IA_Project.WebData.Hotel;
import java.util.List;

/**
 * Servlet implementation class updatehotel
 */
@WebServlet("/updatehotel")
public class updatehotel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatehotel() {
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
		
		String address = request.getParameter("address");
		Hotel hotel = (Hotel)request.getSession(false).getAttribute("currentHotel");
		String[] meals = request.getParameterValues("meal");
		
		List<String> newMeals =  new ArrayList<String>();
		
		for(String m : meals) {
			newMeals.add(m);
		}
		hotel.setIncludingMeals(newMeals);
		hotel.setAddress(address);
		
		Session sess = HibernateUtil.getInstance().getSession();
		Transaction t = sess.beginTransaction();
		
		sess.update(hotel);
		
		t.commit();
		sess.close();
		
		response.sendRedirect("updatehotel.jsp");
	}

}
