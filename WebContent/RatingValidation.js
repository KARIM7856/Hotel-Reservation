/**
 * 
 */

function RatingValidation(){
	var b = document.getElementsByName("rating");
	var ch = false;
	for(var i = 0; i < b.length; i++){
		ch = ch||b[i].checked;
	}

	if(!ch){
		alert("Select rating!");
		return false;
	}
	return true;
}