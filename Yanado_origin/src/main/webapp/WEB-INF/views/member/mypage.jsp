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
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="/resources/css/watchingRecord.css">
<title>Insert title here</title>
<style type="text/css">
.fa-2x {
    font-size: 1.4em !important;
}
.card {
width: 200px;
margin-left: 20;
}
.container{
flex-direction: row;
    display: flex;
}
.card2{
padding: 20 20 20 20;
}
</style>
</head>
<body>
	<div id="article">
		<h1>${member.id }님의시청기록</h1>
		<div class="container">
			<c:forEach var="rec" items="${rec }">
				<div class="col-xs-12 col-sm-4">
					<div class="card"
						style="background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.2)), url(<c:out value="${rec.POSTER}" />);">
						<div class="card-category">
							<c:out value="${rec.TITLE}" />
						</div>
						<div class="card2">

							<a class="card-link" id="play" 
								onclick="playReco()" 
								href='/video/playReco?uniqueNo=<c:out value="${rec.UNIQUENO}"/>
								&recentPo=<c:out value="${rec.RECENTPO}"/>'></a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>