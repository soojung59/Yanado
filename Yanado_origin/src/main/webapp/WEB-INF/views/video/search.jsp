<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/includes/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/main.css?ver=1" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<h1 class="keyword" style="margin-left: 3%">    ${navKeyword} 검색 결과입니다.</h1>
	<div id= "searchList" style = " margin: 20 20 20 20;">
		<c:forEach var="poster" items="${search}">
			<div class="col-xs-12 col-sm-4">
				<div class="card"
					style="background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.2)), url(<c:out value="${poster.POSTER}" />);">
					<div class="card-category">
						<c:out value="${poster.TITLE}" />
					</div>
					<div class="">

						<a class="card-link" href='/video/play'></a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>




</body>
</html>