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
String hcountry = request.getParameter("country");
String hcity = request.getParameter("city");
String hname = request.getParameter("name");

HttpSession httpSess = request.getSession(false);

Session sess = HibernateUtil.getInstance().getSession();

if(hcountry == null || hcountry.isBlank() 
&& (hcity == null || hcity.isBlank())
&& (hname == null || hcity.isBlank())){
	hcountry = "@";

	hcity = "@";

	hname = "@";
}

Criteria c = sess.createCriteria(Hotel.class);

if(!hcity.isBlank())
	c.add(Restrictions.like("city","%"+hcity+"%"));
if(!hcountry.isBlank())
	c.add(Restrictions.like("country","%"+hcountry+"%"));
if(!hname.isBlank())
	c.add(Restrictions.like("name","%"+hname+"%"));

List<Hotel> hotels = (List<Hotel>) c.list();


%>
<body>

<form action="updatehotel.jsp">
	<table>
	<%
		for(Hotel h : hotels){
			

	%>
	<tr>
	<td><input type="radio" id=<%=h.getHid() %> name=selectedhotel value = <%=h.getHid() %>> 
	<td><%=h.getName() %></td>
	<td><%= h.getIncludingMeals() %></td>
	<td> <a href="viewrates.jsp?h=<%=h.getHid()%>">View Rates</a></td>
	
	</tr>
	<%
		}
	%>
	</table>
	<input type=submit value="Update">
	</form>

<form action=hotelsearchadmin.jsp>
		<input type=text name=country>
		<input type=text name=city>
		<input type=text name=name>
		<input type=submit>
	</form>
</body>
</html>