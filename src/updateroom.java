

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import IA_Project.Util.HibernateUtil;
import IA_Project.WebData.Hotel;
import IA_Project.WebData.Room;

/**
 * Servlet implementation class updateroom
 */
@WebServlet("/updateroom")
public class updateroom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateroom() {
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
		
		Hotel hotel = (Hotel)request.getSession(false).getAttribute("currentHotel");
		
		int rid = Integer.parseInt(request.getParameter("selectedroom"));
		
		Room room;
		String type = request.getParameter("type");
		String nBedsS = request.getParameter("nbeds");
		String nRoomsS = request.getParameter("nrooms");
		String priceS = request.getParameter("price");
		
		int nBeds = Integer.parseInt(nBedsS);
		int nRooms = Integer.parseInt(nRoomsS);
		
		double price = Double.parseDouble(priceS);
		
		Session sess = HibernateUtil.getInstance().getSession();
		Transaction t = sess.beginTransaction();
		room = sess.get(Room.class, rid);
		
		t.commit();
		sess.close();
		
		room.setnBeds(nBeds);
		room.setnRooms(nRooms);
		room.setPrice(price);
		room.setType(type);
		System.out.println(room);
		HibernateUtil.getInstance().updateRoom(room);;
		
		
		response.sendRedirect("updatehotel.jsp");
	}

}
