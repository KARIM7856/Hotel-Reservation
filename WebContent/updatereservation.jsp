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


<%
	Reservation res = (Reservation)request.getSession(false).getAttribute("currentReservation");

	

%>

</head>
<body>
<form action=updatereservations method=post>

	<input type=date name=newcheckin value=<%= res.getCheckIn() %>>
	
	<input type=date name=newcheckout value=<%= res.getExpectedCheckOut() %>>
	<input type=submit value=Update>

</form>
</body>
</html>