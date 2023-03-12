<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/includes/nav.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

</head>


<body>

	<form id="play" action="/video/play" method="get">
		<div class="video-wrapper"
			style="border: 1px solid; position: relative;">
			<video id="videoArea" controls 
				poster="https://s3.amazonaws.com/demo.jwplayer.com/text-tracks/assets/sintel.jpg"
				 width=70%> <source
				value="123" id="uniqueNo2"
				src="https://content.jwplatform.com/videos/q1fx20VZ-kNspJqnJ.mp4"
				type="video/mp4"> <!-- 클릭할 자막  --> 
				<track
				src="/resources/caption/friends.vtt"
				kind="chapters" default></video>

			<div id="subTitleArea" class="transcript"
				style="color: black; font-size: 15px; left: 70%; width: 30%; top:1%; height: 98%; position: absolute; z-index: 9998; overflow-y: scroll; text-align: left"></div>
		</div>
		<tr>
			<td>Id:<input type="text" class="id" name="id" id="id"
				value="${member.id }"></td>
		</tr>
		<p>Playback position: <span id="demo"></span></p>
		<p>script: <span id="subtitle"></span></p>
		<p>임의지정uniqueNo<input type="text" class="uniqueNo"
			name="uniqueNo" id="uniqueNo" value="10000104"></p>
		<c:forEach var="bookmark" items="${bookMark }">
			<c:choose>
				<c:when test="${null eq bookmark.subTimestamp}">
					<a href="#">${bookmark.subTimestamp } <img
						src="/resources/image/star_before.png" id="btn_like" align="left"
						style="cursor: pointer; width: 20px;">
					</a>
				</c:when>
				<c:otherwise>
					<a href="#"> <img src="/resources/image/star_after.png"
						id="btn_like" align="left" style="cursor: pointer;  width: 20px;">
					</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</tr>
	</form>
<script type="text/javascript">

/* 북마크 */
var $video;
var cues;
function bookMarkFcn(event) {
	var cues = $video[0].textTracks[0].cues; 
	var startTime = cues[event].startTime;
	var subTitle = cues[event].text;
	
	var id = $("#id").val();
	var uniqueNo = $("#uniqueNo").val();
	
	$.ajax({
			url : '/video/bookmark.do',
			type : 'get',
			data : {
				"subTimestamp" : startTime,
				"id" : id,
				"uniqueNo" : uniqueNo,
				"subtitle": subTitle
			},
			success : function(data) {
				alert("성공")
			},
			error : function() {
				alert("실패");
			}
		})
};


/* 좌우키 클릭 이벤트 */
window.addEventListener("keydown", function(e){
	if(e.keyCode == 37){
		// left
		console.log(cues.length);
		for(var j=0;j<cues.length; j++){
			if ($video[0].currentTime > cues[j].startTime && $video[0].currentTime <= cues[j].endTime){
				$video[0].currentTime = cues[j-1].startTime; 
			}else if( $video[0].currentTime > cues[j].endTime && $video[0].currentTime <= cues[j+1].startTime){
				$video[0].currentTime = cues[j].startTime; 
			}
		} 
	}else if(e.keyCode == 39){
		// right
		for(var j=0;j<cues.length; j++){
			if ($video[0].currentTime > cues[j].startTime && $video[0].currentTime <= cues[j].endTime){
				$video[0].currentTime = cues[j+1].startTime; 
			}else if( $video[0].currentTime > cues[j].endTime && $video[0].currentTime <= cues[j+1].startTime){
				$video[0].currentTime = cues[j+1].startTime; 
			}
		} 
	} 
})


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
        		transcriptHtml += '<a onClick="bookMarkFcn('+i+'); return false;"><img  src="/resources/image/star_before.png"   style=" width: 20px;position: absolute; left: 10px" ></a>';
        		
                transcriptHtml += '<p role="button" tabindex="0" class="cuepoint" name="cuepoint'+cues[i].id+'" data-id="'+cues[i].id+'" data-start-time="'+cues[i].startTime+'" data-end-time="'+cues[i].endTime+'" style="margin-left: 100px">' + cues[i].text + '</p>';
            }
            $transcript.html(transcriptHtml);
            
            var $cuepoints = $transcript.find('.cuepoint');
            /* 자막 클릭 이벤트 */
            $cuepoints.click(function() {
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