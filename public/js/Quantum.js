 function ajax_send(caller,target,type = "insert",data = {},callback = {}){
    if(jQuery.isEmptyObject(data)) data = $(caller).data();
    $.ajax({
        url: $(caller).data('url'),
        data: data,
        type: 'post',
        success: function(data){
            if(!data.err){
                switch(type){
                    case "insert":
                        $(target).html(data.html);
                        break;
                    case "redirect":
                        window.location = data.url;
                        break;
                    case "relocate":
                        window.location = target;
                        break;
                    case "custom":
                        callback(data);
                        break;
                    default:
                        break;
                }
            } else alert(data.errMsg);
        }
    });
};
