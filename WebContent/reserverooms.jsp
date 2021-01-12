<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.List" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.Hibernate" %>
<%@page import="IA_Project.WebData.*" %>
<%@page import="IA_Project.Util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

fieldset, label { margin: 0; padding: 0; }
body{ margin: 20px; }
h1 { font-size: 1.5em; margin: 10px; }

/****** Style Star Rating Widget *****/

.rating { 
  border: none;
  float: left;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
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

	int hid = Integer.parseInt(request.getParameter("selectedhotel"));

	Session  sess = HibernateUtil.getInstance().getSession();
	Hotel hotel = (Hotel)sess.load(Hotel.class, hid);
	request.getSession(false).setAttribute("currentHotel", hotel);
	List<Room> rooms = hotel.getRooms();
	%>
	
	
	<form action=AddReservation method = post>
<table>
	<%
	for(Room r : rooms){
%>

	<tr>
	<td><%= r.getType() %></td>
	<td><%= r.getnBeds() %></td>
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

<form action = addrating method = post>

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
	<textarea  name="ratecomment"></textarea>
	<input type=submit value=Rate>
</form>
</body>
</html>