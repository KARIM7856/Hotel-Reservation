/**
 * 
 */

function loginValidationf(){
	var username = document.getElementById("username").value;
	var pass = document.getElementById("password").value;
	
	if(username != "admin" &&(username.length < 6 || username.length > 15) ){
		alert("username length between 6 and 15 letter");
		return false;
	}
	
	if(userName.match(letterNumber))
	{
		//return true;
	}
	else
	{
		alert("username must be alphabet letters and numbers");
		return false;
	}
	
	
	if(pass.length < 6 || pass.length > 15){
		alert("password length between 6 and 15");
		return false;
	}
	
	
	
	return true;
}