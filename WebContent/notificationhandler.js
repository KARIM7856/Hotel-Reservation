/**
 * 
 */



$(document).ready(function(){
	setInterval(notificationHandler,500);
});

function notificationHandler(){
	$.ajax({
		type:"post",
		url:"notification_ajax",
		date:{status:1},
		success: function(result){
			if(result.length > 0){
				
			$("#drpdns").append(result[0].msg);
			
			}

		}
	})
}


