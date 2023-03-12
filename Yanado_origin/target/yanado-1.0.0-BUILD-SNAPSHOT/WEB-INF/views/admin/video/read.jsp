<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/includes/nav.jsp"%>
<%@ include file="/resources/includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<link href="/resources/css/write.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Home</title>
</head>

<body>

	<div class="contact-form row" >
		<section class="get-in-touch">
			<h1 class="title">Read Video</h1>

			<div class="form-field col-lg-6">
				<input id="uniqueNo" name="uniqueNo" class="input-text js-input"
					type="text" value="${result.uniqueNo }" readonly="readonly">
			</div>
			<div class="form-field col-lg-6 ">
				<input id="title" name="title" class="input-text js-input"
					type="text" value="${result.title }" readonly="readonly">
			</div>
			<div class="form-field col-lg-6 ">
				<input id="link" name="link" class="input-text js-input" type="text"
					value="${result.link }" readonly="readonly">
			</div>
			<div class="form-field col-lg-12">
				<input id="people" name="people" class="input-text js-input"
					type="text" value="${result.people }" readonly="readonly">
			</div>
			<div class="form-field col-lg-12">
				<input id="synop" name="synop" class="input-text js-input"
					type="text" value="${result.synop }" readonly="readonly">
			</div>
			<div class="form-field col-lg-12">
				<input id="subEng" name="subEng" class="input-text js-input"
					type="text" value="${result.subEng }" readonly="readonly">
			</div>
			<div class="form-field col-lg-12">
				<input id="subKor" name="subKor" class="input-text js-input"
					type="text" value="${result.subKor }" readonly="readonly">
			</div>
			<div class="form-field col-lg-12">
				<input id="subMix" name="subMix" class="input-text js-input"
					type="text" value="${result.subMix }" readonly="readonly">
			</div>
			<%-- <button data-oper='modify'
				onclick="location.href='/admin/video/modify?uniqueNo=<c:out value="${result.uniqueNo}"/>'">
				modify</button> --%>


			<div class="form-field col-lg-12">
				<input class="btn" id ="modify_btn" type="submit" value="수정"
					data-oper='modify'>
			</div>
			<div class="form-field col-lg-12">
				<input class="btn" id="list_btn" type="button" value="목록"
					>
			</div>
			<div class="form-field col-lg-12">
				<input class="btn" id="delete" type="button" value="삭제"
					>
			</div>
			<form id="infoform" action="/admin/video/modify" method="get">
				<input type = "hidden" id="uniqueNo" name="uniqueNo" value='<c:out value="${result.uniqueNo}"/>'>
				<input type="hidden" name="pageNum"	value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
			</form>
			
	</div>
	</section>
	<script type="text/javascript">
	
		let form = $("#infoForm");
		
		$("#list_btn").on("click", function(e){
			form.find("#uniqueNo").remove();
			form.attr("action","/admin/video/list");
			form.submit();
		});
	
		$("#modify_btn").on("click", function(e){
			form.find("#uniqueNo").remove();
			form.attr("action","/admin/video/modify");
			form.submit();
		});
		/* function addboard() {
			var form = document.getElementById("viewForm")
			form.action = "<c:url value = '/admin/video/update'/>";
			form.submit();

		}  */
/* 
		function board() {
			var form = document.getElementById("viewForm");
			form.action = "<c:url value = '/admin/video/list'/>";
			form.submit();
		}

		function deletePost() {
			var form = document.getElementById("viewForm");
			form.action = "<c:url value = '/admin/video/delete.do'/>";
			form.submit();
		} */
	</script>
</body>
</html>