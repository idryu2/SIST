var width=840;
var height=475;
var ambilight; //youtube

var songNo = 0; //순서

var video_small = [];
var video_return = document.querySelectorAll('.video_return')[0];
var videoSize = document.querySelectorAll('#video')[0];
var prev = document.querySelectorAll('#prev')[0];
var next = document.querySelectorAll('#next')[0];
var videoCode = $('#video').attr('data-code');

$(document).ready(function() {

	prev.setAttribute('data-code', datacode[songNo-1]);
	videoSize.setAttribute('data-code', datacode[songNo]);
	next.setAttribute('data-code', datacode[songNo+1]);
	videoCode = $('#video').attr('data-code');
	
  $(document).ready(function() {
    return ambilight.on(videoCode, "#video");
  });

  ambilight = {
    on: function(yt_id, container) {
      $(container).append("<iframe width='"+width+"' height='"+height+"' src='//www.youtube.com/embed/" + yt_id + "?rel=0&controls=0&showinfo=0&autoplay=1' frameborder='0'></iframe>");
      return $("body").tubular({
        videoId: yt_id
      });
    }
  };
  
//prev,next 썸네일
  $('.video-t li').each(function() {
	    var code = $(this).attr('data-code');
	    $(this).css("background-image", "url(http://img.youtube.com/vi/" + code + "/0.jpg)");
	  });
  
  visible();
});

//다른 메뉴 클릭 시 화면 줄이기
for(var i=0; i<5; i++)
{
	video_small[i] = document.querySelectorAll('.video_small')[i];

	video_small[i].addEventListener('click', function() {
		document.getElementById('video').style.width='400px';
		document.getElementById('video').style.height='250px';
		document.getElementById('video').style.bottom='-880px';
		document.getElementById('video').style.left='-1400px';
		prev.classList.add("hidden");
		next.classList.add("hidden");
		document.getElementById('video-title').style.display='none';
		document.getElementById('video-list').style.display='none';
		document.getElementById('add_train').style.display='none';
		document.getElementById('footer-list').style.left='500px';
	});
}

//DRIVE메뉴 클릭 시 화면 원래대로
video_return.addEventListener('click', function() {
	document.getElementById('video').style.width='840px';
	document.getElementById('video').style.height='475px';
	document.getElementById('video').style.bottom='0';
	document.getElementById('video').style.left='0';
	prev.classList.remove("hidden");
	next.classList.remove("hidden");
	document.getElementById('video-title').style.display='block';
	document.getElementById('video-list').style.display='block';
	document.getElementById('add_train').style.display='block';
	document.getElementById('footer-list').style.left='300px';
});
//이전add_train.classList.ad버튼
prev.addEventListener('click', function() {
	songNo--;
	videoChange();
});

//다음버튼
next.addEventListener('click', function() {
	songNo++;
	videoChange();
});

//처음이면 prev가 안보이고 마지막이면 next가 안보임
function visible(){
	if($('#prev').attr('data-code')=="undefined")
	{
		document.getElementById('prev').style.display='none';
	}
	else
	{
		document.getElementById('prev').style.display='block';
	}
	if($('#next').attr('data-code')=="undefined")
	{
		document.getElementById('next').style.display='none';
	}
	else
	{
		document.getElementById('next').style.display='block';
	}
}

function videoChange(){
	// 원래 영상, 배경 제거
	$('div#video').remove();
	$('iframe#tubular-player').remove();
	
	// 다시 띄우기
	$('#video-reset').append("<div id='video' data-code=''></div>");

	videoSize = document.querySelectorAll('#video')[0];
	// 순서 변경
	prev.setAttribute('data-code', datacode[songNo-1]);
	videoSize.setAttribute('data-code', datacode[songNo]);
	next.setAttribute('data-code', datacode[songNo+1]);
	
	$('#tubular-container').append("<iframe id='tubular-player' frameborder='0' allowfullscreen='1' title='YouTube video player' width='1920' height='1080' src='https://www.youtube.com/embed/"+datacode[songNo]+"?rel=0&controls=0&showinfo=0&autoplay=1' frameborder='0'></iframe>");
	// 새 영상 띄우기
	videoCode = $('#video').attr('data-code');
	$(document).ready(function() {
		return ambilight.on(videoCode, "#video");
	});

	$('.video-t li').each(function() {
	    var code = $(this).attr('data-code');
	    $(this).css("background-image", "url(http://img.youtube.com/vi/" + code + "/0.jpg)");
	  });
    visible();
}