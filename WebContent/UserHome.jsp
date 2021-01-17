<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import= "IA_Project.WebData.*" %>
<%@page import= "javax.servlet.http.HttpSession" %>
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
    <link rel="stylesheet" href="normalize.css">  
    <link rel="stylesheet" href="unifiedCSSFile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <title>Hotel Reservation</title>

	<script src="HotelSearchValidation.js"></script>
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
            <div class="item"><a href="UserProfile.jsp">Profile</a></div>
            <div class="item"><a href="managereservations.jsp">Manage Reservations</a></div>
            <div class="item"><a href="index.jsp">Sign out</a></div>
     </div>
 </div>
 <form action="hotelsearch.jsp" onsubmit="return hotelSearchValidate()">
     <div class="form" id="userHome">
         <input type=text placeholder="City/Country" onfocus="this.placeholder = ''"
onblur="this.placeholder = 'City/Country'" name="querytext" id =querytext ><br>
         <input type="date" name="checkin" id= checkin><br>
         <input type="date" name="checkout" id=checkout><br>
 	<input type=submit value=search>
     </div>
 </form>
 
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