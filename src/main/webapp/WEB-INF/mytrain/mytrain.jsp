<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	param="id=admin";  // 로그인 되면 admin은 사용자 id로
	sendMessage("POST", "mytrainlist.do", param, callback)
	
	$('#MakeTrainBtn').click(function(){
		var name=$('#maketrainname').val();
		param="id=admin&name="+name;
		sendMessage("POST", "maketrain.do", param, maketrain);
	});
});

function callback(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			$('#makelist').html(httpRequest.responseText);
		}
	}
}
function footeraddtrain(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			$('#footer-list').html(httpRequest.responseText);
		}
	}
}
function maketrain(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			$('#makelist').html(httpRequest.responseText);
			var name=$('#maketrainname').val();
			$('#maketrainname').val("");
			param="id=admin&name="+name;
			sendMessage("POST", "addtrain.do", param, footeraddtrain);
		}
	}
}
</script>
</head>
<body>
	<div class="mypage" id="mypagecontainer">
		<div class="mypage" id="mypageleft">
			<div class="mypageleftside" id="trainname">trainname</div>
			<div class="mypageleftside" id="myartist">my artist</div>
			<div class="mypageleftside" id="mygenre"><a href="test.do">my genre</a></div>
		</div>
		
		<div class="mypage" id="mypagecenter">
			<div class="mypageceterside" id="maketrain">
				<input type="text" placeholder="MakeTrain" id="maketrainname">
				<input type="button" value="Make Train" id="MakeTrainBtn" >
			</div>
			<div class="mypagecenterside" id="makelist">
				 
			</div>
		</div>
		
		<div class="mypage" id="mypageright">
			<div class="mypagerightside" id="drivetrain">drive train</div>
			<div class="mypagerightside" id="drivelist"></div>
			
		</div>
		
	</div>
</body>
</html>