<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Home</title>
<style type="text/css">
.container {
	margin-top: 3em;
	position: static;
	font-size: 18px;
}

#title {
	font-size: 30px;
}

.title {
	border-bottom: 1px solid white;
}
</style>
</head>

<body>
	<div id="article">
		<form id="infoForm">
			<div class="container">
				<table>
					<tr>
						<th><input type="hidden" id="uniqueNo" name="uniqueNo"
							value="${result.uniqueNo }"></th>
					</tr>
					<tr>
						<th>title</th>
						<th><span  name="name"> ${result.title }</span></th>
					</tr>
					<tr>
						<th>link</th>
						<th><span class=address id="name" name="name">${result.link }</span>
						</th>
					</tr>
					<tr>
						<th>link</th>
						<th><span class="address" id="name" name="name">${result.link }</span>
						</th>
					</tr>
					<tr>
						<th>people</th>
						<th><span class="modify" id="name" name="name">${result.people }</span>
						</th>
					</tr>
					<tr>
						<th>synop</th>
						<th><span class="modify" id="name" name="name">${result.synop }</span>
						</th>
					</tr>
					<tr>
						<th>subEng</th>
						<th><span class="address" id="name" name="name">{result.subEng}</span></th>
					</tr>
					<tr>
						<th>subKor</th>
						<th><span class="address" id="name" name="name">${result.subKor }</span>
						</th>
					</tr>
					<tr>
						<th>subMix</th>
						<th><span class="address" id="name" name="name">${result.subMix }</span>
						</th>
					</tr>
					<tr>
						<th>poster</th>
						<th><span class="modify" id="name" name="name">${poster.poster }</span>
						</th>
					</tr>
					<tr>
						<th>teaserLink</th>
						<th><span class="address" id="name" name="name">${teaser.teaserLink }</span></th>
					</tr>
				</table>
			</div>
		</form>

		<input class="btn" id="modify_btn" type="submit" value="수정"	data-oper='modify'> 
		<input class="btn" id="list_btn" type="button" value="목록">
		 <input class="btn" id="delete" 	type="button" value="삭제">




	</div>
	<script type="text/javascript">
		let form = $("#infoForm");

		$("#list_btn").on("click", function(e) {
			form.find("#uniqueNo").remove();
			form.attr("action", "/admin/video/list");
			form.submit();
		});

		$("#modify_btn").on("click", function(e) {
			form.attr("action", "/admin/video/modify");
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