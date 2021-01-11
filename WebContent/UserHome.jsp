<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import= "IA_Project.WebData.*" %>
<%@page import= "javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	HttpSession requestSession = request.getSession(false);
 %>
 
 <form action="hotelsearch.jsp">
 	<input type=text name="querytext" >
 	<input type="date" name="checkin">
 	<input type="date" name="checkout">
 	<input type=submit value=search>
 </form>
<a href="UserProfile.jsp">Profile Page</a>
<a href="managereservations.jsp">Manage Reservations</a>
<p>Debug info: your current session ID is ${pageContext.session.id}</p>
</body>
</html>