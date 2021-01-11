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
	String checkinS = request.getParameter("checkin");
	String checkoutS = request.getParameter("checkout");
	Date checkinD;
	Date checkoutD;
	HttpSession httpSess = request.getSession(false);
	
	String q = request.getParameter("querytext");
	if(q == null)
	{
		q = (String)httpSess.getAttribute("querytext");
		
	}
	else
	{
		httpSess.setAttribute("querytext", q);
	}
	if(checkinS != null)
	{
		System.out.println(checkinS);
		checkinD = Date.valueOf(checkinS.replace("/", "-"));
		httpSess.setAttribute("checkin", checkinD);
	}
	else
		checkinD = (Date)httpSess.getAttribute("checkin");
	
	if(checkoutS != null)
	{
		checkoutD = Date.valueOf(checkoutS.replace("/", "-"));
		httpSess.setAttribute("checkout", checkoutD);
	}
	else
		checkoutD = (Date)httpSess.getAttribute("checkout");
	
	
	String min_price = request.getParameter("min_price");
	String max_price = request.getParameter("max_price");
	
	String min_rating = request.getParameter("min_rating");
	String max_rating = request.getParameter("max_rating");
	
	String min_stars = request.getParameter("min_stars");
	String max_stars = request.getParameter("max_stars");
	
	String min_distance = request.getParameter("min_distance");
	
	String[] meals = request.getParameterValues("meals");
	out.println(meals);
	
	Session sess = HibernateUtil.getInstance().getSession();
	
	Criteria c = sess.createCriteria(Hotel.class);
	
	Criterion city = Restrictions.like("city","%"+q+"%");
	
	Criterion country = Restrictions.like("country","%"+q+"%");
	
	
	double min_price_d = 0;
	double max_price_d = 99999;
	double min_rate_d = 0;
	double max_rate_d = 10;
	double min_stars_d  = 0;
	double max_stars_d  = 5;
	double min_distance_d = 1000;
	
	if(min_price != null && !min_price.isEmpty())
	{
		min_price_d = Double.parseDouble(min_price);
	}
	if(min_price!= null&& !max_price.isEmpty())
	{
		max_price_d = Double.parseDouble(max_price);
	}
	if(min_price!= null && !min_rating.isEmpty())
	{
		min_rate_d = Double.parseDouble(min_rating);
	}
	if(min_price!= null&& !max_rating.isEmpty())
	{
		max_rate_d = Double.parseDouble(max_rating);
	}
	if(min_price!= null&& !min_stars.isEmpty())
	{
		min_stars_d = Double.parseDouble(min_stars);
	}
	if(min_price!= null && !max_stars.isEmpty())
	{
		max_stars_d = Double.parseDouble(max_stars);
	}
	if(min_price!= null && !min_distance.isEmpty())
	{
		min_distance_d = Double.parseDouble(min_distance);
	}
	
	
	c.add(Restrictions.or(city, country));
	c.add(Restrictions.between("price", min_price_d, max_price_d));
	c.add(Restrictions.between("userRating", min_rate_d, max_rate_d));
	c.add(Restrictions.between("stars", min_stars_d, max_stars_d));
	c.add(Restrictions.or(Restrictions.lt("distanceToCityCenter", min_distance_d),
			Restrictions.eq("distanceToCityCenter", min_distance_d)));
	
	
	List<Hotel> hotels = (List<Hotel>) c.list();
	
	
	
	//sess.close();
	System.out.println(q);
	
	%>
	
	<form action="reserverooms.jsp">
	<table>
	<%
		for(Hotel h : hotels){
			
			boolean mealsIncluded = true;
			if(meals!= null){
			for(int i = 0; i < meals.length;i++){
			if(!h.getIncludingMeals().contains(meals[i]))
				mealsIncluded = false;
				break;
			}
			}
			if(!mealsIncluded)
				continue;
	%>
	<tr>
	<td><input type="radio" id=<%=h.getHid() %> name=selectedhotel value = <%=h.getHid() %>> 
	<td><%=h.getName() %></td>
	<td><%= h.getIncludingMeals() %></td>
	</tr>
	<%
		}
	%>
	</table>
	<input type=submit value="reserve">
	</form>
	
	Filters<br>
	<form action=hotelsearch.jsp>
		Price
		<input type=text name=min_price>
		<input type=text name=max_price>
		
		Rating
		<input type=text name=min_rating>
		<input type=text name = max_rating>
		
		Stars
		<input type=text name=min_stars>
		<input type=text name=max_stars>
		
		Distance
		<input type=text name=min_distance>
		
		Meals
		<input type=checkbox name=meals value=breakfast>
		<input type=checkbox name=meals value=lunch>
		<input type=checkbox name=meals value=dinner>
		
		<input type=submit>
	</form>
	<%sess.close(); %>
</body>
</html>