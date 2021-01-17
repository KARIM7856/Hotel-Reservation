

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.Transaction;

import IA_Project.Util.HibernateUtil;
import IA_Project.WebData.Notification;

import org.json.JSONObject;
import org.json.JSONArray;;

/**
 * Servlet implementation class notification_ajax
 */
@WebServlet("/notification_ajax")
public class notification_ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public notification_ajax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		

		JSONArray gsonArray = null;
			
		ArrayList<JSONObject> arr = new ArrayList<JSONObject>();
		List<Notification> nl;
		System.out.println("notification called");
		Session sess = HibernateUtil.getInstance().getSession();
		Transaction t = sess.beginTransaction();
		Criteria c = sess.createCriteria(Notification.class);
		c.add(Restrictions.eq("isFetched",false));
		nl = c.list();
		
		for(Notification n : nl) {
			JSONObject gson = new JSONObject();
			gson.put("seen", n.getSeen());
			gson.put("msg", n.getMessage());
			arr.add(gson);
			n.setFetched(true);
			sess.saveOrUpdate(n);
		}
		t.commit();
		sess.close();
		
		
		gsonArray = new JSONArray(arr);
	    response.setContentType("text/json");  // Set content type of the response so that jQuery knows what it can expect.
	    response.setCharacterEncoding("UTF-8");
	    //response.getWriter().println("fsd");
	    System.out.println(gsonArray);
		response.getWriter().println(gsonArray);
		
	}

}
