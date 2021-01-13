<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List" %>
<%@page import="java.sql.Date" %>
<%@page import="org.hibernate.Session" %>
<%@page import="IA_Project.WebData.*" %>
<%@page import="IA_Project.Util.*" %>
<%@page import="org.hibernate.Criteria" %>
<%@page import="org.hibernate.Query" %>
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
	List<User> userList = null;
	
	User currentUser = (User)httpSess.getAttribute("currentUser");
	String query = request.getParameter("q");
	
	if(query != null && !query.isEmpty()){
		StringBuilder hql = new StringBuilder();
		
		hql.append("Select r from User r where r.email = :querytext or r.username = :querytext or r.name.fName = :querytext ");
		
		String[] flmNames =null;
		if(query.contains(" ")){
			flmNames = query.split(" ");
			
			System.out.println(flmNames);
			if(flmNames.length >= 1)
				hql.append("or r.name.fName = :fName ");
			if(flmNames.length >= 2)
				hql.append("and r.name.mName = :mName ");
			if(flmNames.length >= 3)
				hql.append("and r.name.lName = :lName ");
			
		}
		hql.append("and not r.type = \'admin\' ");
		
		System.out.println(hql);
		Query c = sess.createQuery(hql.toString());
		c.setParameter("querytext",query);
		
		if(flmNames != null){
			if(flmNames.length >= 1)
				c.setParameter("fName",flmNames[0]);
			if(flmNames.length >= 2)
				c.setParameter("mName",flmNames[1]);
			if(flmNames.length >=3)
				c.setParameter("lName",flmNames[2]);
			
		}
		
		userList = c.list();
		
		System.out.println(userList.size());
		System.out.println(currentUser.getAid());
	}
	
	%>

<body>
<form method=get>
<input type=text name=q>
<input type=submit value=search>
</form>

<table>
	<%
	if(userList != null){
		for(User r : userList){
			
			
	%>
	<tr>
	<td><input type="radio" id=<%=r.getAid() %> name=selectedreservation value = <%=r.getAid() %>> 
	<td><%=r.getName() %></td>
	<td><%= r.getUsername() %></td>
	<td><%= r.getEmail() %></td>
	</tr>
	<%
		}
	}
sess.close();
	%>
	</table>

</body>
</html>