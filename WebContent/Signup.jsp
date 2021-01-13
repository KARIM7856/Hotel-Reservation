<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="Signup.js"></script>
<script src="https://www.google.com/recaptcha/api.js?render=6Lfv7yEaAAAAANsYx7f0ECapzKSiQEtvgoxf4fFm"></script>
<link rel="stylesheet" href="unifiedCSSFile.css">

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
<body>
<div class="topnav">

</div>
<form name="signup" action="Signup" method="post">
    <input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response">
    <input type="hidden" name="action" value="validate_captcha">
    First Name: <input type="text" id="fName" name="fName" placeholder="First Name" required>
	Middle Name:<input type="text" id="mName" name="mName" placeholder="Middle Name" required>
	Last Name<input type="text" id="lName"  name="lName" placeholder="Last Name" required>
	Username: <input type="text" id="username" name="username" placeholder="Username" required>
	Email: <input type="email" id="email" name="email" placeholder="Email" required>
	Phonenumber: <input type="phonenumber" id="phonenumber" name="phonenumber" placeholder="Phonenumber" required>
	<input type="button" onclick="signUpValidation()" value=submit>
</form>
<div id="show_response"></div>
</body>

</html>