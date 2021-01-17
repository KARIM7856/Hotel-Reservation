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
<%
if(request.getSession(false).getAttribute("currentUser") == null){
	System.out.println("null");
	response.sendRedirect("index.jsp");
	System.out.println("null22");
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
request.getSession(false).setAttribute("path", "/hotel_imgs"); 
List<String> images = (List<String>)request.getSession(false).getAttribute("currentImages");
String browserType = request.getHeader("User-Agent");
System.out.println(browserType);
String path="";
if(browserType.contains("Chrome")){
	path="chrome-extension://fpkldibdchnmbdhanpbfpojdlfcblgij/";
}
else{
	path="C:/Users/gkari/Desktop/";
}
System.out.println("path " + path);
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
            <div class="item"><a href = reservationsbydate.jsp>Reservations History</a></div>
            <div class="item"><a href = hotelsearchadmin.jsp>Hotels</a></div>
            <div class="item"><a href="index.jsp">Sign out</a></div>
     </div>
 </div>
    
    <div class="form" id="updatePhotosForm">
        <form action = uploadphotos enctype = "multipart/form-data" method=post>
            <input type=file multiple name=uploadedimages>
            <input type=submit value=upload>
        </form>
    </div>
    
    <div class="form" id="deletPhotosForm">
<form action = deleteimages method=post>
<%
int j=0;
for(String i : images){
	System.out.println(i.substring(i.lastIndexOf("\\")));
	System.out.println(path+i.substring(i.lastIndexOf("\\")+1));
	%>
	<input type=checkbox id="check-box" name=selectedimages value = <%=i %>>
	<label for=selectedimages<%=j %>><img id="checkBox-image" src="<%=path+i.substring(i.lastIndexOf("\\")+1)%>" height=100 width=100></label>

	<%
	j++;
}

%>
<input type=submit value=delete>
</form>
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