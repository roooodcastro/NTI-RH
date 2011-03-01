function menuDropEnter(menuItem, dropContainer) {
    var offset = $(menuItem).offset();
    $(dropContainer).show();
    $(dropContainer).css("top", offset.top + 30);
    $(dropContainer).css("left", offset.left - 16);
    $(menuItem).toggleClass("menu_hover", true);
}

function menuDropLeave(menuItem, dropContainer) {
    $(dropContainer).hide(0);
    $(menuItem).toggleClass("menu_hover", false);
}