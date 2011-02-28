function remove_partial(link) {  
    $(link).prev("input[type=hidden]").val("1");  
    $(link).closest(".item").hide();  
}  
  
function add_partial(link, association, content) {  
    var new_id = new Date().getTime();  
    var regexp = new RegExp("new_" + association, "g");  
    $(link).parent().before(content.replace(regexp, new_id));  
}