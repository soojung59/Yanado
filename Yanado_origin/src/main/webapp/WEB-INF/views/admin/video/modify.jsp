<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="/resources/css/write.css" rel="stylesheet" type="text/css">
<style>
.inputArea {
	margin: 10px 0;
}

select {
	width: 100px;
}

label {
	display: inline-block;
	width: 70px;
	padding: 5px;
	width: 70px;
}

input {
	width: 150px;
}

textarea#poster {
	width: 400px;
	height: 180px;
}

.select_img img {
	margin: 20px 0;
}
</style>

<title>write</title>


</head>
<body>
	<form class="contact-form row" role="form" name="viewForm"
		id="infoForm" method="GET">
		<section class="get-in-touch">
			<h1 class="title">modify Video</h1>

			<div class="form-field col-lg-6">
				<input id="uniqueNo" name="uniqueNo" class="input-text js-input"
					type="text" value="${result.uniqueNo }">
			</div>
			<div class="form-field col-lg-6 ">
				<input id="title" name="title" class="input-text js-input"
					type="text" value="${result.title }">
			</div>
			<div class="form-field col-lg-6 ">
				<input id="link" name="link" class="input-text js-input" type="text"
					value="${result.link }">
			</div>
			<div class="form-field col-lg-12">
				<input id="people" name="people" class="input-text js-input"
					type="text" value="${result.people }">
			</div>
			<div class="form-field col-lg-12">
				<input id="synop" name="synop" class="input-text js-input"
					type="text" value="${result.synop }">
			</div>
			<div class="form-field col-lg-12">
				<input id="subEng" name="subEng" class="input-text js-input"
					type="text" value="${result.subEng }">
			</div>
			<div class="form-field col-lg-12">
				<input id="subKor" name="subKor" class="input-text js-input"
					type="text" value="${result.subKor }">
			</div>
			<div class="form-field col-lg-12">
				<input id="subMix" name="subMix" class="input-text js-input"
					type="text" value="${result.subMix }">
			</div>
			<div class="form-field col-lg-12">
				<input id="poster" name="poster" class="input-text js-input"
					type="text" value="${poster.poster }" readonly="readonly">
			</div>

			<div class="form-field col-lg-12">
				<input id="teaser" name="teaser" class="input-text js-input"
					type="text" value="${teaser.teaserLink}" readonly="readonly">
			</div>
			<div class="form-field col-lg-12">
				<input class="submit-btn" id="modify" type="button" value="수정">
			</div>
			<div class="form-field col-lg-12">
				<input class="submit-btn" id="list_btn" type="button" value="목록">
			</div>
			<div class="form-field col-lg-12">
				<input class="submit-btn" id="delete" type="button" value="삭제">
			</div>
		</section>
	</form>
	<script type="text/javascript">
		let form = $("#infoForm");

		$("#modify").on("click", function(e) {
			form.attr("action", "/admin/video/modify.do");
			form.submit();
		});

		$("#list_btn").on("click", function(e) {
			form.find("#uniqueNo").remove();
			form.attr("action", "/admin/video/list");
			form.submit();
		});

		$("#delete").on("click", function(e) {
			form.attr("action", "/admin/video/delete.do");
			form.attr("method", "post");
			form.submit();
		});
	</script>
</body>
</html>