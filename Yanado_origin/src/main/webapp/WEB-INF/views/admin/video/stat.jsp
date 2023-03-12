<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/includes/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<title>Home</title>
<style type="text/css">
.zc-body {
	background: #454754;
}

.chart--container {
	height: 100%;
	width: 100%;
	min-height: 530px;
}

.zc-ref {
	display: none;
}

.container {
	
}

.counter-box {
	display: block;
	padding: 40px 20px 37px;
	text-align: center;
	width: 140px;
}

.counter-box p {
	margin: 5px 0 0;
	padding: 0;
	color: #909090;
	font-size: 18px;
	font-weight: 500
}

.counter-box i {
	font-size: 60px;
	margin: 0 0 15px;
	color: #d2d2d2
}

.counter {
	display: block;
	font-size: 32px;
	font-weight: 700;
	color: #666;
	line-height: 28px
}

.counter-box.colored {
	
}

.counter-box.colored p, .counter-box.colored i, .counter-box.colored .counter
	{
	color: #fff;
}

.stat {
	float: left;
}
</style>
</head>
<body>
	<div id="article">
		<h1 align="left">DATA</h1>
		<div class="container">
			<div class="row">
				<div class="stat">
					<div class="counter-box colored">
						<i class="fa fa-user"></i> <span class="counter">${todayLogin}</span>
						<p>Visitors today</p>
					</div>
				</div>
				<div class="stat">
					<div class="counter-box">
						<i class="fa fa-thumbs-o-up"></i> <span class="counter">${watchiedVideo}</span>
						<p>Video watched today</p>
					</div>
				</div>
				<div class="stat">
					<div class="counter-box">
						<i class="fa fa-group"></i> <span class="counter">${countMem }</span>
						<p>Total Members</p>
					</div>
				</div>
				<div class="stat">
					<div class="counter-box">
						<i class="fa fa-shopping-cart"></i> <span class="counter">${countVideo }</span>
						<p>Total Video</p>
					</div>
				</div>

			</div>
		</div>

	<div style="width: 500px; height: 900px;">
	<!--차트가 그려질 부분-->
	<canvas id="myChart"></canvas>
	</div>
	</div>
	<script>
	
	
    var context = document
    .getElementById('myChart')
    .getContext('2d');
var myChart = new Chart(context, {
    type: 'doughnut', // 차트의 형태
    data: { // 차트에 들어갈 데이터
        labels: [
            //x 축
            '1','2','3','4','5','6','7'
        ],
        datasets: [
            { //데이터
                label: 'test1', //차트 제목
                fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                data: [
                    21,19,25,20 //x축 label에 대응되는 데이터 값
                ],
                backgroundColor: [
                    //색상
                    'rgba(255, 99, 132)',
                    'rgba(54, 162, 235)',
                    'rgba(255, 206, 86)',
                    'rgba(75, 192, 192)',
                    'rgba(153, 102, 255)',
                    'rgba(255, 159, 64)'
                ],
                borderColor: [
                    //경계선 색상
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1 //경계선 굵기
            }
        ]
    },
    options: {
        scales: {
            yAxes: [
                {
                    ticks: {
                        beginAtZero: true
                    }
                }
            ]
        }
    }
});
	
		/* count */
		$(document).ready(function() {

			$('.counter').each(function() {
				$(this).prop('Counter', 0).animate({
					Counter : $(this).text()
				}, {
					duration : 1000,
					easing : 'swing',
					step : function(now) {
						$(this).text(Math.ceil(now));
					}
				});
			});

		});
	</script>
</body>
</html>