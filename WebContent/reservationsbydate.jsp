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
	HttpSession httpSess = request.getSession(false);
	Session sess = HibernateUtil.getInstance().getSession();
	List<Reservation> reservationsList = null;
	Date beginDate=null;
	Date endDate=null;
	String beginDateS = request.getParameter("begindate");
	String endDateS = request.getParameter("enddate");
	
	if(beginDateS != null && !beginDateS.isEmpty() && endDateS != null && !endDateS.isEmpty()){
		
		beginDate = Date.valueOf(beginDateS.replace("/", "-"));
		endDate = Date.valueOf(endDateS.replace("/", "-"));
		
		Criteria c = sess.createCriteria(Reservation.class);
		
		//c.add(Restrictions.eq("active", true));
		c.add(Restrictions.or(Restrictions.between("checkIn", beginDate, endDate),
				Restrictions.between("expectedCheckOut", beginDate, endDate)));
		
		
		reservationsList = c.list();
		
		System.out.println(reservationsList.size());
	
	}
	
	
	
	%>
<body>

<form action = reservationsbydate.jsp>
	<input type=date name=begindate>
	<input type=date name=enddate>
	<input type=submit value=search>
</form>


<table>
	<%
	if(reservationsList != null){
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
	}
sess.close();
	%>
	</table>

</body>
</html>