function menuMouseEnter(menuItem, dropContainer) {
    clearTimeout(jQuery(menuItem).data('timeoutId'));
    var offset = jQuery(menuItem).offset();
    var difference = jQuery(dropContainer).width() - jQuery(menuItem).width();
    jQuery(dropContainer+":hidden").slideDown(150);
    jQuery(dropContainer).css("top", offset.top + 27);
    jQuery(dropContainer).css("left", offset.left - (difference / 2));
    jQuery(menuItem).toggleClass("menu_hover", true);
}

function menuMouseLeave(menuItem, dropContainer) {
    var timeoutId = setTimeout(function(){
        jQuery(dropContainer).slideUp(150);
        jQuery(menuItem).toggleClass("menu_hover", false);
    }, 200);
    jQuery(menuItem).data('timeoutId', timeoutId);
}

function menuHorizontal() {
    jQuery("#pessoas_drop").hide();
    jQuery("#projetos_drop").hide();
    jQuery("#outros_drop").hide();
    
    jQuery("#pessoas_item").mouseenter(function(){
        menuMouseEnter("#pessoas_item", "#pessoas_drop");
    }).mouseleave(function(){
        menuMouseLeave("#pessoas_item", "#pessoas_drop");
    });
    jQuery("#pessoas_drop").mouseenter(function(){
        clearTimeout(jQuery("#pessoas_item").data('timeoutId'));
    }).mouseleave(function(){
        menuMouseLeave("#pessoas_item", "#pessoas_drop");
    });

    jQuery("#projetos_item").mouseenter(function(){
        menuMouseEnter("#projetos_item", "#projetos_drop");
    }).mouseleave(function(){
        menuMouseLeave("#projetos_item", "#projetos_drop");
    });
    jQuery("#projetos_drop").mouseenter(function(){
        clearTimeout(jQuery("#projetos_item").data('timeoutId'));
    }).mouseleave(function(){
        menuMouseLeave("#projetos_item", "#projetos_drop");
    });

    jQuery("#outros_item").mouseenter(function(){
        menuMouseEnter("#outros_item", "#outros_drop");
    }).mouseleave(function(){
        menuMouseLeave("#outros_item", "#outros_drop");
    });
    jQuery("#outros_drop").mouseenter(function(){
        clearTimeout(jQuery("#outros_item").data('timeoutId'));
    }).mouseleave(function(){
        menuMouseLeave("#outros_item", "#outros_drop");
    });
}

function showCommentNotice(commentToHighlight) {
    jQuery("#comment_notice").slideDown(300).css("color", "#4D922F").delay(3000).slideUp(500);
    jQuery(commentToHighlight).css("background-color", "#E5FFEA");
}

function removeDeletedComment(commentToDelete) {
    jQuery(commentToDelete).slideUp(300);
    jQuery("#comment_notice").slideDown(300).css("color", "#CC4433").delay(2000).slideUp(500);
}