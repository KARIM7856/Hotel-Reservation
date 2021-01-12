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
<body>

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
	<form action="managereservations" method=post>
	<table>
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
	

	


System.out.println("sessionCLosedManage.jsp");
</body>
</html>