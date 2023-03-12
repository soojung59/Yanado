<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/videoSubtitle.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<style type="text/css">

.btn-img{
  cursor: pointer;
  background-color:transparent;
  position: absolute;

  width: 20px;
  background-color:transparent;
  border: none;
}

</style>
</head>
<body onbeforeunload="javascript:reco();">
<!-- <div class="btnImg" onclick="change()"><img class="btn-img" src="/resources/image/starAfter.png"></div> -->
<div class="size" id="subcontrol" onclick="subOpen()"> 
		    <img src="/resources/image/menu.png" style="position: relative; width:40px">
		  </div>
		  <div class="video-wrapper">
		    <video id="videoArea" poster="https://s3.amazonaws.com/demo.jwplayer.com/text-tracks/assets/sintel.jpg" controls muted crossorigin="anonymous">
		      <source src="https://content.jwplatform.com/videos/q1fx20VZ-kNspJqnJ.mp4" type="video/mp4">
		      <source src="https://content.jwplatform.com/videos/q1fx20VZ-27m5HpIu.webm" type="video/webm">
		      <track id="chaptersTrack01" class="chaptersTrack" src="https://yanado210630.s3.ap-northeast-2.amazonaws.com/subtitle/friends.vtt" kind="chapters" default>
		      <track src="https://yanado210630.s3.ap-northeast-2.amazonaws.com/subtitle/friends.vtt" kind="subtitles" default>
		    </video>
		    <div class="transcript" id="transcript"></div>
		    </div>
		  </div>
		  <c:forEach var="book" items="${book}">
		  	<div style="color:white">
		  		<c:if test="${book.subTimestamp == 57.746}">test</c:if>
		  		
		  	</div>
		  </c:forEach>
		  	<%-- <c:choose>
		   	<c:when test="${book}">
	      	<img src="/resources/image/starBefore.png">
	      	</c:when> 
	      	<c:otherwise>test</c:otherwise> 
			</c:choose> --%>
<script type="text/javascript">




$(".btn-img").click(function(){
	if($(this).src()=="/resources/image/starBefore.png"){
	$(".btn-img").prop("src","/resources/image/starAfter.png");
	}
	else{
		$(".btn-img").prop("src","/resources/image/starBefore.png");
	}
});	

	/* 시작시간 세팅 */
    $(document).ready(function() {
       var vid = document.getElementById("videoArea");
       var time = '<c:out value = "${recentPo}"/>'
       vid.currentTime = time;
    });
    var video = document.getElementById("videoArea");

    /* 시청기록 저장 */
    function reco() {
       var uniqueNo = '<c:out value = "${video.uniqueNo}"/>'
       var id = '<c:out value = "${member.id}"/>'
       var recentPo = video.currentTime;
       $.ajax({
          type : 'get',
          url : '/video/play/record.do',
          data : {
             "id" : id,
             "uniqueNo" : uniqueNo,
             "recentPo" : recentPo
             
            
          },
          success : function(data) {
          },
          error : function() {
          }
       })

    };

	/* 자막 및 북마크 show & hide */
	function subOpen() {
	    var subBtn = document.getElementById("subcontrol");
	    var sub = document.getElementById("transcript");
	    var video = document.getElementById("videoArea");
	    var toggle = document.getElementById("subcontrol");
	    if (sub.style.display == 'none') {
	        sub.style.display = 'block';
	        video.style.width = '74%';
	        toggle.style.left = '72.5%';

	    } else {
	        sub.style.display = 'none';
	        video.style.width = '100%';
	        toggle.style.left = '97%';
	    }
	}
/* 	
	$(function(){
		$('.bookmark').click(function(){
			$('img').attr('src','/resources/image/starAfter.png')
			alert("test");
			})
	});
	 */
	
		/* 북마크 */
		var $video;
		var cues;
		function book(event) {
			var i = event;
			var a = document.getElementsByClassName("bookmark");
			/* alert(a);
			$(".bookmark bookmark('+i+')").attr("src","/resources/image/starAfter.png") */
			var cues = $video[0].textTracks[0].cues;
			var startTime = cues[event].startTime;
			var subTitle = cues[event].text;
			var id = '<c:out value = "${member.id}"/>'
			var uniqueNo = '<c:out value = "${video.uniqueNo}"/>'
			$.ajax({
				url : '/video/bookmark.do',
				type : 'get',
				data : {
					"subTimestamp" : startTime,
					"id" : id,
					"uniqueNo" : uniqueNo,
					"subtitle" : subTitle
				},
				success : function(data) {
					alert("성공")
				},
				error : function() {
					alert("실패");
				}
			}) 
		};
	
		/* 자막 클릭 이벤트 */
	 $(function() {
	    var $videoWrapper = $('.video-wrapper');
	    $videoWrapper.each(function() {
	        $video = $(this).find('video');    /* 비디오 재생 */
	        var $transcript = $(this).find('.transcript');	/*  자막이 들어갈 div 위치 */
	        var vid = document.getElementById("videoArea");
	        $video.find('track[kind="chapters"]').on("load", function(evt) {
	            var $video  = $(this).closest('video');
	            var transcriptHtml = '';  /* 전체 자막 텍스트를 넣을 곳*/
	            cues = $video[0].textTracks[0].cues; 
	        	for (var i=0; i<cues.length; i++) {
	        		 transcriptHtml += 
	        		'<div style ="color:white" onclick="book('+i+')"><img class="bookmark('+i+')"  id="bookmark"src="/resources/image/starBefore.png"></div>'
	 	            +'<p role="button" tabindex="0" class="cuepoint" name="cuepoint'+cues[i].id+'" data-id="'+cues[i].id+'" data-start-time="'+cues[i].startTime+'" data-end-time="'+cues[i].endTime+'" style="margin-left: 40px">' + cues[i].text + '</p>';
	 	            }
	            $transcript.html(transcriptHtml);
	            
	            var $cuepoints = $transcript.find('.cuepoint');
	            /* 자막 클릭 이벤트 */
	            $cuepoints.click(function() {1
	                var $cuepoint = $(this);
	                var $videoWrapper = $cuepoint.closest('.video-wrapper');
	                var $transcript = $cuepoint.closest('.transcript');     /* 현재 누른 자막  */
	                $video = $videoWrapper.find('video');				
	                var $cuepoints = $transcript.find('.cuepoint');			/* 현재 누른 자막의 포인트 */
	                $video[0].currentTime = $cuepoint.data('startTime');	/* 비디오가 현재 누른 자막의 시작 점으로 이동 */
	                $cuepoints.each(function() {
	                    $(this).removeClass('active');					
	                });
	                $cuepoint.addClass('active');
	                /* 자막클릭했을경우 몇번쨰 자막인지 나타내는  */
	                var clickedValue = $(this).data("id");
	                myFunction(0);
	            });
	            
            
            var isScrolling = 0;
            /* 스크롤 할 경우 나타나는 이벤트 */
            $( ".transcript" ).scroll(function() {
            	/* 스크롤 할 경우 나타나는 이벤트 */
            	isScrolling = 1;
  				/* 스크롤을 멈췄을때 1초 뒤에 isScrolling	를 0 으로 바꿔서 기존 자막대로 가도록 한다. */          	
            	clearTimeout($.data(this, 'scrollTimer'));
            	$.data(this, 'scrollTimer', setTimeout(function() {
            		isScrolling = 0;
            	}, 1000)); 
            	
          	});
            /* 동영상 재생구간을 다른 곳으로 이동했을 때 */
           vid.onseeking = function(){
        	   myFunction(0);
           };
            /* 현재 비디오 재생 시간위치를 실시간으로 업데이트 한다. */
            vid.ontimeupdate = function(){myFunction(isScrolling)}; /* isScrolling을 넣어줘서 스크롤 중에는 실행 안되도록 한다. */
            
            var tempVal = 0;    /* 이전에 선택된 자막 id */
            function myFunction(event){
            	if (event == 0){
	            	for( var i=0; i<cues.length; i++){
	            		/* 현재 시간이 자막의 시작시간과 끝 시간 사이에 있으면 해당 자막을 표시한다. */
	                	if (vid.currentTime >= cues[i].startTime && vid.currentTime <= cues[i].endTime){
	                		/* 자막이 이전과 변했는지 변하지 않았는지 확인한다. 자박이 변화 했으면 다음 자막으로 스크롤 한다. */
	                		if (tempVal != cues[i].id){
	                			$('p[data-id='+tempVal+']').css({'font-weight':'normal' , 'color' : '#ececed'});
	                			tempVal = cues[i].id;
	                			/* p tag의 offsetTop 프로퍼티를 받아와서 스크롤을 그쪽으로 바로 보내도록 하는 코 */
	                			$('.transcript').animate({scrollTop : $('p[data-id='+cues[i].id+']').prop('offsetTop')},0);
	                			/* $transcript.html(transcriptHtml); */
	                			$('p[data-id='+cues[i].id+']').css({'font-weight':'bold' , 'color' : 'white'});
                      }
	                	}
	            	}
            	}
            }
            var tempHeight = $('.transcript').height();
      	});
        
    });
});
	</script>

</body>
</html>