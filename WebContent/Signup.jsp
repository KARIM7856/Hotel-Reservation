<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="Signup.js"></script>
<script src="https://www.google.com/recaptcha/api.js?render=6Lfv7yEaAAAAANsYx7f0ECapzKSiQEtvgoxf4fFm"></script>

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
<form id="Signup" method="post" action="Signup">
    <input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response">
    <input type="hidden" name="action" value="validate_captcha">
    First Name: <input type="text" name=fName placeholder="First Name">
	Middle Name:<input type="text" name=mName placeholder="Middle Name">
	Last Name<input type="text" name=lName placeholder="Last Name">
	Username: <input type="text" name=username placeholder="Username">
	Email: <input type="email" name=email placeholder="Email">
	<input type="submit" value=submit>
</form>
</body>

</html>