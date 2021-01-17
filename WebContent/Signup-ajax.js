
var status = false;

function signUpValidation()
{
	
	//document.write("dfsdf");
	var firstName = document.getElementById("fName").value;
	var middleName = document.getElementById("mName").value;
	var lastName = document.getElementById("lName").value;
	var userName = document.getElementById("username").value;
	var email = document.getElementById("email").value;
	var phoneNumber = document.getElementById("phonenumber").value;
	
	var n_length = firstName.length;
	var letters = /^[A-Za-z]+$/;
	
	
		
	if(firstName.match(letters) && n_length > 1)
		{
			//return true;
		}
	else{
		alert('first name must have alphabet letters only and not empty');
		return false;
	}
	
	var n_length = middleName.length;
	
	if(middleName.match(letters) && n_length > 1)
		{
			//return true;
		}
	else
		{
			alert('middle name must have alphabet letters only and not empty');
			return false;
		}
	
	n_length = lastName.length;
	

	
	if(lastName.match(letters) && n_length > 1)
		{
			//return true;
		}
	else
		{
			alert('last name must have alphabet letters only and not empty');
			return false;
		}
	
	var un_length = userName.length;
	var letterNumber = /^[0-9a-zA-Z]+$/;
	
	if(un_length < 6 || un_length > 15){
		alert("username between 6 and 15")
	}
	if(userName.match(letterNumber))
		{
			//return true;
		}
	else
		{
			alert("username must be alphabet letters and numbers and not empty");
			return false;
		}
	
	var mailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	
	
	if(email.match(mailFormat) && n_length > 1)
		{
			//return true;
		}
	else
		{
			alert("Email should be example@example");
			return false;
		}
	
	
	var numbers = /^[0-9]+$/;
	
	
	if(phoneNumber.match(numbers) && n_length > 1)
		{
			//return true;
		}
	else
		{
			alert("phonenumber must be numbers only and not empty");
			return false;
		}
	
	

	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST", "signup_ajax", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	
	xmlhttp.send("username=" + userName + "&email=" + email);
	
	
	
	
	xmlhttp.onreadystatechange=function(){
		if (this.readyState == 4 && this.status == 200){
			var check = xmlhttp.responseText;
			//document.write(check);
			if(check != "success"){
				document.getElementById("show_response").innerHTML= check;
				return false;
			}
			else{
				status = true;
				document.getElementById("fb").submit();
				return true;
			}
		}
	};
	
	///return status;
	
}


function validateName(name)
{
	var n_length = name.length;
	var letters = /^[A-Za-z]+$/;
	
	if(n_length < 4 || n_length > 15 || n_lengeth == 0)
		{
			alert("user name should be between 4 and 15");
			return false;
		}
	
	else if(name.match(letters))
		{
			return true;
		}
	else
		{
			alert('name must have alphabet letters only');
			return false;
		}
	
	return true;
}


function validateUserName(userName)
{
	var un_length = userName.length;
	var letterNumber = /^[0-9a-zA-Z]+$/;
	
	if(un_length < 5 || un_length > 20 || un_length == 0)
		{
			alert("user name should be between 5 and 20");
			return false;
		}
	
	else if(userName.match(letterNumber))
		{
			return true;
		}
	else
		{
			alert("user name must be alphabet letters and numbers");
			return false;
		}
	
	return true;
	
}

function validateEmail(email)
{
	var mailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(mailFormat.length == 0){
		return false;
	}
	else if(email.match(mailformat))
		{
			return true;
		}
	else
		{
			alert("You have entered an invalid email address!");
			return false;
		}
}

function validatePhoneNumber(pNumber)
{
	var numbers = /^[0-9]+$/;
	if(pNumber.length == 0){
		return false;
	}
	else if(pNumber.match(numbers))
		{
			return true;
		}
	else
		{
			alert("phone number must be numbers only");
			return false;
		}
}
