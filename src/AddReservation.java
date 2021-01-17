

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
import IA_Project.WebData.Reservation;
import IA_Project.WebData.Room;
import IA_Project.WebData.RoomInfo;
import IA_Project.WebData.User;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
/**
 * Servlet implementation class AddReservation
 */
@WebServlet("/AddReservation")
public class AddReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReservation() {
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
		Hotel currentHotel = (Hotel)request.getSession(false).getAttribute("currentHotel");
		User currentUser = (User)request.getSession(false).getAttribute("currentUser");
		
		List<Room> rooms = currentHotel.getRooms();
		List<RoomInfo>roomInfoList = new ArrayList<RoomInfo>();
		
		Date checkin = (Date)request.getSession(false).getAttribute("checkin");
		Date checkout = (Date)request.getSession(false).getAttribute("checkout");
		Reservation res = new Reservation(currentHotel,currentUser,true,false,false,1000,checkin,checkout);
		currentUser.getReservations().add(res);
		
		for(Room r : rooms) {
			int nRooms = Integer.parseInt(request.getParameter("room"+r.getRid()));
			if(nRooms > 0) {
				roomInfoList.add(new RoomInfo(r,nRooms,res));
			}
		}
		res.setRoomInfos(roomInfoList);
		res.updatePrice();
		Session sess = HibernateUtil.getInstance().getSession();
		Transaction t = sess.beginTransaction();
		
		
		sess.save(res);
		for(RoomInfo rinfo : roomInfoList) {
			System.out.println(rinfo);
			sess.saveOrUpdate(rinfo);
			sess.flush();
			sess.clear();
		}
		
		//sess.save(res.getRoomInfos());
		
		t.commit();
		sess.close();
		
		System.out.print(checkin + " " + checkout);
		
		response.sendRedirect("UserHome.jsp");
	}

}
