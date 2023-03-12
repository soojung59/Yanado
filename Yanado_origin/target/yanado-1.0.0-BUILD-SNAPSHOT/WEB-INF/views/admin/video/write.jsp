<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/includes/nav.jsp"%>
<%@ include file="/resources/includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="/resources/css/write.css" rel="stylesheet" type="text/css">
<style>
</style>

<title>write</title>


</head>
<body>
		<section class="get-in-touch">
			<h1 class="title">Write Video</h1>
			<form class="contact-form row" enctype="multipart/form-data"
				id="writeForm" name="writeForm" method="post">
				<div class="inputArea">
					<label for="poster">이미지</label> <input type="file" id="poster"
						name="uploadFile" />
					<div class="select_img">
						<img src="">
					</div>
					<%=request.getRealPath("/")%>
				</div>

				<div class="form-field col-lg-6">
					<input id="uniqueNo" name="uniqueNo" class="input-text js-input"
						type="text" placeholder="uniqueNo" required="required">
				</div>
				<div class="form-field col-lg-6 ">
					<input id="title" name="title" class="input-text js-input"
						type="text" placeholder="title" required="required">
				</div>
				<div class="form-field col-lg-6 ">
					<input id="link" name="link" class="input-text js-input"
						type="text" placeholder="link" required="required">
				</div>
				<div class="form-field col-lg-12">
					<input id="people" name="people" class="input-text js-input"
						type="text" placeholder="people" required="required">
				</div>
				<div class="form-field col-lg-12">
					<input id="synop" name="synop" class="input-text js-input"
						type="text" placeholder="synop" required="required">
				</div>
				<div class="form-field col-lg-12">
					<input id="subEng" name="subEng" class="input-text js-input"
						type="text" placeholder="subEng" required="required">
				</div>
				<div class="form-field col-lg-12">
					<input id="subKor" name="subKor" class="input-text js-input"
						type="text" placeholder="subKor" required="required">
				</div>
				<div class="form-field col-lg-12">
					<input id="subMix" name="subMix" class="input-text js-input"
						type="text" placeholder="subMix" required="required">
				</div>
				<div class="form-field col-lg-12">
					<input class="submit-btn" type="submit" value="save"
						onclick='addboard()'>
				</div>
			</form>
		</section>
	<script type="text/javascript">
		document.getElementById("uploadDate").value = new Date().toISOString()
				.substring(0, 10);
		$("#poster")
				.change(
						function() {
							if (this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src",
											data.target.result).width(500);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});

		function addboard() {

			var form = document.getElementById("writeForm");
			form.action = "<c:url value='/admin/video/write.do'/>";
			form.submit();
		}
	</script>
</body>
</html>