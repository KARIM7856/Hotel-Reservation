<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.List" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.Hibernate" %>
<%@page import="IA_Project.WebData.*" %>
<%@page import="IA_Project.Util.*" %>

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
    <script src="RatingValidation.js"></script>
    <title>Hotel Reservation</title>


<style type="text/css">
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

fieldset, label { margin: 0; padding: 0; }
body{ margin: 0px; }
h1 { font-size: 1.5em; margin: 10px; }

/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: left;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 1px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } </style>
</head>
<body>
<%
	HttpSession requestSession = request.getSession(false);
	User user = (User)requestSession.getAttribute("currentUser");
	
	int hid = Integer.parseInt(request.getParameter("selectedhotel"));
	String error = request.getParameter("error");
	int e = -1;
	String msg = "";
	if(error != null){
		e = Integer.parseInt(error);
		msg = "Thank for rating!";
	}
	
	Session  sess = HibernateUtil.getInstance().getSession();
	Hotel hotel = (Hotel)sess.load(Hotel.class, hid);
	request.getSession(false).setAttribute("currentHotel", hotel);
	hotel.getImages().size();
	request.getSession(false).setAttribute("currentImages", hotel.getImages());
	List<Room> rooms = hotel.getRooms();
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
            <div class="item"><a href="hotelsearch.jsp">Hotel Search</a></div>
            <div class="item"><a href="updatereservation.jsp">Update Reservations</a></div>
            <div class="item"><a href="index.jsp">Sign out</a></div>
     </div>
 </div>
        
	<div class="tableForm" id="manageReservations">
	<form action=AddReservation method = post>
<table>
    <tr>
        <th>Room Type</th>
        <th>Number of Beds</th>
        <th>Price</th>
    </tr>
	<%
	for(Room r : rooms){
%>

	<tr>
	<td><%= r.getType() %></td>
	<td><%= r.getnBeds() %></td>
	<td><%=r.getPrice() %>
	<td><select name = <%= "room" +r.getRid() %>  id=<%="room" + r.getRid() %>>
	<% for(int i = 0; i <= r.getnRooms(); i++){ %>
		<option id=<%=i %> value=<%=i %> ><%=i %></option>
	<%} %>
	</select></td>
	</tr>

<%
	}
%>
</table>
	<input type=submit value=reserve>
	</form>
<%
	sess.close();
%>

<form action = addrating method = post onsubmit="return RatingValidation()">

	<fieldset class="rating">
	    <input type="radio" id="star10" name="rating" value="10" /><label class = "full" for="star10" title="10 stars"></label>
	    <input type="radio" id="star9" name="rating" value="9" /><label class = "full" for="star9" title="9 stars"></label>
	    <input type="radio" id="star8" name="rating" value="8" /><label class = "full" for="star8" title="8 stars"></label>
	    <input type="radio" id="star7" name="rating" value="7" /><label class = "full" for="star7" title="7 stars"></label>
	    <input type="radio" id="star6" name="rating" value="6" /><label class = "full" for="star6" title="6 star"></label>
	    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="5 stars"></label>
	    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="4 stars"></label>
	    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="3 stars"></label>
	    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="2 stars"></label>
	    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="1 star"></label>
	</fieldset>
	<textarea  name="ratecomment" rows="4" cols="60"></textarea>
	<input type=submit value=Rate>
</form>
<p style="color:green;"><%=msg %></p>
<a id="links" href=viewhotelphotos.jsp>View Photos</a>
<iframe width="520" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" id="gmap_canvas" src="https://maps.google.com/maps?width=520&amp;height=400&amp;hl=en&amp;q=<%=hotel.getName().replace(" ","%20")+"%20"+hotel.getCity() %>+(map)&amp;t=&amp;z=12&amp;ie=UTF8&amp;iwloc=B&amp;output=embed">
</iframe> <a href='https://add-map.org/'>google maps on my website</a> 
</div>
<script type='text/javascript' src='https://embedmaps.com/google-maps-authorization/script.js?id=6d81755835273a4b2151a8432bc00c503c5d7795'></script>

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