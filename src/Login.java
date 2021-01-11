

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import IA_Project.WebData.*;
import IA_Project.Util.*;
/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String pwd = request.getParameter("password1");
		System.out.println(pwd);
		String username = request.getParameter("username1");
		
		String pwdHash = WebsiteSecurity.passwordDigest(pwd);
		System.out.println(pwdHash);
		Session sess = HibernateUtil.getInstance().getSession();
		
		Query q = sess.createQuery("select u.passwordHash, u.type, u.aid from User u where u.username= :username");
		q.setParameter("username", username);
		List<Object[]> res = q.list();
		
		String dbPwdHash = (String) res.get(0)[0];
		String type = (String) res.get(0)[1];
		int aid = (Integer) res.get(0)[2];
		if(pwdHash.equals(dbPwdHash)) {
			User user = (User)sess.load(User.class, aid);
			System.out.println(user);
			HttpSession requestSession = request.getSession(true);

			System.out.println(requestSession.getId());
			requestSession.setAttribute("currentUser", user);
			switch(type) {
			case "user":
				response.sendRedirect("UserHome.jsp");
				break;
			case "admin":
				response.sendRedirect("AdminHome.jsp");
				break;
			
			}
			System.out.println("sucess");
			
			sess.close();
		}
		else {
			response.sendRedirect("index.html");
			System.out.println("fail");
		}
	}

}
