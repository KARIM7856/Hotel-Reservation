

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
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
		
		Session sess = HibernateUtil.getInstance().getSession();
		
		Query q = sess.createQuery("select u.password from User u where u.username= :username");
		q.setParameter("username", username);
		List res = q.list();
		String dbPwdHash = (String) res.get(0);
		
		if(pwdHash.equals(dbPwdHash)) {
			response.sendRedirect("UserHome.jsp");
			System.out.println("sucess");
		}
		else {
			response.sendRedirect("index.html");
			System.out.println("fail");
		}
	}

}
