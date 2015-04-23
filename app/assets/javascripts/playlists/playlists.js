(function() {
	$(function() {
		$('#new_comment').on('ajax:complete', function(event, ajax, data, status) {
			var id, response, result;
			response = $.parseJSON(ajax.responseText);
			result = response.result;
			console.log(response);
			console.log(result);
			if (result === "success") {
				id = $('#title').attr('value');
				return $('#comments').load("/playlists/" + id + "/comments");
			} else if (result === "fail") {
				return $('#comments').prepend("<p>コメントを記入してください<p>");
			}
		});
		return $('#comments').on('ajax:complete', function(event, ajax, status) {
			var id;
			id = $('#title').attr('value');
			console.log(id);
			return $('#comments').load("/playlists/" + id + "/comments");
		});
	});

}).call(this);

