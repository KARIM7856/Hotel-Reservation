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
<%
if(request.getSession(false).getAttribute("currentUser") == null){
	System.out.println("null");
	response.sendRedirect("index.jsp");
}
else{
	System.out.println("succ");


%>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="unifiedCSSFile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Hotel Reservation</title>
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
    <div class="topnav" id="userHomeNB">
 <div class="menu-btn">
     <i class="fas fa-bars"></i>
 </div>
    <div class="AHdropdown">
        <button class="dropbtn">Notifications
          <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
          
        </div>
    </div>
 </div>
 <div class="sideBar">
     <div class="close-btn">
         <i class="fas fa-times"></i>
     </div>
     <div class="userMenu">
            <div class="item"><a href = AdminHome.jsp>Home</a></div>
            <div class="item"><a href = currentreservations.jsp>Current Reservations</a></div>
            <div class="item"><a href = reservationsbydate.jsp>Reservations History</a></div>
            <div class="item"><a href = hotelsearchadmin.jsp>Hotels</a></div>
            <div class="item"><a href="index.jsp">Sign out</a></div>
     </div>
 </div>

<div class="form" id="CSForm">

	<%
	if(userList != null){
		for(User r : userList){
			
			
	%>
 	<div class="content-card" >
 	<div>
	<table>
	<tr><td>Username: <%=r.getUsername() %> Phonenumber: <%=r.getPhonenumber() %> email: <%=r.getEmail() %></td></tr>
	
	</table> 	
 	
 	</div>
	<%
		}
	}
sess.close();
	%>

</div>
        <script type="text/javascript">
        $('document').ready(function(){
        $('.menu-btn').click(function(){
            $('.sideBar').addClass('active');
            $('.menu-btn').css("visibility","hidden");
        })
        $('.close-btn').click(function(){
            $('.sideBar').removeClass('active');
            $('.menu-btn').css("visibility","visible");
        });
    });
    </script>
</body>
<%} %>
</html>