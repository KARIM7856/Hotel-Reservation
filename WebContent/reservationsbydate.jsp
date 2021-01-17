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
    <script src="ReservationUpdateValidate.js"></script>
    <title>Hotel Reservation</title>
</head>
<%	
	HttpSession httpSess = request.getSession(false);
	Session sess = HibernateUtil.getInstance().getSession();
	List<Reservation> reservationsList = null;
	Date beginDate=null;
	Date endDate=null;
	String beginDateS = request.getParameter("begindate");
	String endDateS = request.getParameter("enddate");
	
	if(beginDateS != null && !beginDateS.isEmpty() && endDateS != null && !endDateS.isEmpty()){
		
		beginDate = Date.valueOf(beginDateS.replace("/", "-"));
		endDate = Date.valueOf(endDateS.replace("/", "-"));
		
		Criteria c = sess.createCriteria(Reservation.class);
		
		//c.add(Restrictions.eq("active", true));
		c.add(Restrictions.or(Restrictions.between("checkIn", beginDate, endDate),
				Restrictions.between("expectedCheckOut", beginDate, endDate)));
		
		
		reservationsList = c.list();
		
		System.out.println(reservationsList.size());
	
	}
	
	
	
	%>
<body>

<body>
<div class="topnav" id="userHomeNB">
 <div class="menu-btn">
     <i class="fas fa-bars"></i>
 </div>
    <div class="AHdropdown">
        <button class="dropbtn">Notifications
          <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
          
        </div>
    </div>
 </div>
 <div class="sideBar">
     <div class="close-btn">
         <i class="fas fa-times"></i>
     </div>
     <div class="userMenu">
            <div class="item"><a href="UserHome.jsp">Home</a></div>
            <div class="item"><a href = currentreservations.jsp>Current Reservations</a></div>
            <div class="item"><a href = reservationsbydate.jsp>Reservations History</a></div>
            <div class="item"><a href = hotelsearchadmin.jsp>Hotels</a></div>
            <div class="item"><a href="index.jsp">Sign out</a></div>
            
     </div>
 </div>
    <div class="tableForm" id="manageReservations">
<form action = reservationsbydate.jsp onsubmit="return ReservationByDateValidate()">
	<input type=date name=begindate id="begindate">
	<input type=date name=enddate id="enddate">
	<input type=submit value=search>
</form>
        <table>
            <tr>
                <th></th>
                <th>Hotel Name</th>
                <th>Price</th>
                <th>CheckIn</th>
                <th>Checkout</th>
                <th>Paid</th>
                <th>Actual CheckIn</th>
                <th>Actual Check out</th>

                
            </tr>
	<%
	if(reservationsList != null){
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
	}
sess.close();
	%>
	</table>
</div>
    	<%} %>
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
</html>