<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/js/popper.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/main.js"></script>
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
</head>
<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Sign up</h2>
				</div>
			</div>
			<form id="joinForm">
				<div class="row justify-content-center">
					<div class="col-md-12 col-lg-7">
						<div class="login-wrap">
							<div class="signin-form d-md-flex">
								<div class="half p-4 py-md-5">
									<div class="w-100">
										<!-- 	<h3 class="mb-4">Sign up</h3> -->
									</div>
									<div class="form-group mt-3">
										<label class="label" >ID</label> <input type="text"
											name="id" id="id" class="form-control">
										<div class="form-group">
											<span class="Checkid1">사용 가능한 아이디입니다.</span> <span
												class="Checkid2">아이디가 이미 존재합니다.</span>
										</div>
										<label class="label" >이름</label> <input type="text"
											name="name" id="name" class="form-control">
										<div class="form-group">
											<label class="label" for="password" >Password</label>
											<input type="password" name="pw" id="pw1"
												class="form-control">
										</div>
										<div class="form-group">
											<label class="label" for="password" name="pw">Check
												Password</label> <input type="password" name="pw2" id="pw2"
												class="form-control"> <span class="PWCheck1">비밀번호가
												일치합니다</span> <span class="PWCheck2">비밀번호 불일치합니다</span>
										</div>


										<div class="form-group">
											<label class="label">E-mail</label> <input type="text"
												name="email" id="email" class="form-control">
										</div>
										<button type="button" id="email_btn" class="form-control">
											인증번호받기</button>

										<div class="form-group">
											<label class="label" >Check number</label> <input
												type="number" name="emailAuthNum" id="emailAuthNum"
												class="form-control" disabled="disabled"> <span
												class="numcheck"></span>
										</div>

										<div class="form-group">
											<button type="submit"
												class="form-control btn btn-secondary rounded submit px-3"
												id="joinBtn">Sign up</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>



	<script>

		$("#joinBtn").click(function() {
			 $("#joinForm").attr("action", "/join.do");
			$("#joinForm").submit();

		});

		$('#id').on("propertychange change keyup paste input", function() {

			var id = $('#id').val();
			var data = {
				id : id
			}

			$.ajax({
				type : "post",
				url : "/idCheck",
				data : data,
				success : function(result) {
					if (result != 'fail') {
						$('.Checkid1').css("display", "inline-block");
						$('.Checkid2').css("display", "none");
					} else {
						$('.Checkid2').css("display", "inline-block");
						$('.Checkid1').css("display", "none");
					}
				}
			});
		});

		$(function() {

			$("#pw2").keyup(function() {
				var pw1 = $("#pw1").val();
				var pw2 = $("#pw2").val();
				if (pw1 != "" || pw2 != "") {
					if (pw1 == pw2) {
						$('.PWCheck1').css("display", "inline-block");
						$('.PWCheck2').css("display", "none");
					} else {
						$('.PWCheck2').css("display", "inline-block");
						$('.PWCheck1').css("display", "none");
					}

				}

			});
		});

		/* 인증번호 이메일 전송 */
		$("#email_btn").click(function() {
			var email = $("#email").val(); // 입력한 이메일
			var checkBox = $("#emailAuthNum"); // 인증번호 입력란
			var emailBtn = $("#email_btn");
			$.ajax({
				type : "GET",
				url : "mailCheck?email=" + email,
				success : function(data) {
					checkBox.attr("disabled", false);
					emailBtn.attr("id", "#email_after");
					code = data;
				}

			});

		});

		$("#emailAuthNum").blur(function() {
			var inputCode = $("#emailAuthNum").val();
			var checkResult = $(".numcheck");

			if (inputCode == code) {
				checkResult.html("인증번호가 일치합니다");
				checkResult.attr("class", "correct");
			} else {
				checkResult.html("인증번호를 다시 확인해주세요");
				checkResult.attr("class", "incorrect");
			}
		});
	</script>
</body>

</html>