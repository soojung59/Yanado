<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>

	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link
		href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
		rel="stylesheet">
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/resources/css/join.css">
</head>
<body>
	<form action="join.do" id="joinForm" naem="joinForm">
		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 text-center mb-5">
						<h2 class="heading-section">YANADO</h2>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-md-12 col-lg-7">
						<div class="login-wrap">
							<div class="signin-form d-md-flex">
								<div class="half p-4 py-md-5">
									<div class="w-100">
										<h3 class="mb-4">Sign up</h3>
									</div>
									<div class="form-group mt-3">
										<label class="label" for="name"">ID</label>
										<div class="form-group">
										<button type="submit"
											class="form-control btn btn-secondary rounded submit px-3"
											id="loginBtn"> 중복체크</button>
									</div>
										<!-- <input
											type="text" class="form-control" id = "id" placeholder="Username"
											> -->
										<!-- <input id="password-field" class="form-control" > -->
										<input type="text" name="id" class="id">
									</div>
									<div class="form-group">
										<label class="label" for="password" name="pw">Password</label>
										<input type="password" id="password-field" name="pw"
											class="pw"> <span toggle="#password-field"
											class="fa fa-fw fa-eye field-icon toggle-password"></span>
									</div>
									<div class="form-group">
										<label class="label" for="password" name="pw">Check Password</label>
										<input type="password" id="password-field" name="pw"
											class="pw"> <span toggle="#password-field"
											class="fa fa-fw fa-eye field-icon toggle-password"></span>
									</div>
									<div class="form-group">
										<label class="label" for="password" name="pw">E-mail</label>
										<input type="password" id="password-field" name="pw"
											class="pw"> 
									</div>
									<div class="form-group">
										<label class="label" for="password" name="pw">Phone number</label>
										<input type="password" id="password-field" name="pw"
											class="pw"> 
									</div>
									<div class="form-group">
										<label class="label" for="password" name="pw">Check number</label>
										<input type="password" id="password-field" name="pw"
											class="pw"> 
									</div>

									<div class="form-group">
										<button type="submit"
											class="form-control btn btn-secondary rounded submit px-3"
											id="loginBtn">Sign up</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</section>

		<script src="/resources/js/jquery.min.js"></script>
		<script src="/resources/js/popper.js"></script>
		<script src="/resources/js/bootstrap.min.js"></script>
		<script src="/resources/js/main.js"></script>




		<!-- 	 <td><input type="text" name="id" class= "id"></td>
				<td><input type="text" name="pw" class= "pw"></td>   -->

		<c:if test="${result == 0 }">
			<div class="loginWarn">사용자 id 또는 비밀번호를 잘못입력하셨습니다</div>
		</c:if>


	</form>
	<script>
		$("#loginBtn").click(function() {
			$("#loginForm").attr("action", "/login");
			$("#loginForm").submit();

		});

		$("#joinBtn").click(function() {
			$("#loginForm").attr("action", "/join");
			$("#loginForm").submit();

		});
	</script>

















	<!-- 
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
		</script> -->
</body>
</html>