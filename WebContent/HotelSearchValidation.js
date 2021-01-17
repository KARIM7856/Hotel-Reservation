/**
 * 
 */

function hotelSearchValidate(){
	var querytext = document.getElementById("querytext").value;
	var checkin = document.getElementById("checkin").value;
	var checkout = document.getElementById("checkout").value;
	var today = new Date();
	var checkinD = new Date(checkin);
	var checkoutD = new Date(checkout);
	var a = checkinD.getTime();
	var b = checkoutD.getTime();
	if(checkinD.getTime() != checkinD.getTime() || checkoutD.getTime() != checkoutD.getTime()){
		alert("invalid date");
		return false;
	}
	
	if((checkinD.getTime() - checkoutD.getTime()) > 0){
		alert("checkin can't be after checkout");
		return false;
	}
	if((checkinD.getTime() - today.getTime()) < 0){
		alert("checkin can't be yesterday");
		return false;
	}
	if((checkoutD.getTime() - today.getTime()) < 0){
		alert("checkout can't be yesterday");
		return false;
	}
	
	
	return true;
	
	
	
	
	
}