function menuMouseEnter(menuItem, dropContainer) {
    clearTimeout($(menuItem).data('timeoutId'));
    var offset = $(menuItem).offset();
    var difference = $(dropContainer).width() - $(menuItem).width();
    $(dropContainer+":hidden").slideDown(150);
    $(dropContainer).css("top", offset.top + 30);
    $(dropContainer).css("left", offset.left - (difference / 2));
    $(menuItem).toggleClass("menu_hover", true);
}

function menuMouseLeave(menuItem, dropContainer) {
    var timeoutId = setTimeout(function(){
        $(dropContainer).slideUp(150);
        $(menuItem).toggleClass("menu_hover", false);
    }, 200);
    $(menuItem).data('timeoutId', timeoutId);
}

function menuHorizontal() {
    $("#pessoas_drop").hide();
    $("#projetos_drop").hide();
    $("#outros_drop").hide();
    
    $("#pessoas_item").mouseenter(function(){
        menuMouseEnter("#pessoas_item", "#pessoas_drop");
    }).mouseleave(function(){
        menuMouseLeave("#pessoas_item", "#pessoas_drop");
    });
    $("#pessoas_drop").mouseenter(function(){
        clearTimeout($("#pessoas_item").data('timeoutId'));
    }).mouseleave(function(){
        menuMouseLeave("#pessoas_item", "#pessoas_drop");
    });

    $("#projetos_item").mouseenter(function(){
        menuMouseEnter("#projetos_item", "#projetos_drop");
    }).mouseleave(function(){
        menuMouseLeave("#projetos_item", "#projetos_drop");
    });
    $("#projetos_drop").mouseenter(function(){
        clearTimeout($("#projetos_item").data('timeoutId'));
    }).mouseleave(function(){
        menuMouseLeave("#projetos_item", "#projetos_drop");
    });

    $("#outros_item").mouseenter(function(){
        menuMouseEnter("#outros_item", "#outros_drop");
    }).mouseleave(function(){
        menuMouseLeave("#outros_item", "#outros_drop");
    });
    $("#outros_drop").mouseenter(function(){
        clearTimeout($("#outros_item").data('timeoutId'));
    }).mouseleave(function(){
        menuMouseLeave("#outros_item", "#outros_drop");
    });
}