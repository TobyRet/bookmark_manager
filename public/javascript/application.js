function prepareRemoteFormsHandler(){
	$('#add_link, .sign_up, .sign_in').click(function(event){
		$.get($(this).attr("href"), function(data) {
		if ($('.content-container #ajax-form').length == 0) {
			$(".content-container").prepend("<div id ='ajax-form'></div>");
		}
		$('.content-container #ajax-form').html(data);
		});
		event.preventDefault();
	});
}

function prepareFormHandler() {
	var form = $('.content-container #ajax-form form');
	form.submit(function(event) {
		var addLink = function(data) {
			$('#links').prepend(data);
		}
		var data = form.serialize();
		$.post(form.attr('action'), data, addLink);
		event.preventDefault();
	})
}

function addFavouritesHandler() {
	$(".heart.solid").click(function(event) {
		var link = $(this).parent();
		var favourited = !!$(link).data("favourited");
		var newOpacity = favourited ? 0 : 1;
		$(link).data("favourited", !favourited);
		$(this).animate({opacity: newOpacity}, 1000);
		showLinkFavouritedNotice(link);
	});
}

function showLinkFavouritedNotice(link) {
	var favourited = !!$(link).data("favourited");
	var name = $(link).find('.title').text();
	var message = favourited ?
					name + " was added to favourites" :
					name + " was removed from favourites";
	var flash = $("<div></div>").addClass('flash').addClass('notice').html(message);
	$(flash).appendTo('#flash-container');
	window.setTimeout(function() {
		$(flash).fadeOut();
	}, 3000);
}

$(function() {
	addFavouritesHandler();
	prepareRemoteFormsHandler();
})