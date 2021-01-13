

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import IA_Project.Util.HibernateUtil;
import IA_Project.WebData.Reservation;

/**
 * Servlet implementation class managereservations
 */
@WebServlet("/managereservations")
public class managereservations extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public managereservations() {
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
		String ridS = request.getParameter("selectedreservation");
		int rid=0;
		if(ridS != null)
			rid = Integer.parseInt(ridS);
		Reservation res = HibernateUtil.getInstance().loadReservation(rid);
		res.getRoomInfos();
		request.getSession(false).setAttribute("currentReservation", res);
		
		if(request.getParameter("update") != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("updatereservation.jsp");
			dispatcher.forward(request, response);
		}
		else if(request.getParameter("delete") != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("deletereservation");
			dispatcher.forward(request,response);
		}
		else if(request.getParameter("confirmpayment")!= null){
			RequestDispatcher dispatcher = request.getRequestDispatcher("confirmpayment");
			dispatcher.forward(request,response);
		}
		else if(request.getParameter("checkin")!= null){
			RequestDispatcher dispatcher = request.getRequestDispatcher("checkinreservation");
			dispatcher.forward(request,response);
		}
		else if(request.getParameter("checkout")!= null){
			RequestDispatcher dispatcher = request.getRequestDispatcher("checkoutreservation");
			dispatcher.forward(request,response);
		}
	}

}
