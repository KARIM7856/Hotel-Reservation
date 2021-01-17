/**
 * 
 */


function ReservationByDateValidate(){
	var begin = document.getElementById("begindate").value;
	var end = document.getElementById("enddate").value;
	
	begin = new Date(begin);
	end = new Date(end);
	
	today = new Date();
	if(begin.getTime() != begin.getTime()){
		alert("invalid date");
		return false;
	}
	if(end.getTime() != end.getTime()){
		alert("invalid date");
		return false;
	}
	
	if((end.getTime() - begin.getTime()) < 0){
		alert("begin can't be after end");
	}
	
	return true;
}


function ReservationUpdateValidate(){
	var begin = document.getElementById("begindate").value;
	var end = document.getElementById("enddate").value;
	
	begin = new Date(begin);
	end = new Date(end);
	
	today = new Date();
	if(begin.getTime() != begin.getTime()){
		alert("invalid date");
		return false;
	}
	if(end.getTime() != end.getTime()){
		alert("invalid date");
		return false;
	}
	
	if((end.getTime() - begin.getTime()) < 0){
		alert("begin can't be after end");
	}
	if((begin.getTime() - today.getTime()) < 0){
		alert("begin can't be yesterday!");
		return false;
	}
	
	return true;
}