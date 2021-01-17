/**
 * 
 */

function UserProfileValidation(){
	var firstName = document.getElementById("fName").value;
	var middleName = document.getElementById("mName").value;
	var lastName = document.getElementById("lName").value;
	var email = document.getElementById("email1").value;
	var phoneNumber = document.getElementById("phonenumber").value;
	var oldpassword = document.getElementById("oldpassword").value;
	var newpassword = document.getElementById("newpassword").value;
	
	
	
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
	
	var letterNumber = /^[0-9a-zA-Z]+$/;
	
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
	
	if(oldpassword.length > 0){
		if(newpassword.length < 6 || newpassword.length > 15){
			alert("password need to be between 6 and 15 characters");
			return false;
		}
		else{
			$.ajax({
				type:"post",
				url:"checkoldpassword_ajax",
				data:{oldpassword1:oldpassword,email1:email},
				date:{status:1},
				success: function(result){
					if(result.length > 0){
						
					$("#show_response").html(result);
					}
					else{
						$("#fb").submit();
					}

				}
			})
		}
	}
	return true;
}

