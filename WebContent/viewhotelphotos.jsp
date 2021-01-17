<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.List" %>
<%@page import="java.sql.Date" %>
<%@page import="org.hibernate.*" %>
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
}
else{
	System.out.println("succ");
}

%>
<head>

<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="unifiedCSSFile.css?version=5">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Hotel Reservation</title>
    <style>
    	body{
    		margin: 0px;
    	
    	}
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');
    </style>
</head>

<%
	HttpSession requestSession = request.getSession(false);


	User user = (User)requestSession.getAttribute("currentUser");
	
	Session sess = HibernateUtil.getInstance().getSession();
	Transaction t = sess.beginTransaction();
	
	List<String> images = (List<String>)request.getSession(false).getAttribute("currentImages");
	String browserType = request.getHeader("User-Agent");
	System.out.println(browserType);
	String path="";
	if(browserType.contains("Chrome")){
		path="chrome-extension://fpkldibdchnmbdhanpbfpojdlfcblgij/";
	}
	else{
		path="C:/Users/gkari/javatry/IA_Project/hotel_imgs/";
	}
%>
<body>
    
   <div class="topnav" id="userHomeNB">
 <div class="menu-btn">
     <i class="fas fa-bars"></i>
 </div>
 	<p><%=user.getUsername() %></p>
 </div>
 <div class="sideBar">
     <div class="close-btn">
         <i class="fas fa-times"></i>
     </div>
     <div class="userMenu">
            <div class="item"><a href="UserHome.jsp">Home</a></div>
            <div class="item"><a href="UserProfile.jsp">Profile</a></div>
            <div class="item"><a href="updatereservation.jsp">Update Reservations</a></div>
            <div class="item"><a href="index.jsp">Sign out</a></div>
     </div>
 </div>
    
    <div class="form" id="img-form">
        <div class="img-slider">
        <div class="slide active">
            <img src="<%=path+images.get(0).substring(images.get(0).lastIndexOf("\\")+1)%>" >
        </div>
<%
int j=0;
for(String i : images){
	System.out.println(i.substring(i.lastIndexOf("\\")));
	%>
	 <div class="slide">
            <img src="<%=path+i.substring(i.lastIndexOf("\\")+1)%>">
        </div>
	<%
	j++;
}

%>
		<div class="navigation">
            <div class="btn active"></div>
 
<% 
for(String i : images){
	%>
		<div class="btn"></div>
	<%
}

%>
        </div>
        </div>
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
 <script type="text/javascript">
    var slides = document.querySelectorAll('.slide');
    var btns = document.querySelectorAll('.btn');
    let currentSlide = 1;

    // Javascript for image slider manual navigation
    var manualNav = function(manual){
      slides.forEach((slide) => {
        slide.classList.remove('active');

        btns.forEach((btn) => {
          btn.classList.remove('active');
        });
      });

      slides[manual].classList.add('active');
      btns[manual].classList.add('active');
    }

    btns.forEach((btn, i) => {
      btn.addEventListener("click", () => {
        manualNav(i);
        currentSlide = i;
      });
    });

    // Javascript for image slider autoplay navigation
    var repeat = function(activeClass){
      let active = document.getElementsByClassName('active');
      let i = 1;

      var repeater = () => {
        setTimeout(function(){
          [...active].forEach((activeSlide) => {
            activeSlide.classList.remove('active');
          });

        slides[i].classList.add('active');
        btns[i].classList.add('active');
        i++;

        if(slides.length == i){
          i = 0;
        }
        if(i >= slides.length){
          return;
        }
        repeater();
      }, 10000);
      }
      repeater();
    }
    repeat();
    </script>
    
</body>

<%sess.close(); %>
</html>