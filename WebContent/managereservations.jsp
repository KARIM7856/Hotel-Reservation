<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.List" %>
<%@page import="java.sql.Date" %>
<%@page import="org.hibernate.Session" %>
<%@page import="IA_Project.WebData.*" %>
<%@page import="IA_Project.Util.*" %>
<%@page import="org.hibernate.Criteria" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="org.hibernate.criterion.Criterion" %>


<!DOCTYPE html>
<html>
<%
if(request.getSession(false).getAttribute("currentUser") == null){
	System.out.println("null");
	response.sendRedirect("index.jsp");
}
else{
	System.out.println("succ");


%>
<head>
	 <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="unifiedCSSFile.css?version=2">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Hotel Reservation</title>
</head>
<body>

<%
	HttpSession requestSession = request.getSession(false);
	User user = (User)requestSession.getAttribute("currentUser");
%>

<div class="topnav" id="userHomeNB">
 <div class="menu-btn">
     <i class="fas fa-bars"></i>
 </div>
 	<p><%=user.getUsername() %></p>
 </div>
 <div class="sideBar">
     <div class="close-btn">
         <i class="fas fa-times"></i>
     </div>
     <div class="userMenu">
            <div class="item"><a href="UserHome.jsp">Home</a></div>
            <div class="item"><a href="UserProfile.jsp">Profile</a></div>
            <div class="item"><a href="updatereservation.jsp">Update Reservations</a></div>
            <div class="item"><a href="index.jsp">Sign out</a></div>
     </div>
 </div>

	<%	
	HttpSession httpSess = request.getSession(false);
	Session sess = HibernateUtil.getInstance().getSession();
	
	
	User currentUser = (User)httpSess.getAttribute("currentUser");
	
	Criteria c = sess.createCriteria(Reservation.class);
	c.add(Restrictions.eq("user",currentUser ));
	c.add(Restrictions.eq("active", true));
	
	List<Reservation> reservationsList = c.list();
	
	System.out.println(reservationsList.size());
	System.out.println(currentUser.getAid());
	%>
	 <div class="tableForm" id="manageReservations">
        <form action="managereservations" method=post>
	<table>
            <tr>
                <th></th>
                <th>Hotel Name</th>
                <th>Price</th>
                <th>Check In</th>
                <th>Check out</th>
                <th>Pay</th>
            </tr>
	<%
		for(Reservation r : reservationsList){
			
			
	%>
	<tr>
	<td><input type="radio" id=<%=r.getRid() %> name=selectedreservation value = <%=r.getRid() %>> 
	<td><%=r.getHotel().getName() %></td>
	<td><%= r.getPrice() %></td>
	<td><%= r.getCheckIn() %></td>
	<td><%= r.getExpectedCheckOut() %></td>
	<td><%= r.isPaid() %></td>
	</tr>
	<%
		}
sess.close();
	%>
	</table>
	<input type=submit name="delete" value="Delete">
	<input type=submit name="update" value="Update">
	</form>
         </div>
	

	
<script type="text/javascript">
        $('document').ready(function(){
        $('.menu-btn').click(function(){
            $('.sideBar').addClass('active');
            $('.menu-btn').css("visibility","hidden");
        })
        $('.close-btn').click(function(){
            $('.sideBar').removeClass('active');
            $('.menu-btn').css("visibility","visible");
        });
    });
    </script>
</body>
<%} %>
</html>