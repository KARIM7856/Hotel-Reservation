

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;

import IA_Project.Util.HibernateUtil;

/**
 * Servlet implementation class checkoldpassword_ajax
 */
@WebServlet("/checkoldpassword_ajax")
public class checkoldpassword_ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkoldpassword_ajax() {
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
		System.out.println("check called");
		String oldpassword = request.getParameter("oldpassword1");
		String email = request.getParameter("email1");
		
		String oldpasswordHash = WebsiteSecurity.passwordDigest(oldpassword);
		
		
		
		Session sess = HibernateUtil.getInstance().getSession();
		
		Query q = sess.createQuery("select r.passwordHash from User r where r.passwordHash= :oldpasswordHash and r.email= :email");
		q.setParameter("oldpasswordHash", oldpasswordHash);
		q.setParameter("email", email);
		List<Object> p = q.list();
		response.setContentType("text/plain");
		if(!p.isEmpty()) {
			response.getWriter().write("");
		}
		else {
			response.getWriter().write("Old password is wrong");
		}
	}

}
