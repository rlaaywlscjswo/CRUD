/**
 * 
 */

jQuery.noConflict();
jQuery(document).ready(function($) {

	// menu slide
	var sl = $('.bh_nav').find('ul').find('li');
	sl.on('click', function() {
		if ($(this).children('div').hasClass('hide')) {
			var hi = sl.children('div').not('hide').slideUp(500);
			hi.addClass('hide');
			$(this).children('div').slideDown(500);
			$(this).children('div').removeClass('hide');
		} else {
			$(this).children('div').addClass('hide');
			$(this).children('div').slideUp(500);
		}
	}); // end on

}); // end ready
