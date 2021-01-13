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
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

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
%>

<body>

<a href="hotelphotosupdate.jsp">photos</a>

<form action= updatehotel method=post >
<input type=text name=type value="<%=hotel.getName() %>">
<input type=text name=address value="<%=hotel.getAddress() %>">
<input type=text name=type value="<%=hotel.getCity() %>">
<input type=text name=type value="<%=hotel.getCountry() %>">
<input type=text name=type value=<%=hotel.getDistanceToCityCenter()%>>
<input type=text name=type value=<%=(int)hotel.getStars() %>>

<label type=text name=type><%=hotel.getUserRating() %> - rating</label>
<label type=text name=type><%=hotel.getPrice() %></label>

<input type="checkbox" id="mealb" name="meal" value="breakfast" <%=(b)? "checked":"" %> >
<input type="checkbox" id="meall" name="meal" value="lunch" <%= (l)? "checked":""%>>
<input type="checkbox" id="meald" name="meal" value="dinner" <%= (d)? "checked":""%> >
<input type=submit value=update>
</form>

	<%
	for(Room r : rooms){
%>
<form action=updateroom method = post>
<table>

	<tr>
	<td><input type=text name=type value=<%=r.getType() %>></td>
	<td><input type=text name=nbeds value=<%= r.getnBeds() %>></td>
	<td><input type=text name=nrooms value=<%=r.getnRooms() %>></td>
	<td><input type=text name=price value=<%=r.getPrice() %>>
   <input type=text hidden="true" name=selectedroom value=<%= r.getRid() %> >
	</tr>
</table>
	<input type=submit value=update>
	</form>

</body>
<%
	}
	if(sess!=null){
		sess.close();
		System.out.println("sess closed");
	}
	else{
		System.out.println("sess not closed");
	}
%>
</html>