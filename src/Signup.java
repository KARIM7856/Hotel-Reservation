

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;
/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
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
		PrintWriter out = response.getWriter();

        String s = request.getParameter("g-recaptcha-response");
        boolean captchaSuccess = VerifyRecaptcha.verify(s);
        
        if(captchaSuccess) {
        	String toEmail = request.getParameter("email");
        	PasswordGenerator pwdGenerator = new PasswordGenerator.PasswordGeneratorBuilder()
        			.useLower(true).useUpper(true).useDigits(true).usePunctuation(true).build();
        	
        	String tempPwd = pwdGenerator.generate(10);
        	
        	String body = EmailHandler.getPwdEmailBody(tempPwd);
        	String subject = "One-time Password";
        	
        	EmailHandler.sendEmail(toEmail, subject, body);
        	
        	response.sendRedirect("index.html");
        }
        else{
        	
        	response.sendRedirect("Signup.jsp?" + "error=Captcha failed");
        }
	}
	
	
	
	
	

}
