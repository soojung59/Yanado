<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/includes/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="/resources/css/main.css" rel="stylesheet"
	type="text/css">
<style type="text/css">
.wrap {
	position: absolute;
	z-index: 3; 
	text-align: center;
}

a {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	max-width: 180px;
	text-decoration: none;
	border-radius: 4px;
	    padding: 10px 20px;
}

a.button {
	background-color: #f4f4f491;
	color: black;
position: absolute;
    width: 120px;
    font-size: 17px;
    left: 50px;
    top: 300px;
}
}

a.button:hover {
	color: black;
	box-shadow: rgba(255, 255, 255, 0.85) 0 0px 0px 40px inset;
}

a.button2 {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

a.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 80px 0px 2px inset;
}
#font{
    position: absolute;
    font-size: 1.5em;
    font-weight: bold;
    color: white;
    left: 50px;
 	top: 270px; 
    background: none;
 
}
</style>
</head>

<body>
	<div id="font">
		세상에서 제일 쓸데없고 해로운 말이<br>
		'그만하면 잘했어'야
	</div>
	<div class="wrap">
		<a href="#" class="button">시청하러가기</a>
	</div>
	<div class="imageMain" style="background-color: black; text-align: center;">
	<img src="resources/image/ttt.jpg" class="main"
		style="z-index: 1;  width:80%; height: 60%; position: realitive; ">
		</div>
	<!-- 로그인 후  -->

	<c:if test="${member.isOut == 0}">
		<div class="wrapper-grey padded">
			<div class="container">
				<c:forEach var="poster" items="${rec}">
					<div class="col-xs-12 col-sm-4">
						<div class="card"
							style="background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.2)), url(<c:out value="${poster.link}" />);">
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
		</div>
	</c:if>
	<div class="wrapper-grey padded" style="position: relative;">
		<h2>야나도 회원이 사랑하는 드라마</h2>
		<div class="arrow" onclick="left()">
			<div class="arrow-top" id="arrowtop"></div>
			<div class="arrow-bottom" id="arrowbottom"></div>
		</div>
		<div class="container" id="container">
			<c:forEach var="poster" items="${poster }">

				<div class="card"
					style="background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.2)),url(<c:out value="${poster.POSTER}" />);">
					<div class="card-category">
						<c:out value="${poster.TITLE}" />
					</div>
					<div id="menu" onclick="dis()">
						<div class="">
							<a class="card-link"
								href='/video/play?uniqueNo=<c:out value="${poster.UNIQUENO}"/>'></a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="arrow2" onclick="right()">
			<div class="arrow-top" id="arrow-top"></div>
			<div class="arrow-bottom" id="arrow-bottom"></div>
		</div>
		<!-- <button class="right" onclick="right()">-></button> -->
	</div>
	<script type="text/javascript">
		function dis() {
			if ($('#synop').css('display') == 'none') {
				$('#synop').show();
			} else {
				$('#synop').hide();
			}
		};

		function left() {
			var _scrollX = $('#container').scrollLeft();
			$('#container').scrollLeft(_scrollX - 500);
		};
		function right() {
			var _scrollX = $('#container').scrollLeft();
			$('#container').scrollLeft(_scrollX + 500);
		};
	</script>
</body>
</html>