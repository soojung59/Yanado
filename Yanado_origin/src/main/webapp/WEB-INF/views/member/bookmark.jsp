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
	<div class="box">
	<h1>${member.id }님의 북마크</h1>
				<c:forEach var="bookmark" items="${bookmark }" >
					<a href='/video/playReco?uniqueNo=<c:out value="${bookmark.UNIQUENO}"/>
								&recentPo=<c:out value="${bookmark.SUBTIMESTAMP}"/>'>
						<div class="col-md-4">
							<div class="card">
								<h3>
									<c:out value="${bookmark.TITLE}" />
								</h3>
								<p>${bookmark.SUBTITLE}</p>
							</div>
					</div></a>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>