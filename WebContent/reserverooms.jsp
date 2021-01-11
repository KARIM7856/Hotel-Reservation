<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.List" %>
<%@page import="org.hibernate.Session" %>
<%@page import="IA_Project.WebData.*" %>
<%@page import="IA_Project.Util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
</body>
</html>