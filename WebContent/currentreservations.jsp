<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.List" %>
<%@page import="java.sql.Date" %>
<%@page import="org.hibernate.*" %>
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
	HttpSession httpSess = request.getSession(false);
	Session sess = HibernateUtil.getInstance().getSession();
	
	User currentUser = (User)httpSess.getAttribute("currentUser");
	String userId = request.getParameter("userId");
	Query c;
	//c.add(Restrictions.eq("active", true));
	StringBuilder hql = new StringBuilder("Select r from Reservation r where r.active=\'1\' ");
	if(userId != null && !userId.isBlank()){
		hql.append(" and (r.user.email = :userId or r.user.username = :userId) ");
	}
	c = sess.createQuery(hql.toString());
	
	if(userId != null && !userId.isBlank()){
		c.setParameter("userId", userId);
	}
	
	List<Reservation> reservationsList = c.list();
	
	System.out.println(reservationsList.size());
	System.out.println(currentUser.getAid());
	
	
	
	%>

<body>
<form action=currentreservations.jsp>
<input type=text name=userId>
<input type=submit>
</form>
<form action = managereservations method=post>
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
	<input type = submit name=delete value="Delete">
	<input type = submit name=confirmpayment value="Confirm Payment">
	<input type = submit name=checkin value="checkin">
	<input type = submit name=checkout value="checkout">
	</form>
</body>
</html>