

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Transaction;

import IA_Project.WebData.Name;
import IA_Project.WebData.User;
import IA_Project.Util.*;

import org.hibernate.Session;

/**
 * Servlet implementation class UpdateUser
 */
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {
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
		
		User user = (User) request.getSession(false).getAttribute("currentUser");
		String email = request.getParameter("email");
    	String fname = request.getParameter("fname");
    	String mname = request.getParameter("mname");
    	String lname = request.getParameter("lname");
    	String phonenumber = request.getParameter("phonenumber");
    	String oldPassword = request.getParameter("oldpassword");
    	String newPassword = request.getParameter("newpassword");
    	
    	//generate and hash password
    	Name name = new Name();
    	name.setfName(fname);
    	name.setmName(mname);
    	name.setlName(lname);
    	
    	if(oldPassword.length() > 6) {
    		String oldPasswordHash = WebsiteSecurity.passwordDigest(oldPassword);
    		System.out.println(oldPasswordHash);
    		if(oldPasswordHash.equals(user.getPasswordHash())) {
    			String newPasswordHash = WebsiteSecurity.passwordDigest(newPassword);
    			user.setPasswordHash(newPasswordHash);
    			System.out.println("Password set");
    		}
    	}
    	
    	user.setEmail(email);
    	user.setPhonenumber(phonenumber);
    	user.setName(name);
    	System.out.println(phonenumber);
    	HibernateUtil.getInstance().updateUser(user);
    	response.sendRedirect("UserProfile.jsp");
	}

}
