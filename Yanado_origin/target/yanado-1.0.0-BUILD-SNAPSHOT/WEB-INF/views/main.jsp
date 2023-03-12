<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/includes/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/search.css?ver=1" rel="stylesheet"
	type="text/css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>

	<span class="target"></span>
	<figure>
		<video id="video" controls preload="metadata" width="80%">
			<source
				src="https://yanado2.s3.ap-northeast-2.amazonaws.com/madmax.mp4"
				type="video/mp4">
			<track label="English" kind="subtitles" srclang="en"
				src="https://yanado2.s3.ap-northeast-2.amazonaws.com/sintel_en.vtt"
				default> <track id="chaptersTrack01" class="chaptersTrack"
				src="resources/caption/sintel_en.vtt" kind="chapters" default>
		</video>

		<form method="get" action="/video/play.do">
			<main class="page-content">
				<c:forEach var="board" items="${video }" varStatus="status">
					<div class="card">
						<div class="content">
							<h2 class="title">
								<c:out value="${board.title}" />
							</h2>
							<p class="copy">
								<c:out value="${board.synop}" />
							</p>
							<button class="btn">watch</button>
						</div>
					</div>
		</form>
		</c:forEach>
		</main>

	</figure>
</body>
</html>