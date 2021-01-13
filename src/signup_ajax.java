

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import IA_Project.WebData.User;
import IA_Project.Util.*;

/**
 * Servlet implementation class signup_ajax
 */
@WebServlet("/signup_ajax")
public class signup_ajax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signup_ajax() {
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
		try {
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String toEmail = request.getParameter("email");
		
		Session sess = HibernateUtil.getInstance().getSession();
		
		Criteria c = sess.createCriteria(User.class);
		
		c.add(Restrictions.eq("username", username));
		
		List<User> us = c.list();
		if(!us.isEmpty()) {
			out.print("user name is taken");
		}
		c = sess.createCriteria(User.class);
		
		c.add(Restrictions.eq("email", toEmail));
		List<User> us2 = c.list();
		
		if(!us2.isEmpty()) {
			out.print("email is taken");
		}
		
		else
		{
			out.print("user name and email are taken");
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
