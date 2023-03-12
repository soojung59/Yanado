<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/login.css">
</head>
<body>
	<form id="LoginForm" method="post">
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
										<h3 class="mb-4">Login</h3>
									</div>
									<p class="w-100 text-center" style="color: #b96b9f;">&mdash;
										Or Sign In With &mdash;</p>
									<div class="w-100">
										<p class="social-media d-flex justify-content-center">
											<a href="#"
												class="social-icon d-flex align-items-center justify-content-center"><span
												class="fa fa-facebook"></span></a> <a href="#"
												class="social-icon d-flex align-items-center justify-content-center"><span
												class="fa fa-twitter"></span></a>
										</p>
									</div>
									
									<div class="form-group mt-3">
										<label class="label" for="name"">ID</label>
										<!-- <input
											type="text" class="form-control" id = "id" placeholder="Username"
											> -->
										<input type="text" name="id" class="id">
									</div>
									<div class="form-group">
										<label class="label" for="password" name="pw">Password</label>
										<!-- <input id="password-field" class="form-control" > -->
										<input type="password" id="password-field" name="pw"
											class="pw"> <span toggle="#password-field"
											class="fa fa-fw fa-eye field-icon toggle-password"></span>
									</div>
									<div class="w-50 text-left">
										<label class="checkbox-wrap checkbox-primary mb-0">Remember
											Me <input type="checkbox" checked> <span
											class="checkmark"></span>
										</label>
									</div>
									<div class="w-50 text-md-right" style="color: black">
											<a href="#">Forgot Password</a>
									</div>
									<div class="form-group">
										<button type="submit"
											class="form-control btn btn-secondary rounded submit px-3"
											id="loginBtn">login</button>
									</div>
									
								
									<div class="form-group">
										<button type="submit"
											class="form-control btn btn-secondary rounded submit px-3"
											id="joinBtn" href="/join">Sign up</button>
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


</body>
</html>