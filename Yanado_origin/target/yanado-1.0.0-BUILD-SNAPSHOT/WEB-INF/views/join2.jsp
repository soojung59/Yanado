<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/join.css?ver=1" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<form action="join.do" id="joinForm" naem="joinForm">
		<form autocomplete="off">
			<div id="focus"></div>
			<h1>Your info</h1>
			<input type="text" half placeholder="First name" autocomplete="no">
			<input type="text" half placeholder="Last name" autocomplete="no">
			<input type="text" placeholder="Address" autocomplete="no"> <input
				type="text" half placeholder="Zip code" autocomplete="no"> <input
				type="text" half placeholder="City" autocomplete="no"> <input
				type="text" placeholder="Mail" autocomplete="no"> <input
				type="text" placeholder="Mail" autocomplete="no"> <input
				type="submit" value="Send it">
		</form>
		<script type="text/javascript">
			const FORM = $("form"); // set form or other element here
			const TYPES = [ "input[type=text], input[type=submit]" ]; // set which elements get targeted by the focus
			const FOCUS = $("#focus"); // focus element

			// function for positioning the div
			function position(e) {
				// get position
				var props = {
					top : e.offset().top,
					left : e.offset().left,
					width : e.outerWidth(),
					height : e.outerHeight(),
					radius : parseInt(e.css("border-radius"))
				};

				// set position
				FOCUS.css({
					top : props.top,
					left : props.left,
					width : props.width,
					height : props.height,
					"border-radius" : props.radius
				});

				FOCUS.fadeIn(200);
			}

			FORM.find(TYPES.join()).each(function(i) {
				// when clicking an input defined in TYPES
				$(this).focus(function() {
					el = $(this);

					// adapt size/position when resizing browser
					$(window).resize(function() {
						position(el);
					});

					position(el);
				});
			});

			FORM.on("focusout", function(e) {
				setTimeout(function() {
					if (!e.delegateTarget.contains(document.activeElement)) {
						FOCUS.fadeOut(200);
					}
				}, 0);
			});
		</script>
</body>
</html>