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
    <link rel="stylesheet" href="unifiedCSSFile.css?version=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Hotel Reservation</title>

</head>

<%
	String hidS = request.getParameter("selectedhotel");
	int hid=0;
	Hotel hotel = null;
	Session  sess=null;
	if(hidS!=null){
		hid = Integer.parseInt(hidS);

		sess = HibernateUtil.getInstance().getSession();
		hotel = (Hotel)sess.load(Hotel.class, hid);
	}
	else{
		hotel = (Hotel)request.getSession(false).getAttribute("currentHotel");
		sess = HibernateUtil.getInstance().getSession();
		hotel = (Hotel)sess.load(Hotel.class, hotel.getHid());
	}
	List<String> meals = hotel.getIncludingMeals();
	boolean b=false;
	boolean l=false;
	boolean d=false;
	
	for(String m : meals){
		if(m.equals("breakfast")){
			b=true;
			System.out.println(m);
		}
		if(m.equals("lunch")){
			l = true;
			System.out.println(m);
		}
		if(m.equals("dinner")){
			d = true;
		System.out.println(m);
		}
	}
	hotel.getImages().size();
	request.getSession(false).setAttribute("currentHotel", hotel);
	request.getSession(false).setAttribute("currentImages", hotel.getImages());
	
	List<Room> rooms = hotel.getRooms();
	System.out.println(rooms);
%>

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
            <div class="item"><a href = AdminHome.jsp>Home</a></div>
            <div class="item"><a href = currentreservations.jsp>Current Reservations</a></div>
            <div class="item"><a href = reservationsbydate.jsp>Reservations History</a></div>
            <div class="item"><a href = hotelsearchadmin.jsp>Hotels Search</a></div>
            <div class="item"><a href="index.jsp">Sign out</a></div>
     </div>
 </div>
     <div class="form" id="updateHotelForm">
        <a href="hotelphotosupdate.jsp">Update Photos</a>

        <form action= updatehotel method=post >
            <table>
                
                <tr>
                    <td><label for="Hotel">Hotel: </label></td>
                    <td><input type=text name=type placeholder="<%=hotel.getName() %>" onfocus="this.placeholder = ''"
                               onblur="this.placeholder = '<%=hotel.getName() %>'" value="<%=hotel.getName() %>"></td>
                </tr>
                <tr>
                    <td><label for="Address">Address: </label></td>
                    <td><input type=text name=address placeholder="<%=hotel.getAddress() %>" onfocus="this.placeholder = ''"
                               onblur="this.placeholder = '<%=hotel.getAddress() %>'" value="<%=hotel.getAddress() %>"></td>
                </tr> 
                <tr>
                    <td><label for="City">City: </label></td>
                    <td><input type=text name=type placeholder="<%=hotel.getCity() %>" onfocus="this.placeholder = ''"
                               onblur="this.placeholder = '<%=hotel.getCity() %>'" value="<%=hotel.getCity() %>"></td>
                </tr>
                <tr>
                    <td><label for="Country">Country: </label></td>
                    <td><input type=text name=type placeholder="<%=hotel.getCountry() %>" onfocus="this.placeholder = ''"
                               onblur="this.placeholder = '<%=hotel.getCountry() %>'" value="<%=hotel.getCountry() %>"></td>
                </tr>
                <tr>
                    <td><label for="DistanceFCC">CC Distance: </label></td>
                    <td><input type=text name=type placeholder="<%=hotel.getDistanceToCityCenter()%>" onfocus="this.placeholder = ''"
                               onblur="this.placeholder = '<%=hotel.getDistanceToCityCenter()%>'" value="<%=hotel.getDistanceToCityCenter()%>"></td>
                </tr> 
                <tr>
                    <td><label for="Stars">Stars: </label></td>
                    <td><input type=text name=type placeholder="<%=(int)hotel.getStars() %>" onfocus="this.placeholder = ''"
                               onblur="this.placeholder = '<%=(int)hotel.getStars() %>'" value="<%=(int)hotel.getStars() %>"></td>
                </tr>

                <tr><td><label for="num_rating"><%=hotel.getUserRating() %> - rating </label></td></tr>
                <tr><td> <label for="hotelPrice"><%=hotel.getPrice() %> </label></td></tr>

                <tr><td> <input type="checkbox" id="mealb" name="meal" value="breakfast" <%=(b)? "checked":"" %> > Breakfast</td>
                    <td><input type="checkbox" id="meall" name="meal" value="lunch" <%= (l)? "checked":""%>> Lunch</td>
                    <td><input type="checkbox" id="meald" name="meal" value="dinner" <%= (d)? "checked":""%>> Dinner</td></tr>
                    <tr>
                        <td></td>
                        <td><input type=submit value=update></td>
                    </tr>
            </table>
        </form>
    </div>



<div class="form" id="updateRoomForm">
<table>
	<%
	for(Room r : rooms){
		
		System.out.println(r);
%>
<tr>
<td>
        <form action=updateroom method = post>
            <table>

                    <tr>
                        <td><label for="RoomType">Room Type: </label></td>
                        <td><input type=text name=type placeholder="<%=r.getType() %>" onfocus="this.placeholder = ''"
                               onblur="this.placeholder = '<%=r.getType() %>'" value="<%=r.getType() %>"></td>
                    </tr>
                    <tr>
                        <td><label for="NumOfBeds">Number Of Beds: </label></td>
                        <td><input type=text name=nbeds placeholder="<%= r.getnBeds() %>" onfocus="this.placeholder = ''"
                               onblur="this.placeholder = '<%= r.getnBeds() %>'" value="<%= r.getnBeds() %>"></td>
                    </tr>
                    <tr>
                        <td><label for="NumOfRooms">Number Of Rooms: </label></td>
                        <td><input type=text name="nrooms" placeholder="<%=r.getnRooms() %>" onfocus="this.placeholder = ''"
                               onblur="this.placeholder = '<%=r.getnRooms() %>'" value="<%=r.getnRooms() %>"></td>
                    </tr>
                    <tr>
                        <td><label for="Price">Price: </label></td>
                        <td><input type=text name="price" placeholder="<%=r.getPrice() %>" onfocus="this.placeholder = ''"
                               onblur="this.placeholder = '<%=r.getPrice() %>'" value="<%=r.getPrice() %>">
                    </tr>
                    <tr>
                        <td><input type=text hidden="true" name="selectedroom" placeholder="<%= r.getRid() %>" onfocus="this.placeholder = ''"
                                   onblur="this.placeholder = '<%= r.getRid() %>'" value="<%= r.getRid() %>" ></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type=submit value=update></td>
                    </tr>
            </table>
        </form>
		<br>
    </div>
    </td>
    </tr>
    <%
	}
	%>
	</table>
</body>

	<%
	if(sess!=null){
		sess.close();
		System.out.println("sess closed");
	}
	else{
		System.out.println("sess not closed");
	}
%>
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
</html>