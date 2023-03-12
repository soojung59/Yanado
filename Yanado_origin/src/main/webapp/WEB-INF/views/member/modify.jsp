<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/resources/includes/nav.jsp"%>
<%@ include file="/resources/includes/sidebarMem.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/modify.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.container {
	margin-top: 3em;
	position: static;
	font-size: 18px;
}

.modify {
	border-left: 2px solid #000;
	border-right: 2px solid #000;
	border-bottom: 2px solid #000;
	height: 33px;
	width: 300px;
}

#id, #email {
	background-color: #d6d4d4;
}

.PWCheck1 {
	color: green;
	display: none;
}

.PWCheck2 {
	color: red;
	display: none;
}

#email_btn {
	background-color: #17223b;
	color: white;
}

#email_after {
	background-color: gray;
}
</style>
</head>
<body>
	<form id="modify" method="post">
		<div id="article">
			<H1>개인정보 수정</H1>
			<div class="container">
				<table>
					<tr>
						<th>id</th>
						<th><input class="modify" type="text" id="id" name ="id"
							value="${member.id }" readonly="readonly"></th>
					</tr>
					<tr>
						<th>별명</th>
						<th><input type="text" class="modify" id="name" name="name"
							value="${member.name }"></th>
					</tr>
					<tr>
						<th>비밀번호</th>
						<th><input type="password" class="modify" id="pw" name="pw"></th>
					</tr>
					<tr>
						<th>비밀번호 재확인</th>
						<th><input type="password" class="modify" id="pw2" name="pw2"></th>
						<th><span class="PWCheck1">비밀번호가 일치합니다</span> <span
							class="PWCheck2">비밀번호 불일치합니다</span></th>
					</tr>
					<tr>
						<th>이메일</th>
						<th><input type="text" class="modify" id="email" name="email"
							value="${member.email }" readonly="readonly"></th>
					</tr>
					<tr>
						<th></th>
						<th>
							<button id="modifyBtn">수정하기</button>
						</th>
					</tr>
				</table>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		$("#modifyBtn").click(function() {
			$("#modify").attr("action", "/member/modify.do");
			$("#modify").submit();

		});
		$(function() {

			$("#pw2").keyup(function() {
				var pw1 = $("#pw").val();
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
	</script>
</body>
</html>