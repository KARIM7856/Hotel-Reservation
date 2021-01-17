<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%
if(request.getSession(false).getAttribute("currentUser") == null){
	System.out.println("null");
	response.sendRedirect("index.jsp");
}
else{
	System.out.println("succ");
}

%>
<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="unifiedCSSFile.css?version=2">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Hotel Reservation</title>

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
     		<div class="item"><a href = AdminHome>Home</a></div>
            <div class="item"><a href = currentreservations.jsp>Current Reservations</a></div>
            <div class="item"><a href = reservationsbydate.jsp>Reservations History</a></div>
            <div class="item"><a href = hotelsearchadmin.jsp>Hotels</a></div>
            <div class="item"><a href = index.jsp>Sign Out</a></div>
     </div>
 </div>
    
<div class="tableForm" id="viewRateTable">
        <form action="managereservations" method=post>
	<table>
            <tr>
                <th></th>
                <th>Hotel Name</th>
                <th>Rate</th>
                <th>Comment</th>
                <th>User Name</th>
            </tr>

	<%
	if(rateList != null){
		for(Rate r : rateList){
			
			
	%>
	<tr>
	<td><input type="radio" id=<%=r.getRid() %> name=selectedreservation value = <%=r.getRid() %>></td>
	<td><%=r.getHotel().getName() %></td>
	<td><%= r.getRate() %></td>
	<td><%= r.getComment() %></td>
	<td><%= r.getUser().getName().getfName() +" " +r.getUser().getName().getmName()+" "+r.getUser().getName().getlName() %></td>
	</tr>
	<%
		}
	}
sess.close();
	%>
	</table>
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
</html>