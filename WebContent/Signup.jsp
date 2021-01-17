<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hotel Reservation</title>
<script src="Signup-ajax.js"></script>
<script src="https://www.google.com/recaptcha/api.js?render=6Lfv7yEaAAAAANsYx7f0ECapzKSiQEtvgoxf4fFm"></script>
<link rel="stylesheet" href="unifiedCSSFile.css?version=1">
<style>
	body{
		margin: 0px;
	}
</style>
<script>
    grecaptcha.ready(function() {
    // do request for recaptcha token
    // response is promise with passed token
        grecaptcha.execute('6Lfv7yEaAAAAANsYx7f0ECapzKSiQEtvgoxf4fFm', {action:'validate_captcha'})
                  .then(function(token) {
            // add token value to form
            document.getElementById('g-recaptcha-response').value = token;
        });
    });
</script>

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
			errorMsg = "Captcha Failed!";
			color = "red";
		}
	}
	//boolean refresh = session.getAttribute("error").toString().equalsIgnoreCase("error");

%>


<body>
<div class="topnav">
  <a href="index.jsp">Login</a>
</div>
<form name="signup" action="Signup" id="fb" method="post">
    <div class="form" id="signupForm">
    <input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response">
    <input type="hidden" name="action" value="validate_captcha">
    <table cellspacing="5" border="0">
        <tr>
            <td><label for="FistName">First Name:</label></td>
            <td><input type="text" id="fName" name="fName" placeholder="First Name" required></td>
        </tr>
        <tr>
            <td><label for="MiddleName"> Middle Name:</label></td>
            <td><input type="text" id="mName" name="mName" placeholder="Middle Name" required></td>
        </tr>
	<tr>
            <td><label for="LastName"> Last Name:</label></td>
            <td><input type="text" id="lName"  name="lName" placeholder="Last Name" required></td>
        </tr>
        <td><label for="UserName"> User Name:</label></td>
        <td><input type="text" id="username" name="username" placeholder="Username" required></td>
        <tr>
            <td><label for="email"> Email:</label></td>
            <td><input type="email" id="email" name="email" placeholder="Email" required></td>
        </tr>
        <tr>
            <td><label for="PhoneNumber"> Phone Number:</label></td>
            <td><input type="phonenumber" id="phonenumber" name="phonenumber" placeholder="Phonenumber" required></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="button" onclick="signUpValidation()" value=submit></td>
        </tr>
    </table>
    <p style="color:<%=color%>"><%=errorMsg %></p>
    </div>
</form>
<div id="show_response"></div>
</body>