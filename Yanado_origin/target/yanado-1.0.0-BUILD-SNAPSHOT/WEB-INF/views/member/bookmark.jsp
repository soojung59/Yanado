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
<link href="/resources/css/bookmark.css?ver=1" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div id="article" style="overflow: auto; width: 80%">
		<td>Id:<input type="text" class="id" name="id" id="id"
			value="${member.id }"></td>
		<div style="width: 50%;">
			<c:forEach var="bookmark" items="${bookmarkMem }" varStatus="status">
				<div class="card-container">
					<div class="card">
						<a href="/video/play">
							<div class="card--display">
								<i class="material-icons"><c:out value="${bookmark.TITLE}" /></i>
								<h2>${bookmark.SUBTITLE}</h2>
							</div>
							<div class="card--hover">
								<h2>my name is soojung choi</h2>
								<p>나는 최수정이다</p>
								<p class="link">이 장면부터 시청하기</p>
							</div>
						</a>
						<div class="card--border"></div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>