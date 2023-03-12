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
<link href="/resources/css/qnaWrite.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="write.do" method="post">
		<div id="article">
			<H1>Q&A 등록</H1>
			<div class="container">
				제목 <input type="text" class="title" id="title" name="title">
				<p>
					내용 <input type="text" class="cont" id="cont" name="cont">
				</p>
				<input type="hidden" name="id" value=${member.id }>
				<button>등록하기</button>
			</div>
		</div>
	</form>
</body>
</html>
