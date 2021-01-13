<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@page import="java.util.List" %>
<%@page import="java.sql.Date" %>
<%@page import="org.hibernate.Session" %>
<%@page import="IA_Project.WebData.*" %>
<%@page import="IA_Project.Util.*" %>
<%@page import="org.hibernate.Criteria" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="org.hibernate.criterion.Criterion" %>
</head>

<%	
	HttpSession httpSess = request.getSession(false);
	Session sess = HibernateUtil.getInstance().getSession();

	
	String hidS = request.getParameter("h");
	
	int hid =0;
	
	hid = Integer.parseInt(hidS);
	
		
		
		Criteria c = sess.createCriteria(Rate.class);
		
		c.add(Restrictions.eq("hotel.hid", hid));
		
		
		List<Rate>rateList = c.list();
		
		System.out.println(rateList.size());
	
	
	
	
	
	%>

<body>
<table>
	<%
	if(rateList != null){
		for(Rate r : rateList){
			
			
	%>
	<tr>
	<td><input type="radio" id=<%=r.getRid() %> name=selectedreservation value = <%=r.getRid() %>></td>
	<td><%=r.getHotel().getName() %></td>
	<td><%= r.getRate() %></td>
	<td><%= r.getComment() %></td>
	<td><%= r.getUser().getName() %></td>
	</tr>
	<%
		}
	}
sess.close();
	%>
	</table>
</body>
</html>