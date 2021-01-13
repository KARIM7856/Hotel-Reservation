

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import IA_Project.Util.HibernateUtil;
import IA_Project.WebData.Hotel;

/**
 * Servlet implementation class deleteimages
 */
@WebServlet("/deleteimages")
public class deleteimages extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteimages() {
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
		
		String[] imgsToDelete = request.getParameterValues("selectedimages");
		
		System.out.println(imgsToDelete);
		Hotel hotel = (Hotel)request.getSession(false).getAttribute("currentHotel");
		
		
		List<String> imgs = (List<String>) request.getSession(false).getAttribute("currentImages");
		for(String s : imgsToDelete) {
			imgs.remove(s);
		}
		System.out.print(imgs);
		
		hotel.setImages(imgs);
		
		HibernateUtil.getInstance().updateHotel(hotel);
		response.sendRedirect("hotelphotosupdate.jsp");
	}

}
