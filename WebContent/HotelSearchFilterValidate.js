/**
 * 
 */

function HotelSearchValidate(){
	var minp = document.getElementById("mnp").value;
	var mixp = document.getElementById("mxp").value;
	
	var minr = document.getElementById("mnr").value;
	var mixr = document.getElementById("mxr").value;
	
	var mins = document.getElementById("mns").value;
	var mixs = document.getElementById("mxs").value;
	
	var mind = document.getElementById("mxd").value;
	
	if(minp > mixp){
		alert("Minimum price is more the maximum");
		return false;
	}
	if(minr > mixr){
		alert("Minimum rate is more the maximum");
		return false;
	}
	if(mins > mixs){
		alert("Minimum stars is more the maximum");
		return false;
	}
	
	return true;


}