

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.output.*;
import org.hibernate.Hibernate;

import IA_Project.Util.HibernateUtil;
import IA_Project.WebData.Hotel;

/**
 * Servlet implementation class uploadphotos
 */
@WebServlet("/uploadphotos")
public class uploadphotos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadphotos() {
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
		List<String> paths = new ArrayList<String>();
		
		System.out.println("new");
		File file ;
		   int maxFileSize = 5000 * 1024;
		   int maxMemSize = 5000 * 1024;
		   ServletContext context = getServletContext();
		   String filePath = "C:\\Users\\gkari\\javatry\\IA_Project\\hotel_imgs\\";
		   System.err.println(filePath);
		   // Verify the content type
		   String contentType = request.getContentType();
		   
		   if ((contentType.indexOf("multipart/form-data") >= 0)) {
			   System.out.println("multif");
		      DiskFileItemFactory factory = new DiskFileItemFactory();
		      // maximum size that will be stored in memory
		      factory.setSizeThreshold(maxMemSize);
		      
		      // Location to save data that is larger than maxMemSize.
		      factory.setRepository(new File("c:\\temp"));

		      // Create a new file upload handler
		      ServletFileUpload upload = new ServletFileUpload(factory);
		      
		      // maximum file size to be uploaded.
		      upload.setSizeMax( maxFileSize );
		      
		      try { 
		         // Parse the request to get file items.
		         List fileItems = upload.parseRequest(request);

		         // Process the uploaded file items
		         Iterator i = fileItems.iterator();


		         
		         while ( i.hasNext () ) {
		        	 
		            FileItem fi = (FileItem)i.next();
		            if ( !fi.isFormField () ) {
		               // Get the uploaded file parameters
		               String fieldName = fi.getFieldName();
		               String fileName = fi.getName();
		               System.out.println(fileName);
		               boolean isInMemory = fi.isInMemory();
		               long sizeInBytes = fi.getSize();
		            
		               // Write the file
		               if( fileName.lastIndexOf("\\") >= 0 ) {
		                  file = new File( filePath + 
		                  fileName.substring( fileName.lastIndexOf("\\")));
		               } else {
		                  file = new File( filePath + 
		                  fileName.substring(fileName.lastIndexOf("\\")+1));
		               }
		               paths.add(file.getAbsolutePath());
		               fi.write( file ) ;

		            }
		         }
		      } catch(Exception ex) {
		         ex.printStackTrace();
		      }
		      Hotel hotel = (Hotel)request.getSession(false).getAttribute("currentHotel");
		      Hibernate.initialize(hotel);
		      List<String>images = (List<String>)request.getSession(false).getAttribute("currentImages");
		      for(String i : paths) {
		    	  images.add(i);
		      }
		      
		      hotel.setImages(images);
		      
		      HibernateUtil.getInstance().updateHotel(hotel);
	}
		   
		   
		   

}
}

