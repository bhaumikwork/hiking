$(document).ready(function () {
	
}); 

function modalDialogBox(p_msg,p_type,p_extraaction){
    switch(p_type){
        case "OKONLY":
            bootbox.alert(p_msg, function() {  });
        break;
    }
}