<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#mytrainname').click(function(){
		var train_id=$('#train_id').text();
		var train_no=$('#btn-del').attr("alt");
		param="id="+train_id+"&no="+train_no;
		sendMessage("POST", "songlist.do", param, makesonglist);	
	});
	
	$('.btn-del').click(function(){
		var id=$('#myid').text();
		var train_no=$(this).attr("alt");
		param="id="+id+"&train_no="+train_no;
		sendMessage("POST", "deletetrain.do", param, deletetrain);	
	});

});

function makesonglist(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			$('#drivelist').html(httpRequest.responseText);
		}
	}
}
function deletetrain(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			var id=$('#myid').text();
			param="id="+id;
			$('#makelist').html(httpRequest.responseText);
			
			sendMessage("POST", "addtrain.do", param, footerdeletetrain);
		}
	}
}
function footerdeletetrain(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			$('#footer-list').html(httpRequest.responseText);
		}
	}
}

</script>
</head>
<body>
	<c:forEach var="vo" items="${list }">
		
		<li>
		<a class='thumbnail' href='#' id="myid"> ${vo.id}</a><br/>
			<div class='cart-con'>
				<h3 id="train_id">${vo.train_id}</h3>
				<span class='preview' id="mytrainname">${vo.train_name}</span>
				<span id="mytrainno">${vo.train_no }</span>
			</div>
			
			<input type="button" value="X" id="btn-del" class="btn-del" alt="${vo.train_no }">
			
		</li>
	
      	</c:forEach>
</body>
</html>