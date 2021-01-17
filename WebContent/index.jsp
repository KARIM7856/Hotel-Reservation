<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<link rel="stylesheet" href="unifiedCSSFile.css">
<script src="loginValidation.js"></script>
<title>Hotel Reservation</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<%
	String error = request.getParameter("error");
	String color = "";

	String errorMsg = null;
	if(error != null){
		if(error.equals("0")){
			errorMsg = "Created Successfully (Password sent via email)";
			color = "green";
		}
		else if(error.equals("1")){
			errorMsg = "Wrong password or username";
			color = "red";
		}
		else if(error.equals("2")){
			errorMsg = "Unknown error";
			color = "red";
		}
	}
	//boolean refresh = session.getAttribute("error").toString().equalsIgnoreCase("error");

%>

<body>
<div class="topnav">
  <a href="Signup.jsp">Sign up</a>
</div>
	<form name="Login" id="form-1" action="Login" onsubmit="return loginValidation()" method="post">
		<div class="form">
                    <table cellspacing="5" border="0">
                        <tr>
                            <td><label for="LoginUsername">Username:</label></td>
                            <td><input id="username" name="username1" placeholder="Username" onfocus="this.placeholder = ''"
onblur="this.placeholder = ' Username'" type="text"/></td>
                        </tr>
                        <tr>
                            <td><label for="input-1">Password:</label></td>
                            <td><input id="password" name="password1" placeholder="Password" onfocus="this.placeholder = ''"
onblur="this.placeholder = 'Password'" type="password"/></td>
                        </tr>
                        <tr>
                        <td></td>
                        <td><input type=submit id="formButton" value=Login></td>
                        </tr>
                    </table>
		</div>
		<div id="show_response"></div>
	</form>	
<%if(error != null){ %>
<p style="color:<%=color%>"><%=errorMsg%></label>
<%} %>
<p id="show_response" style="color:red"></p>

</body>
</html>